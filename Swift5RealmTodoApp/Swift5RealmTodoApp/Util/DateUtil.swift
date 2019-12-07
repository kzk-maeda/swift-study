//
//  DateUtil.swift
//  Swift5RealmTodoApp
//
//  Created by Kazuki Maeda on 2019/12/05.
//  Copyright © 2019 Kazuki Maeda. All rights reserved.
//

import Foundation

class DateUtils {
    class func dateFromString(string: String, format: String) -> Date {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        return formatter.date(from: string)!
    }

    class func stringFromDate(date: Date, format: String) -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}
