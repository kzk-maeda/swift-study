//
//  ArticleListCell.swift
//  Swift5QiitaClient
//
//  Created by Kazuki Maeda on 2019/12/10.
//  Copyright © 2019 Kazuki Maeda. All rights reserved.
//

import UIKit

class ArticleListCell: UITableViewCell {
    
    let titleLabel = UILabel()
    
    override func layoutSubviews() {
        super .layoutSubviews()
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8.0).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8.0).isActive = true
    }
    
    func configure(title: String) {
        titleLabel.text = title
    }
}
