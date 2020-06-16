//
//  ColorView.swift
//  Swatch
//
//  Created by Peter Flickinger on 6/3/20.
//  Copyright © 2020 Peter Flickinger. All rights reserved.
//

import SwiftUI

struct SwatchView: View {
    @EnvironmentObject var palettesList: PalettesListViewModel

    @ObservedObject var s: SwatchViewModel
    @State var showingEdit = false
    
    init(){
        self.s = SwatchViewModel(name: "My Blue", r: 0, g: 100, b: 200)
    }
    init(s: SwatchViewModel){
        self.s = s
    }
    
    var body: some View {
        ZStack
            {
                Color(red: s.getRed() , green: s.getGreen(), blue: s.getBlue())
                    .edgesIgnoringSafeArea(.bottom)
                
                VStack(spacing: 10) {
                    Text(s.name).font(.headline)
                    Text("#\(s.getHex())")
                    Text("RGB: (\(s.r), \(s.g), \(s.b))")
                }
                .background(
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.white)
                        .frame(minWidth: 300, idealWidth: 400, maxWidth: 500, minHeight: 200, idealHeight: 250, maxHeight: 500, alignment: .leading)
                )


        }.navigationBarTitle(s.name)
        .navigationBarItems(trailing:
            Button(action:{
                self.showingEdit.toggle()
            }) {
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height:20)
                    .padding()
            }.sheet(isPresented: $showingEdit){
                AddEditSwatch(show: self.$showingEdit, svm: self.s, r: Double(self.s.r), g: Double(self.s.g), b: Double(self.s.b), name: self.s.name).environmentObject(self.palettesList)
            }
        )
    }


}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        SwatchView()
    }
}
