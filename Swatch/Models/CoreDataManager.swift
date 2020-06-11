//
//  CoreDataManager.swift
//  Swatch
//
//  Created by Peter Flickinger on 6/9/20.
//  Copyright © 2020 Peter Flickinger. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI

/**
The following naming convention is used for ease of use with the database

Action
C: Add
R: Get
U: Update
D: Delete

Name of function:
ActionObject(param)

If the object is plural expect an array, otherwise a single object

The Core data manager will only work with pure model classes, ie all ViewModels will not be used within this class. Instead the viewModel is responsible for converting an object/class to its own use.

Functions should be classified by their return type, and orderd by their action.

**/

class CoreDataManager {
    static let shared = CoreDataManager()

    lazy var persistentContainer: NSPersistentContainer! = {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer
    }()
    
    lazy var backgroundContext: NSManagedObjectContext = {
        let context = self.persistentContainer.newBackgroundContext()
        context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy

        return context
    }()

    lazy var managedObjectContext: NSManagedObjectContext = {
        let context = self.persistentContainer.viewContext
        context.automaticallyMergesChangesFromParent = true

        return context
    }()
}
