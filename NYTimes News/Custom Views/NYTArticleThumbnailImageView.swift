//
//  NYTArticleThumbnailImageView.swift
//  NYTimes News
//
//  Created by Nada Yehia Dawoud on 13/12/2020.
//

import UIKit

class NYTArticleThumbnailImageView: UIImageView {
    
    let placeholderImage = UIImage(named: "placeholder")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        contentMode = .scaleAspectFill
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
}
