//
//  CacheManager.swift
//  NSCacheDemo
//
//  Created by Fred Javalera on 6/10/21.
//

import SwiftUI

class CacheManager {
  static let instance = CacheManager() // Singleton instance
  private init() {}
  
  var imageCache: NSCache<NSString, UIImage> = {
    let cache = NSCache<NSString, UIImage>()
    
    // Customize cache
    cache.countLimit = 100
    cache.totalCostLimit = 1024 * 1024 * 100 // 100MB
    
    return cache
  }()
  
  func add(image: UIImage, name: String) -> String {
    imageCache.setObject(image, forKey: name as NSString)
    return "Added to cache!"
  }
  
  func remove(name: String) -> String {
    imageCache.removeObject(forKey: name as NSString)
    return "Removed from cache!"
  }
  
  func get(name: String) -> UIImage? {
    return imageCache.object(forKey: name as NSString)
  }
}
