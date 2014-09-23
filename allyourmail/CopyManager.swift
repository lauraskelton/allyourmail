//
//  CopyManager.swift
//  allyourmail
//
//  Created by Laura Skelton on 9/23/14.
//  Copyright (c) 2014 skelovenko. All rights reserved.
//

import Foundation

class CopyManager : NSObject {
    var dataStore : CoreDataStore?
    
    func saveNewEntry(from: String, subject: String, message: String, date: NSDate) {
        let newEntry = dataStore!.newMailItem() as ManagedMailItem
        newEntry.from = from
        newEntry.subject = subject;
        newEntry.message = message;
        newEntry.date = date;

        dataStore?.save()
    }
}
