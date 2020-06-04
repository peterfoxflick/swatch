//
//  ColorViewModel.swift
//  Swatch
//
//  Created by Peter Flickinger on 6/3/20.
//  Copyright © 2020 Peter Flickinger. All rights reserved.
//

import Foundation
class ColorViewModel: ObservableObject, Identifiable {
    @Published
    var id: UUID
    var name: String
    var r: Int
    var g: Int
    var b: Int
    
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
        self.r = r
        self.g = g
        self.b = b
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
        return String(self.r, radix: 16) + String(self.g, radix: 16) + String(self.b, radix: 16)
    }
    
    
}
