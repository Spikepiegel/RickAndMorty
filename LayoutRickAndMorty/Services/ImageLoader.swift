//
//  ImageLoader.swift
//  LayoutRickAndMorty
//
//  Created by Николай Лермонтов on 12.11.2022.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()


class CustomImageView: UIImageView {
    
    var imageURL:URL?
    
    internal func download(from URL: URL) {
        imageURL = URL
        image = nil
        if let cachedImage = imageCache.object(forKey: URL as AnyObject) as? UIImage {
            image = cachedImage
            return
        }
        URLSession.shared.dataTask(with: URL) {[weak self] data, response, error in
            guard
                let _ = self,
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let responseImage = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {[weak self] in
                
                guard let weakSelf = self else {
                    return
                }
                if weakSelf.imageURL == URL {
                    weakSelf.image = responseImage
                }
                imageCache.setObject(responseImage, forKey: URL as AnyObject)
            }
            }.resume()
    }
    
    
}
