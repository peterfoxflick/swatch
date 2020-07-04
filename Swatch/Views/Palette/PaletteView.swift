//
//  SwatchView.swift
//  Swatch
//
//  Created by Peter Flickinger on 6/4/20.
//  Copyright © 2020 Peter Flickinger. All rights reserved.
//

import SwiftUI

struct PaletteView: View {
    @EnvironmentObject var palettesList: PalettesListViewModel
    @ObservedObject var p: PaletteViewModel
    @State var showingEdit = false
    @State var showingAddSwatch = false
    
    init(p: PaletteViewModel){
        self.p = p
    }

    var body: some View {
            List{
                
                if(self.p.swatches.count == 0){
                    Text("To add a color click the plus button on the top right")
                    .font(.callout)
                }
                
                
                ForEach(self.p.swatches){ s in
                    NavigationLink(destination: SwatchView(s: s)) {
                        ZStack
                            {
  
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(Color(red: s.getRed(), green: s.getGreen(), blue: s.getBlue()))
                                    .frame(height: 100)
                                
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(s.name)
                                            .font(.headline)
                                        Text("#\(s.getHex())")
                                    }
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(Color.white)
                                    )
                                    
                                    Spacer()
                                }.padding()
                        }
                            
                    
                        
                    }

                }.onDelete(perform: deleteSwatch)
            }.navigationBarTitle(p.name)
            .navigationBarItems(trailing:
                HStack{
                    Button(action:{
                        self.showingEdit.toggle()
                    }) {
                        Image(systemName: "square.and.pencil")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height:20)
                            .padding()
                    }.sheet(isPresented: $showingEdit){
                        PaletteEditView(name: self.p.name, show:  self.$showingEdit, pvm: self.p).environmentObject(self.palettesList)
                    }
                
                   Button(action:{
                       self.showingAddSwatch.toggle()
                   }) {
                       Image(systemName: "plus")
                           .resizable()
                           .aspectRatio(contentMode: .fit)
                           .frame(height:20)
                           .padding()
                   }.sheet(isPresented: $showingAddSwatch){
                    AddEditSwatch(show: self.$showingAddSwatch, svm: SwatchViewModel(palletID: self.p.id), r: Double.random(in: 0...225), g: Double.random(in: 0...225), b: Double.random(in: 0...225), name: "").environmentObject(self.palettesList)
                    }
                }
            )
    }
    
    func deleteSwatch(at offsets: IndexSet) {
        p.deleteSwatch(index: offsets)
        palettesList.fetch()
    }
    
}

