//
//  ImageGridView.swift
//  PhotoViewer
//
//  Created by Anna Taylor on 2/13/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageGridView: View {
    
    @ObservedObject var randomImages = UnsplashData()
    
    var columns = [
        GridItem(spacing: 0),
        GridItem(spacing: 0),
        GridItem(spacing: 0)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(randomImages.photoArray, id: \.id) { photo in
                    WebImage(url: URL(string: photo.urls["thumb"]!))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .clipped()
                    
                    if photo.alt_description != nil {
                        Text(photo.alt_description!).font(.footnote)
                    }
            }
            }.padding()
        }.navigationTitle("Random Grid")
    }
}

struct ImageGridView_Previews: PreviewProvider {
    static var previews: some View {
        ImageGridView()
    }
}

