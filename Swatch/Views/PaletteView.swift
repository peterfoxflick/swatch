//
//  SwatchView.swift
//  Swatch
//
//  Created by Peter Flickinger on 6/4/20.
//  Copyright © 2020 Peter Flickinger. All rights reserved.
//

import SwiftUI

struct PaletteView: View {
    @ObservedObject var p = PaletteViewModel()

    var body: some View {
            List{
                ForEach(self.p.swatches){ s in
                    NavigationLink(destination: SwatchView(s: s)) {
                        HStack{
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color(red: s.getRed(), green: s.getGreen(), blue: s.getBlue()))
                                .frame(width: 100, height: 100)
                            
                            VStack(alignment: .leading) {
                                Text(s.name)
                                    .font(.headline)
                                Text("#\(s.getHex())")
                            }
                               
                        }
                    }

                }
            }.navigationBarTitle(p.name)
    }
}

struct SwatchView_Previews: PreviewProvider {
    static var previews: some View {
        PaletteView()
    }
}
