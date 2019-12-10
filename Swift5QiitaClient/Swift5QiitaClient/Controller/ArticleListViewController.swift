//
//  ArticleListViewController.swift
//  Swift5QiitaClient
//
//  Created by Kazuki Maeda on 2019/12/09.
//  Copyright © 2019 Kazuki Maeda. All rights reserved.
//

import UIKit

class ArticleListViewController: UIViewController {
    
    let titleLabel = UILabel()
    var items = [Article]()
    var tableView = UITableView()
    let client: ArticleListAPIClientProtocol
    
    init(client: ArticleListAPIClientProtocol = ArticleListAPIClient()) {
        self.client = client
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        titleLabel.text = "Title"
        tableView.dataSource = self
        tableView.delegate = self
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        
        client.fetch { [weak self] (articleList) in
            guard
                let articleList = articleList,
                0 < articleList.count else {return}
            
            self?.titleLabel.text = articleList[0].title
            self?.items = articleList
            // print(self!.items.count)
            self?.tableView.reloadData()
         }
        tableView.register(ArticleListCell.self, forCellReuseIdentifier: "ArticleListCell")
        view.addSubview(tableView)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        titleLabel.frame = view.bounds
        tableView.frame = view.bounds
    }
    
    func getTopViewController() -> UIViewController? {
        if let rootViewController = UIApplication.shared.keyWindow?.rootViewController {
            var topViewController: UIViewController = rootViewController

            while let presentedViewController = topViewController.presentedViewController {
                topViewController = presentedViewController
            }
            print(topViewController.debugDescription)

            return topViewController
        } else {
            return nil
        }
    }

}

extension ArticleListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(items.count)
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ArticleListCell = tableView.dequeueReusableCell(withIdentifier: "ArticleListCell", for: indexPath) as! ArticleListCell
        
        let article = items[(indexPath as NSIndexPath).row]
        cell.titleLabel.text = article.title
        print(article.title)
        
        return cell
    }
    
    
}
