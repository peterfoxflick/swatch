//
//  AddEditSwatch.swift
//  Swatch
//
//  Created by Peter Flickinger on 6/13/20.
//  Copyright © 2020 Peter Flickinger. All rights reserved.
//

import SwiftUI

struct AddEditSwatch: View {
    @EnvironmentObject var palettesList: PalettesListViewModel

    @Binding var show: Bool
    @ObservedObject var svm: SwatchViewModel
    
    @State var r: Double
    @State var g: Double
    @State var b: Double
    @State var name: String
    
    
    var body: some View {
        ZStack {
            Color(red: self.getRed() , green: self.getGreen(), blue: self.getBlue())
                .edgesIgnoringSafeArea(.bottom)
            
            
            
            VStack(spacing: 10) {
                TextField("My Cool Palette", text: self.$name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .font(.headline)
                
                Text("#\(self.getHex())")
                Text("RGB: (\(Int16(self.r)), \(Int16(self.g)), \(Int16(self.b)))")
                
                HStack{
                    Text("R:")
                    Slider(value: $r, in: 0...225, step: 1)
                        .accentColor(Color.red)
                }
                HStack{
                    Text("G:")
                    Slider(value: $g, in: 0...225, step: 1)
                        .accentColor(Color.green)
                }
                HStack{
                    Text("B:")
                    Slider(value: $b, in: 0...225, step: 1)
                        .accentColor(Color.blue)
                }
                
                
                Button(action:{
                    if(self.name.trimmingCharacters(in: .whitespaces) != ""){
                        self.save()
                    }
                    self.show.toggle()
                }) {
                    Image(systemName: "checkmark.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height:30)
                        .padding()
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .fill(Color.white)
                    .frame(minWidth: 300, idealWidth: 400, maxWidth: 500, minHeight: 200, idealHeight: 250, maxHeight: 500, alignment: .leading)
            )
            
        }
    }
    
    func save() {
        svm.r = Int16(self.r)
        svm.g = Int16(self.g)
        svm.b = Int16(self.b)
        svm.name = self.name
        
        svm.save()
        
        self.palettesList.fetch()
    }
    
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
        return  String(format:"%02X", Int16(self.r))
            + String(format:"%02X", Int16(self.g))
            + String(format:"%02X", Int16(self.b))
    }
    
}
