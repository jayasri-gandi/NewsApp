//
//  newsView.swift
//  SpacenewsApp
//
//  Created by Jayasri  on 20/09/22.
//

import SwiftUI

struct newsView: View {
    let colums: [GridItem] = [
        GridItem(.flexible(),spacing: nil,alignment: nil),
        GridItem(.flexible(),spacing: nil,alignment: nil)
    ]
    @EnvironmentObject var data : SpaceAPI
    @Environment(\.openURL) var openUrl
    private var textWidth = 300.0
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: colums) {
                Section(header:Text("Section")) {
                    ForEach(data.news) { news in
                        
                        NewsArticle(title: news.title, imageurl: news.imageUrl, sisteName: news.newsSite, Summary: news.summary).onTapGesture {
                            openUrl(URL(string: news.url)!)
                        }
                        
                    }
                }
                
            }
            .refreshable {
                data.getData()
            }
        }
    }
}

struct newsView_Previews: PreviewProvider {
    static var previews: some View {
        newsView()
            .environmentObject(SpaceAPI())
    }
}
