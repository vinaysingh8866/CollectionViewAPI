//
//  ImageLoader.swift
//  CollectionViewAPI
//
//  Created by Vinay Singh on 19/07/21.
//

import Foundation

class ImageLoader: ObservableObject {
    @Published var downloadData: Data?
    
    func downloadImage(url: String){
        guard let imageUrl = URL(string: url) else {
            return
        }
        URLSession.shared.dataTask(with: imageUrl){ data, _, error in
            guard let data = data, error == nil else{
                return
            }
            DispatchQueue.main.async {
                self.downloadData = data
            }
        }.resume()
    }
}
