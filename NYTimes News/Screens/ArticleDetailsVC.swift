//
//  ArticleDetailsVC.swift
//  NYTimes News
//
//  Created by Nada Yehia Dawoud on 14/12/2020.
//

import UIKit

class ArticleDetailsVC: UIViewController {

    struct Padding {
        static let leading: CGFloat = 20
        static let trailing: CGFloat = -15
        static let inBetween: CGFloat = 10
    }
    
    var article: Article!
    
    let dateLabel = NYTLabel(textAlignment: .left, textStyle: .body, color: .secondaryLabel)
    let articleTitleLabel = NYTLabel(textAlignment: .left, textStyle: .title1, color: .label)
    let abstractLabel = NYTLabel(textAlignment: .left, textStyle: .body, color: .label)
    let byLineLabel = NYTLabel(textAlignment: .left, textStyle: .headline, color: .label)
    let articleImageView = NYTImageView(cornerRadius: 0)
    let captionLabel = NYTLabel(textAlignment: .center, textStyle: .caption1, color: .secondaryLabel)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureDateLabel()
        configureArticleTitleLabel()
        configureAbstractLabel()
        configureByLineLabel()
        configureArticleImageView()
    }
    
    
    func configureDateLabel() {
        view.addSubview(dateLabel)
        dateLabel.text = article.publishedDate
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Padding.inBetween),
            dateLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Padding.leading),
            dateLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Padding.trailing),
            dateLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
    
    
    func configureArticleTitleLabel() {
        view.addSubview(articleTitleLabel)
        articleTitleLabel.text = article.title
        
        NSLayoutConstraint.activate([
            articleTitleLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: Padding.inBetween),
            articleTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Padding.leading),
            articleTitleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Padding.trailing),
            articleTitleLabel.heightAnchor.constraint(equalToConstant: 140)
        ])
    }
    
    
    func configureAbstractLabel() {
        view.addSubview(abstractLabel)
        abstractLabel.text = article.abstract.isEmpty ? article.title : article.abstract
        
        NSLayoutConstraint.activate([
            abstractLabel.topAnchor.constraint(equalTo: articleTitleLabel.bottomAnchor, constant: Padding.inBetween),
            abstractLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Padding.leading),
            abstractLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Padding.trailing),
            abstractLabel.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    
    func configureByLineLabel() {
        view.addSubview(byLineLabel)
        byLineLabel.text = article.byline
        
        NSLayoutConstraint.activate([
            byLineLabel.topAnchor.constraint(equalTo: abstractLabel.bottomAnchor, constant: Padding.inBetween),
            byLineLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Padding.leading),
            byLineLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Padding.trailing),
            byLineLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    func configureArticleImageView () {
        view.addSubview(articleImageView)
        
        if let imageURL = article.media.first?.mediaMetadata.last?.url {
            articleImageView.downloadImage(from: imageURL)
        }
        
        NSLayoutConstraint.activate([
            articleImageView.topAnchor.constraint(equalTo: byLineLabel.bottomAnchor, constant: Padding.inBetween),
            articleImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            articleImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            articleImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 250)
        ])
    }
}
