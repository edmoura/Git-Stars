//
//  AttributedStringExtensions+.swift
//  GitStars
//
//  Created by Edson iMAC on 25/01/2019.
//  Copyright © 2019 Edson Moura. All rights reserved.
//

import UIKit

extension NSMutableAttributedString {
    func setFontForText(_ textToFind: String?, with font: UIFont) {
        let range: NSRange?
        if let text = textToFind {
            range = self.mutableString.range(of: text, options: .caseInsensitive)
        } else {
            range = NSMakeRange(0, self.length)
        }
        if range!.location != NSNotFound {
            addAttribute(NSAttributedString.Key.font, value: font, range: range!)
        }
    }
    func setColorForText(_ textToFind: String?, with color: UIColor) {
        let range: NSRange?
        if let text = textToFind {
            range = self.mutableString.range(of: text, options: .caseInsensitive)
        } else {
            range = NSMakeRange(0, self.length)
        }
        if range!.location != NSNotFound {
            addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range!)
        }
    }
}

