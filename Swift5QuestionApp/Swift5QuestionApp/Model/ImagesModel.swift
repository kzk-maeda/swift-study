//
//  ImagesModel.swift
//  Swift5QuestionApp
//
//  Created by Kazuki Maeda on 2019/12/07.
//  Copyright © 2019 Kazuki Maeda. All rights reserved.
//

import Foundation

class ImagesModel {
    // Get Image and Jadge that Image whether human or not by using frag.
    
    let imageText: String
    let answer: Bool
    
    init(imageName:String, correctOrNot:Bool) {
        imageText = imageName
        answer = correctOrNot
    }
}
