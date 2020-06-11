//
//  PalettesListViewModel.swift
//  Swatch
//
//  Created by Peter Flickinger on 6/4/20.
//  Copyright © 2020 Peter Flickinger. All rights reserved.
//

import Foundation
class PalettesListViewModel: ObservableObject, Identifiable {
    var pDataManager = PaletteDataManger()
    
    @Published
    var palettes: [PaletteViewModel]
    
    
    init(){
        self.palettes = [PaletteViewModel]()
        fetch()
    }
    
    func fetch() {
        let temp = pDataManager.getPalettes().map(PaletteViewModel.init)
        self.palettes = temp
    }
}
