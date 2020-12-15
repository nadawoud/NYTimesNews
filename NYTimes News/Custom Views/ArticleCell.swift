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
    
    let articleImageView = NYTThumbnailImageView(frame: .zero)
    let titleLabel = NYTTitleLabel(textAlignment: .left, fontSize: 14)
    let byLineLabel = NYTLabel(textAlignment: .left, textStyle: .caption1, color: .secondaryLabel)
    let dateLabel = NYTLabel(textAlignment: .left, textStyle: .caption1, color: .secondaryLabel)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureImageView()
        configureTitleLabel()
        configureByLineLabel()
        configureDateLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(article: Article) {
        titleLabel.text = article.title
        byLineLabel.text = article.byline
        dateLabel.setTextPrependedBySFSymbol(article.publishedDate, symbolName: "calendar")
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
            titleLabel.heightAnchor.constraint(equalToConstant: 32),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
        ])
    }
    
    
    private func configureByLineLabel() {
        addSubview(byLineLabel)
        
        NSLayoutConstraint.activate([
            byLineLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0.25 * padding),
            byLineLabel.leadingAnchor.constraint(equalTo: articleImageView.trailingAnchor, constant: padding),
            byLineLabel.heightAnchor.constraint(equalToConstant: 14),
            byLineLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
        ])
    }
    
    
    private func configureDateLabel() {
        addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: byLineLabel.bottomAnchor, constant: 0.125 * padding),
            dateLabel.leadingAnchor.constraint(equalTo: articleImageView.trailingAnchor, constant: padding),
            dateLabel.heightAnchor.constraint(equalToConstant: 14),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
        ])
    }
}
