//
//  InboxDisplayItem.swift
//  allyourmail
//
//  Created by Laura Skelton on 9/23/14.
//  Copyright (c) 2014 skelovenko. All rights reserved.
//

import Foundation

struct InboxDisplayItem : Equatable, Printable {
    let from : String
    let subject : String
    let message : String
    let dateString : String

    var description : String { get {
        return "\(from) -- \(subject)"
        }}
    
    init(from: String, subject: String, message: String, dateString: String) {
        self.from = from
        self.subject = subject
        self.message = message
        self.dateString = dateString
    }
}

func == (leftSide: InboxDisplayItem, rightSide: InboxDisplayItem) -> Bool {
    var hasEqualSections = false
    hasEqualSections = rightSide.from == leftSide.from
    
    if hasEqualSections == false {
        return false
    }
    
    hasEqualSections = rightSide.subject == leftSide.subject
    
    if hasEqualSections == false {
        return false
    }
    
    hasEqualSections = rightSide.message == rightSide.message
    
    return hasEqualSections
}
