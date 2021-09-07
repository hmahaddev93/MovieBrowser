//
//  UIImageView+LoadURL.swift
//  Movie Browser
//
//  Created by Khateeb Mahad H. on 7/19/21.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    func loadThumbnail(urlSting: String) {
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlSting as AnyObject) {
            image = imageFromCache as? UIImage
            return
        }
        
        HTTPManager.shared.downloadImage(imageURLString: urlSting) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                guard let imageToCache = UIImage(data: data) else { return }
                imageCache.setObject(imageToCache, forKey: urlSting as AnyObject)
                self.image = UIImage(data: data)
            case .failure(_):
                self.image = UIImage(named: "placeholder")
            }
        }
    }
}   
