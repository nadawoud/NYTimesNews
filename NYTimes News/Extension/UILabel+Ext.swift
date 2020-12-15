//
//  UILabel+Ext.swift
//  NYTimes News
//
//  Created by gk-plastics as a GitHub Gist.
//  Link: https://gist.github.com/gk-plastics/f4ad7c3f4ffec57003ea8e2e7b7a7107
//  Copied by Nada Yehia Dawoud on 15/12/2020.
//

import UIKit

extension UILabel {
    
    func setTextPrependedBySFSymbol(_ text: String, symbolName: String, font: UIFont? = nil) {
        if #available(iOS 13.0, *) {
            
            if let font = font { self.font = font }
            let symbolConfiguration = UIImage.SymbolConfiguration(font: self.font)
            let symbolImage = UIImage(systemName: symbolName, withConfiguration: symbolConfiguration)?.withRenderingMode(.alwaysTemplate)
            let symbolTextAttachment = NSTextAttachment()
            symbolTextAttachment.image = symbolImage
            let attributedText = NSMutableAttributedString()
            attributedText.append(NSAttributedString(attachment: symbolTextAttachment))
            attributedText.append(NSAttributedString(string: " " + text))
            self.attributedText = attributedText
        
        } else {
            self.text = text // fallback
        }
    }
}
