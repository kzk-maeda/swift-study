//
//  ArticleListAPIClientProtocol.swift
//  Swift5QiitaClient
//
//  Created by Kazuki Maeda on 2019/12/09.
//  Copyright © 2019 Kazuki Maeda. All rights reserved.
//

import Foundation

protocol ArticleListAPIClientProtocol {
    func fetch(completion: @escaping (([Article]?) -> Void))
}
