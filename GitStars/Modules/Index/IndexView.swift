//
//  IndexView.swift
//  GitStars
//
//  Created by Edson iMAC on 25/01/2019.
//Copyright © 2019 Edson Moura. All rights reserved.
//

import UIKit
import Viperit

//MARK: IndexView Class
final class IndexView: UserInterface {
    private let fontSize: CGFloat = 18
    private let numberOfLines: Int = 2
    private let refreshControl = UIRefreshControl()
    @IBOutlet weak var tableView: UITableView!
}

//MARK: - IndexView API
extension IndexView: IndexViewApi {
    func configLargeTitles(isLarge: Bool) {
        self.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationController?.navigationBar.prefersLargeTitles = isLarge
    }
    
    func configTitle(title: String, subTitle: String) {
        if self.navigationController?.navigationBar.prefersLargeTitles == true {
            self.navigationItem.title = "\(title) \(subTitle)"
        } else {
            let navLabel = UILabel()
            navLabel.numberOfLines = numberOfLines
            navLabel.textAlignment = .center
            navLabel.textColor = .white
            let _title = "\(title) \(subTitle)"
            let navTitle = NSMutableAttributedString(string: _title)
            navTitle.setFontForText(title, with:UIFont.systemFont(ofSize: fontSize, weight: .black))
            navTitle.setFontForText(subTitle, with:UIFont.systemFont(ofSize: fontSize, weight: .ultraLight))
            navLabel.attributedText = navTitle
            self.navigationItem.titleView = navLabel
        }
    }
    
    func configTableView() {
        let dataCellNib = UINib(nibName: "DataTableViewCell", bundle: nil)
        let loadingCell = UINib(nibName: "LoadingTableViewCell", bundle: nil)
        self.tableView.register(dataCellNib, forCellReuseIdentifier: "dataCell")
        self.tableView.register(loadingCell, forCellReuseIdentifier: "loadingCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 165
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.tableFooterView = UIView(frame: .zero)
        self.tableView.isAccessibilityElement = true
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.accessibilityIdentifier = "table--articleTableView"
        if self.navigationController?.navigationBar.prefersLargeTitles == true {
            self.tableView.refreshControl = refreshControl
            self.extendedLayoutIncludesOpaqueBars = true
            
        } else {
            self.tableView.addSubview(refreshControl)
        }
        self.refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
    }
    
    @objc func refreshData(_ sender: Any) {
        self.presenter.refreshData()
    }
    
    func endRefreshing() {
        self.refreshControl.endRefreshing()
    }
    
    func reloadTableViewData() {
        self.tableView.reloadData()
    }
    
    func getTableView() -> UITableView {
        return tableView
    }
}

extension IndexView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.tableView(tableView, numberOfRowsInSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return presenter.tableView(tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return presenter.tableView(tableView, didSelectRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        return presenter.tableView(tableView, willDisplay: cell, forRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return presenter.tableView(tableView, heightForRowAt: indexPath)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.getNumberOfSections()
    }
}


// MARK: - IndexView Viper Components API
private extension IndexView {
    var presenter: IndexPresenterApi {
        return _presenter as! IndexPresenterApi
    }
    var displayData: IndexDisplayData {
        return _displayData as! IndexDisplayData
    }
}
