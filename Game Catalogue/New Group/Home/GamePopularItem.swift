//
//  GamePopularItem.swift
//  Game Catalogue
//
//  Created by Wanhar on 07/07/20.
//

import SwiftUI
import URLImage

struct GamePopularItem: View {
    
    let item: Game
    
    var body: some View {
        
        VStack(alignment:.leading, spacing: 10) {
            
            URLImage(URL(string: item.background_image)!) { proxy in
                proxy.image
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 170)
                    .clipped()
                    .cornerRadius(10)
                    .shadow(radius: 10)
            }
            VStack(alignment: .leading, spacing: 5) {
                Text(item.name)
                    .foregroundColor(.primary)
                    .font(.headline)
                
                Text(item.slug)
                    .font(.headline)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .frame(height: 30)
            }
            
        }
    }
}