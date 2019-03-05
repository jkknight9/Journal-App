//
//  Entry.swift
//  CreativeJournalApp
//
//  Created by Jack Knight on 3/4/19.
//  Copyright © 2019 Jack Knight. All rights reserved.
//

import Foundation

class Entry: Equatable, Codable {
    
    var title: String
    var text: String
    var timeStamp: Date?
    
    init(title: String, text: String, timeStamp: Date = Date()) {
        
        self.title = title
        self.text = text
        self.timeStamp = timeStamp
        
    }
    
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.title == rhs.title && lhs.text == rhs.text && lhs.timeStamp == rhs.timeStamp
    }
}
