//
//  PalettesListView.swift
//  Swatch
//
//  Created by Peter Flickinger on 6/4/20.
//  Copyright © 2020 Peter Flickinger. All rights reserved.
//

import SwiftUI

struct PalettesListView: View {
    @ObservedObject var palettesList = PalettesListViewModel()
    @State var showingAdd = false

    var body: some View {
        NavigationView {
            List{
                ForEach(self.palettesList.palettes){ p in
                    NavigationLink(destination: PaletteView(p: p)) {
                        VStack(alignment: .leading) {
                            Text(p.name)
                                .font(.headline)
                            
                            ScrollView(.horizontal) {
                                HStack{
                                    ForEach(p.swatches) { s in
                                        NavigationLink(destination: PaletteView(p: p)) {
                                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                            .fill(Color(red: s.getRed(), green: s.getGreen(), blue: s.getBlue()))
                                                .frame(width: 90, height: 90)
                                        }
                                    }
                                }
                            }
                        }
                    }

                }
            }.navigationBarTitle("My Swatches")
            .navigationBarItems(trailing:
                Button(action:{
                    self.showingAdd.toggle()
                }) {
                    Image(systemName: "plus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height:20)
                        .padding()
                }.sheet(isPresented: $showingAdd){
                    PaletteAddView()
                }

            )
        }
    }
}

struct SwatchesListView_Previews: PreviewProvider {
    static var previews: some View {
        PalettesListView()
    }
}
