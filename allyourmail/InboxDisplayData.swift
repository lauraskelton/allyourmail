//
//  InboxDisplayData.swift
//  allyourmail
//
//  Created by Laura Skelton on 9/23/14.
//  Copyright (c) 2014 skelovenko. All rights reserved.
//

import Foundation

struct InboxDisplayData : Equatable {
    let sections : [InboxDisplaySection] = []
    
    init(sections: [InboxDisplaySection]) {
        self.sections = sections
    }
}

func == (leftSide: InboxDisplayData, rightSide: InboxDisplayData) -> Bool {
    var hasEqualSections = false
    hasEqualSections = rightSide.sections == leftSide.sections
    return hasEqualSections
}
