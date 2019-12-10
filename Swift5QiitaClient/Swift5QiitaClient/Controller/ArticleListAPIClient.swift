//
//  ArticleListAPIClient.swift
//  Swift5QiitaClient
//
//  Created by Kazuki Maeda on 2019/12/09.
//  Copyright © 2019 Kazuki Maeda. All rights reserved.
//

import Foundation

class ArticleListAPIClient: ArticleListAPIClientProtocol {
    func fetch(completion: @escaping (([Article]?) -> Void)) {
        guard let url = URL(string: "https://qiita.com/api/v2/items") else {
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            guard let data = data else {
                return
            }
            print(data)
            let articleList = try? JSONDecoder()
                .decode([Article].self, from: data)
            DispatchQueue.main.async {
                completion(articleList)
            }
        }.resume()
    }
    
}
