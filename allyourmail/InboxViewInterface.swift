//
//  InboxViewInterface.swift
//  allyourmail
//
//  Created by Laura Skelton on 9/23/14.
//  Copyright (c) 2014 skelovenko. All rights reserved.
//

import Foundation

protocol InboxViewInterface {
    func showNoContentMessage()
    func showInboxDisplayData(data: InboxDisplayData)
    func reloadEntries ()
}
