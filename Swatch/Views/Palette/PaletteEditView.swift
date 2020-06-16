//
//  PaletteEditView.swift
//  Swatch
//
//  Created by Peter Flickinger on 6/13/20.
//  Copyright © 2020 Peter Flickinger. All rights reserved.
//

import SwiftUI

struct PaletteEditView: View {
    @EnvironmentObject var palettesList: PalettesListViewModel

    @State var name: String
    @Binding var show: Bool
    @ObservedObject var pvm: PaletteViewModel
    
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Button(action:{
                        self.show.toggle()
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
                
                HStack {
                    TextField("My Cool Palette", text: self.$name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
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
            }
            
        }
    }
    
    func save(){
        self.pvm.name = self.name
        self.pvm.save()
        self.palettesList.fetch()
    }
}
