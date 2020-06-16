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
    @Binding var showAdd: Bool
    @ObservedObject var pvm: PalettesListViewModel
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Button(action:{
                        self.showAdd.toggle()
                    }) {
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height:30)
                            .padding()
                    }
                }
                Spacer()
            }
            
            VStack{
                Text("Name your new palette")
                
                HStack {
                    TextField("My Cool Palette", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button(action:{
                        if(self.name.trimmingCharacters(in: .whitespaces) != "") {
                            self.addPalette()
                        }
                        self.showAdd.toggle()
                    }) {
                        Image(systemName: "arrow.right.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height:30)
                            .padding()
                    }
                }
            }
            
        }
    }
    
    func addPalette(){
        self.pvm.add(name: self.name)
    }
}
