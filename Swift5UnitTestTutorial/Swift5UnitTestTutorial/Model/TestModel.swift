//
//  TestModel.swift
//  Swift5UnitTestTutorial
//
//  Created by Kazuki Maeda on 2019/12/09.
//  Copyright © 2019 Kazuki Maeda. All rights reserved.
//

import Foundation

class Test: NSObject {
    var statusCode:Int
    
    override init() {
        self.statusCode = 0
    }
    
    func log(text: String) throws {
        if text.isEmpty {
            self.statusCode = -1
            throw NSError(domain: "error", code: self.statusCode, userInfo: nil)
        }
        
        print(text)
    }
    
}
