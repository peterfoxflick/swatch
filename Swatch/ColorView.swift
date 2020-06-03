//
//  ColorView.swift
//  Swatch
//
//  Created by Peter Flickinger on 6/3/20.
//  Copyright © 2020 Peter Flickinger. All rights reserved.
//

import SwiftUI

struct ColorView: View {
    @ObservedObject var c = ColorViewModel(name: "My Blue", r: 0, g: 100, b: 200)
    
    var body: some View {
        ZStack
            {
                Color(red: c.getRed() , green: c.getGreen(), blue: c.getBlue())
                    .edgesIgnoringSafeArea(.all)

                // Your other content here
                // Other layers will respect the safe area edges
//                Rectangle()
//                    .fill(Color.white)
//                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 300)
//                    .edgesIgnoringSafeArea(.all)
//                    .offset(x: 0, y: 300)
                
                VStack(spacing: 10) {
                  // content here
                    Text(c.name).font(.headline)
                    Text("#\(c.getHex())")
                    Text("RGB: (\(c.r), \(c.g), \(c.b))")

                }
                .background(
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.white)
                        .frame(minWidth: 300, idealWidth: 400, maxWidth: 500, minHeight: 200, idealHeight: 250, maxHeight: 500, alignment: .leading)
                )





        }

    }

}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView()
    }
}
