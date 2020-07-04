//
//  PalettesListView.swift
//  Swatch
//
//  Created by Peter Flickinger on 6/4/20.
//  Copyright © 2020 Peter Flickinger. All rights reserved.
//

import SwiftUI

struct PalettesListView: View {
    @EnvironmentObject var palettesList: PalettesListViewModel
    @State var showingAdd = false


    var body: some View {
        NavigationView {
            List{
                
                if(self.palettesList.palettes.count == 0){
                    Text("To get started click the plus button on the top right")
                        .font(.callout)
                }
                
                ForEach(self.palettesList.palettes){ p in
                        NavigationLink(destination: PaletteView(p: p)) {
                        VStack(alignment: .leading) {
                            Text(p.name)
                                .font(.headline)
                            
                                HStack{
                                    ForEach(p.swatches.prefix(3)) { s in
                                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                            .fill(Color(red: s.getRed(), green: s.getGreen(), blue: s.getBlue()))
                                                .frame(width: 90, height: 90)
                                }
                            }
                        }
                    }

                }.onDelete(perform: deletePalette)
            }.navigationBarTitle("My Swatches")
            .navigationBarItems(trailing:
                HStack {
                    Button(action:{
                        self.showingAdd.toggle()
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height:20)
                            .padding()
                    }.sheet(isPresented: $showingAdd){
                        PaletteAddView(name: "", showAdd: self.$showingAdd, pvm: self.palettesList)
                    }
                    
                    Button(action:{
                        self.palettesList.fetch()
                    }) {
                        Image(systemName: "arrow.clockwise")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height:20)
                            .padding()
                    }
                }
                

            )
        }.accentColor(.pink)
    }
    
    func deletePalette(at offsets: IndexSet) {
        self.palettesList.delete(index: offsets)
    }
}

struct SwatchesListView_Previews: PreviewProvider {
    static var previews: some View {
        PalettesListView()
    }
}
