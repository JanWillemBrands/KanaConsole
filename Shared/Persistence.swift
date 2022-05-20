//
//  Persistence.swift
//  Shared
//
//  Created by Johannes Brands on 04/05/2022.
//

import CoreData
import CloudKit

struct PersistenceController {
    
    static let shared = PersistenceController()
    
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        for _ in 0 ..< 10 {
            let newItem = TestItem(context: viewContext)
            newItem.session = UUID()
            newItem.timestamp = Date()
            newItem.rightanswer = Int.random(in: 0...9)
            newItem.givenanswer = Int.random(in: 0...9)
            newItem.choices = [0, 1, 2]
            newItem.mode = KanaMode.random()
        }
        do {
            try viewContext.save()
        } catch {
            logger.error("\(#function) save preview viewContext failed")
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
    
    let container: NSPersistentCloudKitContainer
    
    init(inMemory: Bool = false) {
        
        container = NSPersistentCloudKitContainer(name: "KanaKana")
        
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.viewContext.automaticallyMergesChangesFromParent = true
        
        guard let description = container.persistentStoreDescriptions.first else {
            logger.error("Failed to retrieve a persistent store description.")
            fatalError("###\(#function): Failed to retrieve a persistent store description.")
        }
        
        description.cloudKitContainerOptions?.databaseScope = .public
        
        /// https://www.avanderlee.com/swift/persistent-history-tracking-core-data/
        //        description.setOption(true as NSNumber, forKey: NSPersistentHistoryTrackingKey)
        //        description.setOption(true as NSNumber, forKey: NSPersistentStoreRemoteChangeNotificationPostOptionKey)
        
        //        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
        // Pin the viewContext to the current generation token and set it to keep itself up to date with local changes.
        
        
        //        do {
        //            try container.viewContext.setQueryGenerationFrom(.current)
        //        } catch {
        //            fatalError("###\(#function): Failed to pin viewContext to the current generation:\(error)")
        //        }
        
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                logger.error("\(#function) Failed to load persistent stores.")
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}
