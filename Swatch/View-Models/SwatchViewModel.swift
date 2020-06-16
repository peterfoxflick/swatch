//
//  SwatchViewModel.swift
//  Swatch
//
//  Created by Peter Flickinger on 6/3/20.
//  Copyright © 2020 Peter Flickinger. All rights reserved.
//

import Foundation
class SwatchViewModel: ObservableObject, Identifiable {
    var sDataManager = SwatchDataManger()
    var paletteID: UUID

    @Published var id: UUID
    @Published var name: String
    @Published var r: Int16
    @Published var g: Int16
    @Published var b: Int16
    
    init(){
        self.id = UUID()
        self.name = ""
        self.r = 0
        self.g = 0
        self.b = 0
        self.paletteID = UUID()
    }
    
    init(palletID: UUID){
        self.paletteID = palletID

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
        self.paletteID = UUID()
    }
    
    init(s:Swatch){
        self.id = s.id ?? UUID()
        self.name = s.name ?? "Color"
        self.r = s.r
        self.g = s.g
        self.b = s.b
        self.paletteID = s.palette?.id ?? UUID()
    }
    
    func fetch(){
        let s = sDataManager.getSwatch(id: self.id)
        
        if s == nil {
            //somethings wrong
            return
        }
        
        self.name = s!.name ?? "Coolest of colors"
        self.id = s!.id ?? UUID()
        self.r = s!.r
        self.g = s!.g
        self.b = s!.b
    }
    
    func save(){
        sDataManager.updateSwatch(pID: self.paletteID, id: self.id, name: self.name, r: self.r, g: self.g, b: self.b)
        fetch()
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
