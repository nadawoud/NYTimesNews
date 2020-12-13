//
//  ArticleCell.swift
//  NYTimes News
//
//  Created by Nada Yehia Dawoud on 13/12/2020.
//

import UIKit

class ArticleCell: UITableViewCell {

    static let reuseID = "ArticleCell"
    let padding: CGFloat = 10
    
    let articleImageView = NYTArticleThumbnailImageView(frame: .zero)
    let titleLabel = NYTTitleLabel(textAlignment: .left, fontSize: 16)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureImageView()
        configureTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(article: Article) {
        titleLabel.text = article.title
    }
    
    
    private func configureImageView() {
        addSubview(articleImageView)
        
        NSLayoutConstraint.activate([
            articleImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            articleImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2 * padding),
            articleImageView.heightAnchor.constraint(equalToConstant: 60),
            articleImageView.widthAnchor.constraint(equalTo: articleImageView.heightAnchor)
        ])
    }
    
    
    private func configureTitleLabel() {
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: articleImageView.trailingAnchor, constant: padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
        ])
    }
}
