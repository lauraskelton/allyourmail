//
//  InboxItem.swift
//  allyourmail
//
//  Created by Laura Skelton on 9/23/14.
//  Copyright (c) 2014 skelovenko. All rights reserved.
//

import Foundation

struct InboxItem : Equatable {
    let from : String = ""
    let subject : String = ""
    let message : String = ""
    
    init(from: String, subject: String, message: String) {
        self.from = from
        self.subject = subject
        self.message = message
    }
}

func == (leftSide: InboxItem, rightSide: InboxItem) -> Bool {
    var hasEqualSections = false
    hasEqualSections = rightSide.from == leftSide.from
    
    if hasEqualSections == false {
        return false
    }
    
    hasEqualSections = rightSide.subject == rightSide.subject
    
    if hasEqualSections == false {
        return false
    }
    
    hasEqualSections = rightSide.message == rightSide.message
    
    return hasEqualSections
}
