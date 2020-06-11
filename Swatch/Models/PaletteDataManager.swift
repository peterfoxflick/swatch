//
//  PaletteDataManager.swift
//  Swatch
//
//  Created by Peter Flickinger on 6/10/20.
//  Copyright © 2020 Peter Flickinger. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI


class PaletteDataManger {
    
    let managedObjectContext: NSManagedObjectContext

    init(context: NSManagedObjectContext = CoreDataManager.shared.backgroundContext) {
        self.managedObjectContext = context
    }

    func addPalette(name:String) -> Palette? {
        let p = Palette(context: managedObjectContext)
        p.name = name
        p.id = UUID()
        
        do {
            try self.managedObjectContext.save()
        } catch {
            print(error)
        }
        
        return p
    }
    
    func getPalette(name:String) -> Palette? {
        var palettes = [Palette]()
        
        let request: NSFetchRequest<Palette> = Palette.fetchRequest()
        request.predicate = NSPredicate(format: "%K == %@", "name", name as CVarArg)
        
        do {
            palettes = try self.managedObjectContext.fetch(request)
        } catch let error as NSError {
            print(error)
        }
        
        return palettes.first
    }
    
    func getPalette(id:UUID) -> Palette? {
        var palettes = [Palette]()
        
        let request: NSFetchRequest<Palette> = Palette.fetchRequest()
        request.predicate = NSPredicate(format: "%K == %@", "id", id as CVarArg)
        
        do {
            palettes = try self.managedObjectContext.fetch(request)
        } catch let error as NSError {
            print(error)
        }
        
        return palettes.first
    }
    
    func getPalettes() -> [Palette] {
        var palettes = [Palette]()
        
        let request: NSFetchRequest<Palette> = Palette.fetchRequest()
        
        do {
            palettes = try self.managedObjectContext.fetch(request)
        } catch let error as NSError {
            print(error)
        }
        
        return palettes
    }
    
    func updatePalette(id:UUID, newName:String) -> Palette? {
        var p = getPalette(id: id)
        if(p != nil) {
            p!.name = newName
            
            do {
                try self.managedObjectContext.save()
            } catch {
                print(error)
            }
            
            return p
        } else {
            return addPalette(name: newName)
        }
    }
    
    func deletePalette(id:UUID){
        do {
            if let p = getPalette(id: id) {
                self.managedObjectContext.delete(p)
                try self.managedObjectContext.save()
            }
        } catch let error as NSError {
            print(error)
        }
    }
}

