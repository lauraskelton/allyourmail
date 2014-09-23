//
//  InboxDataManager.swift
//  allyourmail
//
//  Created by Laura Skelton on 9/23/14.
//  Copyright (c) 2014 skelovenko. All rights reserved.
//

import Foundation

class InboxDataManager : NSObject {
    var coreDataStore : CoreDataStore?
    
    func mailItems(completion: (([MailItem]) -> Void)!) {
        
        let predicate = NSPredicate(format: "(from != nil)")
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: false)
        let sortDescriptors = [sortDescriptor]
        
        coreDataStore?.fetchEntriesWithPredicate(predicate,
            sortDescriptors: sortDescriptors,
            completionBlock: { entries in
                let mailItems = self.mailItemsFromDataStoreEntries(entries)
                completion(mailItems)
        })
    }
    
    func mailItemsFromDataStoreEntries(entries: [ManagedMailItem]) -> [MailItem] {
        var mailItems : [MailItem] = []
        
        for managedMailItem in entries {
            let mailItem = MailItem(from: managedMailItem.from, subject: managedMailItem.subject, message: managedMailItem.message, date: managedMailItem.date)
            mailItems.append(mailItem)
        }
        
        return mailItems
    }
}
