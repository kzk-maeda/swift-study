//
//  TodoModel.swift
//  Swift5RealmTodoApp
//
//  Created by Kazuki Maeda on 2019/12/04.
//  Copyright © 2019 Kazuki Maeda. All rights reserved.
//

import Foundation
import RealmSwift


class TodoModel: Object {
    @objc dynamic var id: String? = nil
    @objc dynamic var itemName: String? = nil
    @objc dynamic var itemDetail: String? = nil
    @objc dynamic var dueDate: Date? = nil
    @objc dynamic var createdDate: Date? = nil
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
