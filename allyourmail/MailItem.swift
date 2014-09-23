//
//  MailItem.swift
//  allyourmail
//
//  Created by Laura Skelton on 9/23/14.
//  Copyright (c) 2014 skelovenko. All rights reserved.
//

import Foundation

struct MailItem {
    let from : String
    let subject : String
    let message : String
    
    init(from: String, subject: String, message: String) {
        self.from = from
        self.subject = subject
        self.message = message
    }
}

