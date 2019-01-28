//
//  IndexMockView.swift
//  GitStarsTests
//
//  Created by Edson iMAC on 28/01/2019.
//  Copyright © 2019 Edson Moura. All rights reserved.
//

import UIKit
import Viperit
@testable import GitStars

class IndexMockView: UserInterface, IndexViewApi {
    func configLargeTitles(isLarge: Bool) { }
    func configTitle(title: String, subTitle: String) {}
    func configTableView() {}
    func reloadTableViewData() {}
    func endRefreshing() {}
    func getTableView() -> UITableView {
        return UITableView()
    }
}
