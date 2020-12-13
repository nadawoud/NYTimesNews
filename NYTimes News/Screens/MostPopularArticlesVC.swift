//
//  MostPopularArticlesVC.swift
//  NYTimes News
//
//  Created by Nada Yehia Dawoud on 10/12/2020.
//

import UIKit

class MostPopularArticlesVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    func configureViewController() {
        view.backgroundColor = .systemBackground
    }
        
    }
    
    func getPopularArticles() {
        NetworkManager.shared.getMostViewedArticles(in: .week) { (result) in
            switch result {
            
            case .success(let articlesData):
                print("PopularArticlesData")
                print(articlesData)
                
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }
}
