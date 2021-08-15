//
//  ApiResponse.swift
//  CollectionViewAPI
//
//  Created by Vinay Singh on 19/07/21.
//

import Foundation
//https://wallhaven.cc/api/v1/search?q=drone

struct ApiResponse: Decodable {
    let images: [Wallpaper]
    private enum CodingKeys: String,CodingKey{
        case images="data"
    }
}

struct Wallpaper: Decodable{
    let id:String
    let thumbs:thumbs
    private enum CodingKeys: String,CodingKey{
        case thumbs
        case id
    }
}

struct thumbs:Decodable {
    let small:String
    let large:String
    let original:String
    private enum CodingKeys: String,CodingKey{
        case small
        case large
        case original
    }
}


class WallpaperStore: ObservableObject {
    @Published var wallpapers : [Wallpaper]? = [Wallpaper]()
    
    func getAll(){
    guard let url = URL(string: "https://wallhaven.cc/api/v1/search?q=penguins")
        else {
        fatalError("url error")
        }
        URLSession.shared.dataTask(with: url){ data, response, error in
            guard let data = data, error == nil else{
                return
            }
            
            let response = try? JSONDecoder().decode(ApiResponse.self, from: data)
            
            if let response = response{
                DispatchQueue.main.async {
                    self.wallpapers = response.images
                }
                
            }
        }.resume()
        
    }
    
}
//
//
//{"id":"3zwqg3",
//"url":"https:\/\/wallhaven.cc\/w\/3zwqg3",
//"short_url":"https:\/\/whvn.cc\/3zwqg3",
//"views":1085,
//"favorites":17,
//"source":"","purity":"sfw","category":"general","dimension_x":1500,"dimension_y":1000,"resolution":"1500x1000","ratio":"1.5","file_size":222363,"file_type":"image\/jpeg","created_at":"2021-06-26 00:21:11","colors":["#000000","#424153","#999999","#663300","#336600"],"path":"https:\/\/w.wallhaven.cc\/full\/3z\/wallhaven-3zwqg3.jpg","thumbs":{"large":"https:\/\/th.wallhaven.cc\/lg\/3z\/3zwqg3.jpg","original":"https:\/\/th.wallhaven.cc\/orig\/3z\/3zwqg3.jpg","small":"https:\/\/th.wallhaven.cc\/small\/3z\/3zwqg3.jpg"}}
