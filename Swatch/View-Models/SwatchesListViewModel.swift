//
//  SwatchesListViewModel.swift
//  Swatch
//
//  Created by Peter Flickinger on 6/4/20.
//  Copyright © 2020 Peter Flickinger. All rights reserved.
//

import Foundation
class SwatchesListViewModel: ObservableObject, Identifiable {
    @Published
    var swatches: [SwatchViewModel]
    
    init(){
        self.swatches = [SwatchViewModel]()
        
        let s1 = SwatchViewModel()
        self.swatches.append(s1)
    }
}
