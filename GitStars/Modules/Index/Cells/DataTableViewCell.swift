//
//  DataTableViewCell.swift
//  GitStars
//
//  Created by Edson iMAC on 26/01/2019.
//  Copyright © 2019 Edson Moura. All rights reserved.
//

import UIKit
import SDWebImage
import SkeletonView

protocol DataTableProtocol {
    func updateCell(item: Items?)
    func startSkeleton()
}

class DataTableViewCell: UITableViewCell, DataTableProtocol {
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelAuthor: UILabel!
    @IBOutlet weak var labelStar: UILabel!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var stackViewTitle: UIStackView!
    @IBOutlet weak var stackStarView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.img.backgroundColor = UIColor.init(red: 239 / 255, green: 239 / 255, blue: 239 / 255, alpha: 1)
        self.loading.stopAnimating()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func startSkeleton() {
        self.labelName.showAnimatedSkeleton()
        self.labelAuthor.showAnimatedSkeleton()
        self.stackStarView.showAnimatedSkeleton()
        self.img.showAnimatedSkeleton()
    }
    
    func updateCell(item: Items?) {
        self.labelName.hideSkeleton()
        self.labelAuthor.hideSkeleton()
        self.stackStarView.hideSkeleton()
        self.img.hideSkeleton()
        self.loading.startAnimating()
        self.img.backgroundColor = UIColor.init(red: 239 / 255, green: 239 / 255, blue: 239 / 255, alpha: 1)
        img.sd_setImage(with: URL(string: item?.owner?.avatar_url ?? "")) { (image, error, cacheType, imageURL) in
            self.img.image = image
            self.loading.stopAnimating()
            self.img.backgroundColor = UIColor.clear
        }
        self.labelName.text = item?.name?.capitalized
        self.labelAuthor.text = item?.owner?.login?.capitalized
        self.labelStar.text = item?.watchers_count?.formattedWithSeparator
    }
}
