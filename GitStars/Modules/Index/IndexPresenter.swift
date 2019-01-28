//
//  IndexPresenter.swift
//  GitStars
//
//  Created by Edson iMAC on 25/01/2019.
//Copyright © 2019 Edson Moura. All rights reserved.
//

import Foundation
import Viperit

// MARK: - IndexPresenter Class
final class IndexPresenter: Presenter {
    let per_page = 10
    var isFetching: Bool = false
    var isLoading: Bool = true
    var currentPage = 1
    var list = [Items]()
    
    override func viewHasLoaded() {
        loadContent()
    }
}

// MARK: - IndexPresenter API
extension IndexPresenter: IndexPresenterApi {
    func loadContent() {
        view.configLargeTitles(isLarge: true)
        view.configTitle(title: "Git", subTitle: "Stars")
        view.configTableView()
        getLists()
    }
    
    func refreshData() {
        if list.count >= per_page {
            self.currentPage = 1
            self.isFetching = true
            self.isLoading = false
            getLists(isRefresh: true)
        }
    }
    
    private func getLists(isRefresh: Bool = false) {
        isRefresh == true ? self.list.removeAll() : nil
        interactor.getList(language: "swift", sort: "stars", page: currentPage, per_page: per_page) { (result) in
            switch result {
            case .success(let data):
                if data.items?.isEmpty == false {
                    for repo in data.items ?? [] {
                        self.list.append(repo)
                    }
                    self.isLoading = false
                    self.isFetching = false
                    self.view.reloadTableViewData()
                    self.view.endRefreshing()
                }
            case .failure(let error):
                print("error: \(error)")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as? DataTableViewCell else {
                return UITableViewCell()
            }
            if let _list = list[exist: indexPath.row] {
                cell.updateCell(item: _list)
            } else if isLoading == true {
                cell.startSkeleton()
            }
            cell.isAccessibilityElement = true
            cell.accessibilityIdentifier = "cell--dataTableViewCell--\(indexPath.row)"
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "loadingCell", for: indexPath) as? LoadingTableViewCell else {
                return UITableViewCell()
            }
            cell.startLoading()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         if let _list = list[exist: indexPath.row] {
            router.showWebView(item: _list)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row > 1 {
            if indexPath.row == (list.count - 1) && !isFetching && !isLoading {
                self.isFetching = true
                currentPage += 1
                view.getTableView().reloadSections( IndexSet(integer: 1), with: .left)
                getLists()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UITableView.automaticDimension
        } else {
            return 50
        }
    }
    
    func getNumberOfSections() -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            if isLoading == true {
                return per_page
            } else {
                return list.count
            }
        } else {
            return 1
        }
    }
}

// MARK: - Index Viper Components
private extension IndexPresenter {
    var view: IndexViewApi {
        return _view as! IndexViewApi
    }
    var interactor: IndexInteractorApi {
        return _interactor as! IndexInteractorApi
    }
    var router: IndexRouterApi {
        return _router as! IndexRouterApi
    }
}
