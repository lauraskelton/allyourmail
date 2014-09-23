//
//  InboxDisplayDataCollection.swift
//  allyourmail
//
//  Created by Laura Skelton on 9/23/14.
//  Copyright (c) 2014 skelovenko. All rights reserved.
//

import Foundation

class InboxDisplayDataCollection {
    var sections : Dictionary<String, [InboxDisplayItem]> = Dictionary()
    
    init() {
    }
    
    func addInboxItems(inboxItems: [InboxItem]) {
        for inboxItem in inboxItems {
            addInboxItem(inboxItem)
        }
    }
    
    func addInboxItem(inboxItem: InboxItem) {
        var displayItem = displayItemForInboxItem(inboxItem)
        addDisplayItem(displayItem, priority: "one")
    }
    
    func addDisplayItem(displayItem: InboxDisplayItem, priority: String) {
        if var realSection : [InboxDisplayItem] = sections[priority] {
            realSection.append(displayItem)
            sections[priority] = realSection
        } else {
            var newSection : [InboxDisplayItem] = []
            newSection.append(displayItem)
            sections[priority] = newSection
        }
    }
    
    func displayItemForInboxItem(inboxItem: InboxItem) -> InboxDisplayItem {
        let displayItem = InboxDisplayItem(from: inboxItem.from, subject: inboxItem.subject, message: inboxItem.message)
        return displayItem
    }
    
    func collectedDisplayData() -> InboxDisplayData {
        let collectedSections : [InboxDisplaySection] = sortedInboxDisplaySections()
        return InboxDisplayData(sections: collectedSections)
    }
    
    func displaySectionForPriority(priority: String) -> InboxDisplaySection {
        let sectionTitle = sectionTitleForPriority(priority)
        let imageName = sectionImageNameForPriority(priority)
        let items = sections[priority]
        
        return InboxDisplaySection(name: sectionTitle, imageName: imageName, items: items)
    }
    
    func sortedInboxDisplaySections() -> [InboxDisplaySection] {
        let keys = sortedPriorities()
        var displaySections : [InboxDisplaySection] = []
        
        for priority in keys {
            var itemArray = sections[priority]
            
            if (itemArray != nil) {
                var displaySection = displaySectionForPriority(priority)
                displaySections.insert(displaySection, atIndex: displaySections.endIndex)
            }
        }
        
        return displaySections
    }
    
    func sortedPriorities() -> [String] {
        var array : [String] = []
        array.insert("one", atIndex: 0)
        return array
    }
    
    func sectionTitleForPriority(priority: String) -> String {
        switch priority {
        case "one":
            return "Top Priority"
        default:
            return ""
        }
    }
    
    func sectionImageNameForPriority(priority: String) -> String {
        switch priority {
        case "one":
            return "first"
        default:
            return ""
        }
    }
}
