//
//  CoreDataStack.swift
//  addtasks
//
//  Created by Diellza Bajrami on 7/11/20.
//  Copyright © 2020 dardan bakiu. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack{
    
    var container: NSPersistentContainer{
        let container = NSPersistentContainer(name: "Todos")
        container.loadPersistentStores{(description, error) in
            
            guard error == nil else {
                print("Error: \(error!)")
                return
    }
}
return container
}
    
    var managedContext: NSManagedObjectContext{
        return container.viewContext
    }
}
