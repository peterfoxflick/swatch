//
//  SwatchDataManger.swift
//  Swatch
//
//  Created by Peter Flickinger on 6/13/20.
//  Copyright © 2020 Peter Flickinger. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI


class SwatchDataManger {
    
    let managedObjectContext: NSManagedObjectContext

    init(context: NSManagedObjectContext = CoreDataManager.shared.backgroundContext) {
        self.managedObjectContext = context
    }
    
    
    func addSwatch(pID: UUID, id:UUID, r: Int16, g: Int16, b:Int16, name: String) -> Swatch? {
        let s = Swatch(context: managedObjectContext)
        s.name = name
        s.r = r
        s.g = g
        s.b = b
        s.id = id
        
        let p = PaletteDataManger().getPalette(id: pID)
        s.palette = p
        
        do {
            try self.managedObjectContext.save()
        } catch {
            print(error)
        }
        
        return s
    }
    
    func getSwatch(id:UUID) -> Swatch? {
        var swatches = [Swatch]()
        
        let request: NSFetchRequest<Swatch> = Swatch.fetchRequest()
        request.predicate = NSPredicate(format: "%K == %@", "id", id as CVarArg)
        
        do {
            try? CoreDataManager.shared.persistentContainer.viewContext.setQueryGenerationFrom(.current)
            swatches = try self.managedObjectContext.fetch(request)
        } catch let error as NSError {
            print(error)
        }
        
        return swatches.first
    }
    
    
    func updateSwatch(pID: UUID, id:UUID, name:String, r: Int16, g: Int16, b:Int16) -> Swatch? {
        var s = getSwatch(id: id)
        if(s != nil) {
            s!.name = name
            s!.r = r
            s!.g = g
            s!.b = b
            
            do {
                try self.managedObjectContext.save()
            } catch {
                print(error)
            }
            
            return s
        } else {
            return addSwatch(pID: pID, id: id, r: r, g: g, b: b, name: name)
        }
    }
    
    func deleteSwatch(id:UUID){
        do {
            if let s = getSwatch(id: id) {
                self.managedObjectContext.delete(s)
                try self.managedObjectContext.save()
            }
        } catch let error as NSError {
            print(error)
        }
    }
}
