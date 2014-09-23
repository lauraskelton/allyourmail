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
        let sortDescriptors = []
        
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
            let mailItem = MailItem(from: managedMailItem.from, subject: managedMailItem.subject, message: managedMailItem.message)
            mailItems.append(mailItem)
        }
        
        return mailItems
    }
}
