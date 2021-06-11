//
//  ContentViewModel.swift
//  NSCacheDemo
//
//  Created by Fred Javalera on 6/10/21.
//

import SwiftUI

class ContentViewModel: ObservableObject {
  @Published var startingImage: UIImage? = nil
  @Published var cachedImage: UIImage? = nil
  @Published var infoMessage: String = ""
  let imageName: String = "steve-jobs"
  let manager = CacheManager.instance
  
  init() {
    getImageFromAssetsFolder()
  }
  
  func getImageFromAssetsFolder() {
    startingImage = UIImage(named: imageName)
  }
  
  func saveToCache() {
    guard let image = startingImage else { return }
    infoMessage = manager.add(image: image, name: imageName)
  }
  
  func removeFromCache() {
    infoMessage = manager.remove(name: imageName)
  }
  
  func getFromCache() {
    if let returnedImage = manager.get(name: imageName) {
      cachedImage = returnedImage
      infoMessage = "Got image from cache"
    } else {
      infoMessage = "Image not found in cache"
    }
  }
}
