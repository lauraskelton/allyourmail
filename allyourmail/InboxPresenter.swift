//
//  InboxPresenter.swift
//  allyourmail
//
//  Created by Laura Skelton on 9/23/14.
//  Copyright (c) 2014 skelovenko. All rights reserved.
//

import Foundation
import UIKit

class InboxPresenter : NSObject, InboxInteractorOutput, InboxModuleInterface {
    var inboxInteractor : InboxInteractorInput?
    var inboxWireframe : InboxWireframe?
    var userInterface : InboxViewInterface?
    
    func updateView() {
        inboxInteractor?.findInboxItems()
    }
    
    func foundInboxItems(inboxItems: [InboxItem]) {
        if inboxItems.count == 0 {
            userInterface?.showNoContentMessage()
        } else {
            updateUserInterfaceWithInboxItems(inboxItems)
        }
    }
    
    func updateUserInterfaceWithInboxItems(inboxItems: [InboxItem]) {
        let inboxDisplayData = inboxDisplayDataWithItems(inboxItems)
        userInterface?.showInboxDisplayData(inboxDisplayData)
    }
    
    func inboxDisplayDataWithItems(inboxItems: [InboxItem]) -> InboxDisplayData {
        let collection = InboxDisplayDataCollection()
        collection.addInboxItems(inboxItems)
        return collection.collectedDisplayData()
    }
    
}
