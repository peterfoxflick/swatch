//
//  PalettesListViewModel.swift
//  Swatch
//
//  Created by Peter Flickinger on 6/4/20.
//  Copyright © 2020 Peter Flickinger. All rights reserved.
//

import Foundation
import Combine

class PalettesListViewModel: ObservableObject {
    var pDataManager = PaletteDataManger()
    
    @Published var palettes: [PaletteViewModel]
    

    
    init(){
        self.palettes = [PaletteViewModel]()
        fetch()
    }
    
    func fetch() {
        let temp = pDataManager.getPalettes().map(PaletteViewModel.init)
        self.palettes = temp
        
        print("PALETTS: \(palettes.count)")
        
        var s = "Swatches: "
        
        for p in self.palettes {
            s.append("count: \(p.swatches.count)  ")
        }
        
        print(s)
    }
    
    func add(name: String){
        pDataManager.addPalette(name: name)
        self.fetch()
    }
    
    func delete(index: IndexSet){
        if index.first == nil {
            return
        }
        
        let id = palettes[index.first!].id
        pDataManager.deletePalette(id: id)
        self.fetch()
    }
}
