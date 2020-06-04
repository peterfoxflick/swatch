//
//  ColorView.swift
//  Swatch
//
//  Created by Peter Flickinger on 6/3/20.
//  Copyright © 2020 Peter Flickinger. All rights reserved.
//

import SwiftUI

struct ColorView: View {
    @ObservedObject var c: ColorViewModel
    
    init(){
        self.c = ColorViewModel(name: "My Blue", r: 0, g: 100, b: 200)
    }
    init(colorVM: ColorViewModel){
        self.c = colorVM
    }
    
    var body: some View {
        ZStack
            {
                Color(red: c.getRed() , green: c.getGreen(), blue: c.getBlue())
                    .edgesIgnoringSafeArea(.bottom)
                
                VStack(spacing: 10) {
                    Text(c.name).font(.headline)
                    Text("#\(c.getHex())")
                    Text("RGB: (\(c.r), \(c.g), \(c.b))")
                }
                .background(
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.white)
                        .frame(minWidth: 300, idealWidth: 400, maxWidth: 500, minHeight: 200, idealHeight: 250, maxHeight: 500, alignment: .leading)
                )





        }.navigationBarTitle(c.name)

    }


}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView()
    }
}
