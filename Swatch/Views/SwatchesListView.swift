//
//  SwatchesListView.swift
//  Swatch
//
//  Created by Peter Flickinger on 6/4/20.
//  Copyright © 2020 Peter Flickinger. All rights reserved.
//

import SwiftUI

struct SwatchesListView: View {
    @ObservedObject var swatchesList = SwatchesListViewModel()
    
    var body: some View {
        NavigationView {
            List{
                ForEach(self.swatchesList.swatches){ s in
                    NavigationLink(destination: SwatchView(s: s)) {
                        VStack(alignment: .leading) {
                            Text(s.name)
                                .font(.headline)
                            
                            ScrollView(.horizontal) {
                                HStack{
                                    ForEach(s.colors) { c in
                                        NavigationLink(destination: SwatchView(s: s)) {
                                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                            .fill(Color(red: c.getRed(), green: c.getGreen(), blue: c.getBlue()))
                                                .frame(width: 90, height: 90)
                                        }
                                    }
                                }
                            }
                        }
                    }

                }
            }.navigationBarTitle("My Swatches")
        }
    }
}

struct SwatchesListView_Previews: PreviewProvider {
    static var previews: some View {
        SwatchesListView()
    }
}
