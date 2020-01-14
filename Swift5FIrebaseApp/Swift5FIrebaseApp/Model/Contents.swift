//
//  Contents.swift
//  Swift5FirebaseApp
//
//  Created by Kazuki Maeda on 2020/01/14.
//  Copyright © 2020 Kazuki Maeda. All rights reserved.
//

import Foundation

class Contents {
    var userNameString: String = ""
    var profileImageString: String = ""
    var contentImageString: String = ""
    var commentString: String = ""
    var postDateString: String = ""
    
    init(userNameString:String, profileImageString:String, contentImageString:String, commentString:String, postDateString:String) {
        self.userNameString = userNameString
        self.profileImageString = profileImageString
        self.contentImageString = contentImageString
        self.commentString = commentString
        self.postDateString = postDateString
    }
}
