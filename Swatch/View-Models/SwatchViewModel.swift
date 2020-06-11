//
//  SwatchViewModel.swift
//  Swatch
//
//  Created by Peter Flickinger on 6/3/20.
//  Copyright © 2020 Peter Flickinger. All rights reserved.
//

import Foundation
class SwatchViewModel: ObservableObject, Identifiable {
    @Published
    var id: UUID
    var name: String
    var r: Int16
    var g: Int16
    var b: Int16
    
    init(){
        self.id = UUID()
        self.name = ""
        self.r = 0
        self.g = 0
        self.b = 0
    }
    
    init(name: String, r: Int, g: Int, b:Int){
        self.id = UUID()
        self.name = name
        self.r = Int16(r)
        self.g = Int16(g)
        self.b = Int16(b)
    }
    
    init(s:Swatch){
        self.id = s.id ?? UUID()
        self.name = s.name ?? "Color"
        self.r = s.r
        self.g = s.g
        self.b = s.b
    }
    
    
    //Functions for swift
    func getRed() -> Double {
        return Double(self.r) / 255
    }
    
    func getGreen() -> Double {
        return Double(self.g) / 255
    }
    
    func getBlue() -> Double {
        return Double(self.b) / 255
    }
    
    func getHex() -> String {
        return  String(format:"%02X", self.r)
            + String(format:"%02X", self.g)
            + String(format:"%02X", self.b)
    }
    
    
}
