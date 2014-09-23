//
//  CoreDataStore.swift
//  allyourmail
//
//  Created by Laura Skelton on 9/23/14.
//  Copyright (c) 2014 skelovenko. All rights reserved.
//

import Foundation
import CoreData

extension Array {
    func lastObject() -> T {
        let endIndex = self.endIndex
        let lastItemIndex = endIndex - 1
        
        return self[lastItemIndex]
    }
}

class CoreDataStore : NSObject {
    var persistentStoreCoordinator : NSPersistentStoreCoordinator?
    var managedObjectModel : NSManagedObjectModel?
    var managedObjectContext : NSManagedObjectContext?
    
    override init() {
        managedObjectModel = NSManagedObjectModel.mergedModelFromBundles(nil)
        
        persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel!)
        
        let domains = NSSearchPathDomainMask.UserDomainMask
        let directory = NSSearchPathDirectory.DocumentDirectory
        
        let error = NSError()
        let applicationDocumentsDirectory : AnyObject = NSFileManager.defaultManager().URLsForDirectory(directory, inDomains: domains).lastObject()
        let options = [NSMigratePersistentStoresAutomaticallyOption : true, NSInferMappingModelAutomaticallyOption : true]
        
        let storeURL = applicationDocumentsDirectory.URLByAppendingPathComponent("allyourmail.sqlite")
        
        persistentStoreCoordinator!.addPersistentStoreWithType(NSSQLiteStoreType, configuration: "", URL: storeURL, options: options, error: nil)
        
        managedObjectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.MainQueueConcurrencyType)
        managedObjectContext!.persistentStoreCoordinator = persistentStoreCoordinator
        managedObjectContext!.undoManager = nil
        
        super.init()
    }
    
    func fetchEntriesWithPredicate(predicate: NSPredicate, sortDescriptors: [AnyObject], completionBlock: (([ManagedMailItem]) -> Void)!) {
        let fetchRequest = NSFetchRequest(entityName: "MailItem")
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = []
        
        managedObjectContext?.performBlock {
            let queryResults = self.managedObjectContext?.executeFetchRequest(fetchRequest, error: nil)
            let managedResults = queryResults! as [ManagedMailItem]
            completionBlock(managedResults)
        }
    }
    
    func newMailItem() -> ManagedMailItem {
        let entityDescription = NSEntityDescription.entityForName("MailItem", inManagedObjectContext: managedObjectContext!)
        let newEntry = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext) as ManagedMailItem
        
        return newEntry
    }
    
    func save() {
        managedObjectContext?.save(nil)
    }
}
