//
//  MostPopularArticlesVC.swift
//  NYTimes News
//
//  Created by Nada Yehia Dawoud on 10/12/2020.
//

import UIKit

class MostPopularArticlesVC: UIViewController {
    
    var tableView = UITableView()
    var articles: [Article] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        getPopularArticles()
        configureTableView()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
    }
    
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
        tableView.pin(to: view)
        tableView.register(ArticleCell.self, forCellReuseIdentifier: ArticleCell.reuseID)
    }
    
    
    func getPopularArticles() {
        NetworkManager.shared.getMostViewedArticles(in: .week) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            
            case .success(let articlesData):
                self.articles.append(contentsOf: articlesData.results)
                DispatchQueue.main.async { self.tableView.reloadData() }
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }
}


extension MostPopularArticlesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.reuseID) as! ArticleCell
        let article = articles[indexPath.row]
        cell.set(article: article)
        
        return cell
    }
}
