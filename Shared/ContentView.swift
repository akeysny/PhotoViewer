//
//  ContentView.swift
//  Shared
//
//  Created by Anna Taylor on 2/12/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    
    @ObservedObject var randomImages = UnsplashData()
    
    var body: some View {
        ScrollView {
            LazyVStack (alignment: .leading){
                ForEach(randomImages.photoArray, id: \.id) { photo in
                    WebImage(url: URL(string: photo.urls["thumb"]!))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width - 50, height: 200, alignment: .center)
                        .cornerRadius(15)
                    
                    if photo.alt_description != nil {
                        Text(photo.alt_description!).font(.footnote)
                    }
                }
            
            }.padding(20)
        
    }.navigationTitle("Random List")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    }
}
