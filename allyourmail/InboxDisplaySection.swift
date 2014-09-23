//
//  InboxDisplaySection.swift
//  allyourmail
//
//  Created by Laura Skelton on 9/23/14.
//  Copyright (c) 2014 skelovenko. All rights reserved.
//

import Foundation

struct InboxDisplaySection : Equatable {
    let name : String = ""
    let imageName : String = ""
    var items : [InboxDisplayItem] = []
    
    init(name: String, imageName: String, items: [InboxDisplayItem]?) {
        self.name = name
        self.imageName = imageName
        
        if (items != nil) {
            self.items = items!
        }
    }
}

func == (leftSide: InboxDisplaySection, rightSide: InboxDisplaySection) -> Bool {
    var hasEqualSections = false
    hasEqualSections = rightSide.items == leftSide.items
    return hasEqualSections
}
