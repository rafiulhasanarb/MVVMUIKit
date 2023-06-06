//
//  UIImageViewExtension.swift
//  MVVMUIKit
//
//  Created by rafiul hasan on 6/6/23.
//

 import UIKit
/*
 import Kingfisher

 extension UIImageView {
     func setImage(with urlString: String) {
         guard let url = URL.init(string: urlString) else {
             return
         }
         let resource = ImageResource(downloadURL: url, cacheKey: urlString)
         kf.indicatorType = .activity
         kf.setImage(with: resource)
     }
 }
 */

extension UIImageView {
    
    func loadImage(from url: URL) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, let newImage = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.image = newImage
            }
        }
        task.resume()
    }
    
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
/*
class CustomImageView: UIImageView {
    func loadImage(from url: URL) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, let newImage = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.image = newImage
            }
        }
        task.resume()
    }
}
*/
