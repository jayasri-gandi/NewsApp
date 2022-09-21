//
//  NewsArticle.swift
//  SpacenewsApp
//
//  Created by Jayasri  on 20/09/22.
//

import SwiftUI
import CachedAsyncImage

struct NewsArticle: View {
    let title: String
    let imageurl: String
    let sisteName: String
    let Summary: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(sisteName).foregroundColor(.blue)
                 .italic()
            HStack(alignment: .center) {
                CachedAsyncImage(url: URL(string: imageurl),transaction: Transaction(animation: .easeInOut)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 20)) .transition(.opacity)
                    } else {
                        HStack {
                            
                        }
                          
                    }
                }
            }
            Text(title)
                .font(.headline)
                .padding(8)
            
            Text(Summary)
                .lineLimit(6)
                .font(.body)
                .padding(8)
            
        }
        
    }
}

struct NewsArticle_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticle(title: "News App", imageurl: "", sisteName: "jayasri news app", Summary: " i need to crate news app. ")
    }
}
