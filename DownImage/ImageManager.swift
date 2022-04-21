//
//  ImageManager.swift
//  DownImage
//
//  Created by Sun on 21/04/2022.
//

import Foundation
import UIKit

struct ImageManager {
    
    static func savePhoto(urlString: String?) {
        if let urlString = urlString {        
            let url = URL(string: urlString)
            savePhoto(url: url)
        }
    }
    
    static func savePhoto(url: URL?) {
        if let url = url {
            let data = try? Data(contentsOf: url)
            savePhoto(data: data)
        }
    }
    
    static func savePhoto(data: Data?) {
        if let data = data {
            let image = UIImage(data: data)
            savePhoto(image: image)
        }
    }
    
    static func savePhoto(image: UIImage?) {
        if let image = image {
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
    }
}
