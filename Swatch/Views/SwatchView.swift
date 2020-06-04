//
//  SwatchView.swift
//  Swatch
//
//  Created by Peter Flickinger on 6/4/20.
//  Copyright © 2020 Peter Flickinger. All rights reserved.
//

import SwiftUI

struct SwatchView: View {
    @ObservedObject var s = SwatchViewModel()

    var body: some View {
            List{
                ForEach(self.s.colors){ c in
                    NavigationLink(destination: ColorView(colorVM: c)) {
                        HStack{
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color(red: c.getRed(), green: c.getGreen(), blue: c.getBlue()))
                                .frame(width: 100, height: 100)
                            
                            VStack(alignment: .leading) {
                                Text(c.name)
                                    .font(.headline)
                                Text("#\(c.getHex())")
                            }
                               
                        }
                    }

                }
            }.navigationBarTitle(s.name)
    }
}

struct SwatchView_Previews: PreviewProvider {
    static var previews: some View {
        SwatchView()
    }
}
