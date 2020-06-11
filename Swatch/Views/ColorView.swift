//
//  ColorView.swift
//  Swatch
//
//  Created by Peter Flickinger on 6/3/20.
//  Copyright © 2020 Peter Flickinger. All rights reserved.
//

import SwiftUI

struct SwatchView: View {
    @ObservedObject var s: SwatchViewModel
    
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

    }


}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        SwatchView()
    }
}
