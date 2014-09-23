//
//  ManagedMailItem.swift
//  allyourmail
//
//  Created by Laura Skelton on 9/23/14.
//  Copyright (c) 2014 skelovenko. All rights reserved.
//

import Foundation
import CoreData

class ManagedMailItem : NSManagedObject {
    
    @NSManaged var from: String
    @NSManaged var subject: String
    @NSManaged var message: String
    
}
