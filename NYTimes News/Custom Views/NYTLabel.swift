//
//  NYTByLineLabel.swift
//  NYTimes News
//
//  Created by Nada Yehia Dawoud on 13/12/2020.
//

import UIKit

class NYTLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(textAlignment: NSTextAlignment, textStyle: UIFont.TextStyle, color: UIColor) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        font = UIFont.preferredFont(forTextStyle: textStyle)
        textColor = color
        configure()
    }
    
    
    private func configure() {
        numberOfLines = 0
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }

}
