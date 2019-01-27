//
//  LoadingTableViewCell.swift
//  GitStars
//
//  Created by Edson iMAC on 26/01/2019.
//  Copyright © 2019 Edson Moura. All rights reserved.
//

import UIKit
import Lottie

protocol LoadingTableProtocol {
    func startLoading()
}

class LoadingTableViewCell: UITableViewCell, LoadingTableProtocol {
    private var animationView: LOTAnimationView? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
        if animationView == nil {
            animationView = LOTAnimationView(name: "loader1")
            animationView?.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50)
            animationView?.contentMode = .scaleAspectFit //.scaleAspectFill
            animationView?.loopAnimation = true
            self.addSubview(animationView!)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func startLoading() {
        animationView?.play()
    }
}
