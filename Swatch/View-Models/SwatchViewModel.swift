//
//  SwatchViewModel.swift
//  Swatch
//
//  Created by Peter Flickinger on 6/4/20.
//  Copyright © 2020 Peter Flickinger. All rights reserved.
//

import Foundation
class SwatchViewModel: ObservableObject, Identifiable {
    @Published
    var colors: [ColorViewModel]
    var name: String
    var id: UUID
    
    init(){
        self.name = "my swatch"
        self.id = UUID()

        self.colors = [ColorViewModel]()
        self.colors.append(ColorViewModel(name: "Blue", r: 10, g: 100, b:240))
        self.colors.append(ColorViewModel(name: "Red", r: 100, g: 4, b:12))
        self.colors.append(ColorViewModel(name: "Mint", r: 10, g: 233, b:190))
        self.colors.append(ColorViewModel(name: "Swampt", r: 30, g: 140, b:190))

        
    }
}
