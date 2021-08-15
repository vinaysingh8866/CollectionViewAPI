//
//  URLImage.swift
//  CollectionViewAPI
//
//  Created by Vinay Singh on 19/07/21.
//

import SwiftUI

struct URLImage: View {
    let url: String
    let placeholder: String
    
    @ObservedObject var imageLoader = ImageLoader()
    
    init(url: String, placeholder: String = "placeholder"){
        self.url = url
        self.placeholder = placeholder
        self.imageLoader.downloadImage(url: self.url)
    }
    
    var body: some View {
        if let data = self.imageLoader.downloadData{
            return Image(uiImage: UIImage(data: data)!).renderingMode(.original).resizable()
        }
        else{
            return Image("placeholder").renderingMode(.original).resizable()
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "https://th.wallhaven.cc/lg/3z/3zwqg3.jpg")
    }
}


struct ListIte:View{
    var body: some View{
        Image(systemName: "plus")
        Text("okok")
    }
}
