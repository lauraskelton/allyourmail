//
//  InboxInteractor.swift
//  allyourmail
//
//  Created by Laura Skelton on 9/23/14.
//  Copyright (c) 2014 skelovenko. All rights reserved.
//

import Foundation

class InboxInteractor : NSObject, InboxInteractorInput {
    var output : InboxInteractorOutput?
    
    let dataManager : InboxDataManager
    
    init(dataManager: InboxDataManager) {
        self.dataManager = dataManager
    }
    
    func findInboxItems() {
        
        dataManager.mailItems( { mailItems in
                let inboxItems = self.inboxItemsFromMailItems(mailItems)
                self.output?.foundInboxItems(inboxItems)
        })
    }
    
    func inboxItemsFromMailItems(mailItems: [MailItem]) -> [InboxItem] {
        let calendar = NSCalendar.autoupdatingCurrentCalendar()
        let flags: NSCalendarUnit = .DayCalendarUnit | .MonthCalendarUnit | .YearCalendarUnit | .EraCalendarUnit
        var components = calendar.components(flags, fromDate: NSDate())
        let today = calendar.dateFromComponents(components)
        
        var inboxItems : [InboxItem] = []
        
        for mailItem in mailItems {
            
            components = calendar.components(flags, fromDate: mailItem.date)
            let otherDate = calendar.dateFromComponents(components)

            let isToday = (otherDate == today)

            let inboxItem = InboxItem(from: mailItem.from, subject: mailItem.subject, message: mailItem.message, date: mailItem.date, isToday: isToday)
            inboxItems.insert(inboxItem, atIndex: inboxItems.endIndex)
        }
        
        return inboxItems
    }
}
