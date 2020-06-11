//
//  PaletteViewModel.swift
//  Swatch
//
//  Created by Peter Flickinger on 6/4/20.
//  Copyright © 2020 Peter Flickinger. All rights reserved.
//

import Foundation
class PaletteViewModel: ObservableObject, Identifiable {
    @Published
    var swatches: [SwatchViewModel]
    var name: String
    var id: UUID
    
    init(){
        self.name = "my swatch"
        self.id = UUID()

        self.swatches = [SwatchViewModel]()
        self.swatches.append(SwatchViewModel(name: "Blue", r: 10, g: 100, b:240))
        self.swatches.append(SwatchViewModel(name: "Red", r: 100, g: 4, b:12))
        self.swatches.append(SwatchViewModel(name: "Mint", r: 10, g: 233, b:190))
        self.swatches.append(SwatchViewModel(name: "Swampt", r: 30, g: 140, b:190))
    }
    
    init(p: Palette){
        self.name = p.name ?? "My Palette"
        self.swatches = [SwatchViewModel]()
        self.id = p.id ?? UUID()
        for s in p.swatches! {
            self.swatches.append(SwatchViewModel(s:s as! Swatch))
        }
    }
}
