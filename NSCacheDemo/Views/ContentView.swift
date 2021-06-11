//
//  ContentView.swift
//  NSCacheDemo
//
//  Created by Fred Javalera on 6/10/21.
//

import SwiftUI

struct ContentView: View {
  
  // MARK: Properties
  @StateObject var vm = ContentViewModel()
  
  // MARK: Body
  var body: some View {
    
    NavigationView {
      VStack {
        if let image = vm.startingImage {
          Image(uiImage: image)
            .resizable()
            .scaledToFill()
            .frame(width: 200, height: 200)
            .clipped()
            .cornerRadius(10)
        }
        
        Text(vm.infoMessage)
          .font(.headline)
          .foregroundColor(.purple)
        
        HStack {
          Button(action: {
            vm.saveToCache()
          }, label: {
            Text("Save to Cache")
              .font(.headline)
              .foregroundColor(.white)
              .padding()
              .background(Color.blue)
              .cornerRadius(10)
          })
          
          Button(action: {
            vm.removeFromCache()
          }, label: {
            Text("Delete from Cache")
              .font(.headline)
              .foregroundColor(.white)
              .padding()
              .background(Color.red)
              .cornerRadius(10)
          })
        }
        
        Button(action: {
          vm.getFromCache()
        }, label: {
          Text("Get from Cache")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .background(Color.green)
            .cornerRadius(10)
        })
        
        if let image = vm.cachedImage {
          Image(uiImage: image)
            .resizable()
            .scaledToFill()
            .frame(width: 200, height: 200)
            .clipped()
            .cornerRadius(10)
        }
        
        Spacer()
      
      }
      .navigationTitle("Cache Bootcamp")
    }
    
  }
  
}

// MARK: Preview
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
