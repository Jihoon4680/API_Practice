//
//  ImageCacher.swift
//  URLSession_practice
//
//  Created by 안지훈 on 8/16/22.
//

import UIKit

class ImageCacheManager {
    
    static let shared = NSCache<NSString, UIImage>()
    
    private init() {}
    
}
extension UIImageView {
    func setImageUrl(_ url: String) {
        print(" imageCacheManager - setImageUrl ")
        
        
        /// cache할 객체의 key값을 string으로 생성
        let cachedKey = NSString(string: url)
        
        /// cache된 이미지가 존재하면 그 이미지를 사용 (API 호출안하는 형태)
        if let cachedImage = ImageCacheManager.shared.object(forKey: cachedKey) {
            self.image = cachedImage
            return
        }
        DispatchQueue.global(qos: .background).async {
            guard let url = URL(string: url) else { return }
            URLSession.shared.dataTask(with: url) { (data, result, error) in
                guard error == nil else {
                    DispatchQueue.main.async { [weak self] in
                        self?.image = UIImage()
                        print("시발 진짜")
                    }
                    return
                }
                
                DispatchQueue.main.async { [weak self] in
                    if let data = data, let image = UIImage(data: data) {
                        
                        /// 캐싱
                        ImageCacheManager.shared.setObject(image, forKey: cachedKey)
                        self?.image = image
                        print("cache")
                    }
                }
            }.resume()
        }
    }
    
}

