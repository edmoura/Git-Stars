//
//  IndexModuleApi.swift
//  GitStars
//
//  Created by Edson iMAC on 25/01/2019.
//Copyright © 2019 Edson Moura. All rights reserved.
//

import Viperit

//MARK: - IndexRouter API
protocol IndexRouterApi: RouterProtocol {
    func showWebView(item: Items?)
}

//MARK: - IndexView API
protocol IndexViewApi: UserInterfaceProtocol {
    func configLargeTitles(isLarge: Bool)
    func configTitle(title: String, subTitle: String)
    func configTableView()
    func reloadTableViewData()
    func endRefreshing()
    func getTableView() -> UITableView
}

//MARK: - IndexPresenter API
protocol IndexPresenterApi: PresenterProtocol {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    func getNumberOfSections() -> Int
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    func refreshData()
}

//MARK: - IndexInteractor API
protocol IndexInteractorApi: InteractorProtocol {
    func getList(language: String, sort: String, page: Int, per_page: Int, callback: @escaping(Result<Repositories>) -> Void)
    func cancelRequest()
}
