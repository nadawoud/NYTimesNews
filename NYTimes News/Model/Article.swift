//
//  Article.swift
//  NYTimes News
//
//  Created by Nada Yehia Dawoud on 11/12/2020.
//

import Foundation

struct PopularArticlesData: Codable {
    let numResults: Int
    let results: [Article]
}


struct Article: Codable {
    let url: String
    let publishedDate: String
    let byline: String
    let title: String
    let abstract: String
    let section: String
    let media:[Media]
    
    struct Media: Codable {
        let caption: String
        let mediaMetadata: [MediaMetadata]?
        
        struct MediaMetadata: Codable {
            let url: String
            let format: String
        }
    }
}
