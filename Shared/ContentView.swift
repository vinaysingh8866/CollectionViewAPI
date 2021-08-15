//
//  ContentView.swift
//  Shared
//
//  Created by Vinay Singh on 19/07/21.
//

import SwiftUI
import CoreData
import Combine



struct ContentView: View {
    @ObservedObject var store: WallpaperStore
    let column : [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    var body: some View {
        ScrollView {
            LazyVGrid(columns: column){
                
                ForEach(store.wallpapers ?? [Wallpaper](), id:\.id){ wallpaper in
                    VStack{
                        URLImage(url: wallpaper.thumbs.large)
                            .frame(width: 100, height: 100, alignment: .center)
                        Text(wallpaper.id)
                            //.frame(minHeight: .infinity, alignment: .top)
                    }
                    
                }
            }
                
        }
        .onAppear{
            store.getAll()
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    

    static var previews: some View {
        
        ContentView(store: WallpaperStore())
    }
}
