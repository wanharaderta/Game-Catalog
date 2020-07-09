//
//  HomeDetailView.swift
//  Game Catalogue
//
//  Created by Wanhar on 08/07/20.
//

import SwiftUI
import URLImage

struct DetailView: View {
    
    @State var item : Game

    var body: some View {
        
        List {
            ZStack {
                Rectangle()
                    .fill(Color.gray)
                
                if (item.background_image != nil) {
                    URLImage(URL(string: item.background_image!)!) { proxy in
                        proxy.image
                            .resizable()
                    }
                }
            }.aspectRatio(16/9, contentMode: .fit)
            
            HStack {
                Text("Release : ")
                    .font(.headline)
                Text(item.released ?? "")
                    .font(.subheadline)
            }.frame(alignment: .leading)
            
            HStack {
                Text("Rating : ")
                    .font(.headline)
                Text(String("\(item.rating)"))
                    .font(.subheadline)
            }.frame(alignment: .leading)
            
            HStack {
                Text("Ranking rating top : ")
                    .font(.headline)
                Text(String("\(item.rating_top)"))
                    .font(.subheadline)
            }.frame(alignment: .leading)
            
            HStack(alignment:.top,spacing: 2) {
                
                VStack(alignment:.leading) {
                    if item.genres.count > 0 {
                        Text("Genres").font(.headline)
                        ForEach(item.genres, id: \.id){ genre in
                            Text(genre.name)
                                .font(.subheadline)
                            
                        }
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)

                Spacer()
                
                VStack(alignment:.leading) {
                    if (item.tags.count > 0) {
                        Text("Tags").font(.headline)
                        ForEach(item.tags, id: \.id){ tag in
                            Text(tag.name)
                                .font(.subheadline)
                        }
                    }
                }
            }.padding(.top, 15)
            
        }
        .navigationBarTitle(item.name)
    }
}
