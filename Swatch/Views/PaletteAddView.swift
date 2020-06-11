//
//  PaletteAddView.swift
//  Swatch
//
//  Created by Peter Flickinger on 6/11/20.
//  Copyright © 2020 Peter Flickinger. All rights reserved.
//


import SwiftUI

struct PaletteAddView: View {
    @State var name: String = ""
    var body: some View {
        VStack {
            Text("Name your new palette")
            
            TextField("My Cool Palette", text: $name)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            
            Button(action:{
                self.addPalette()
               // Save pallete name
               // Allow user to add colors...
            }) {
                Image(systemName: "arrow.right.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height:50)
                    .padding()
            }

            
        }
    }
    
    func addPalette(){
        let p = PaletteDataManger().addPalette(name: self.name)
        //p.id
    }
}
