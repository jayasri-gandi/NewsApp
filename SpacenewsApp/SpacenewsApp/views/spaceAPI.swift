//
//  spaceAPI.swift
//  SpacenewsApp
//
//  Created by Jayasri  on 21/09/22.
//

import SwiftUI

struct spaceAPI: View {
    @StateObject var data = SpaceAPI()
    @State private var opac = 0.0
    var body: some View {
        NavigationView {
            VStack {
                newsView()
                    .opacity(opac)
            }
//        .navigationTitle("Space News")
            .environmentObject(data)
            .onAppear {
                data.getData()
                
                withAnimation(.easeIn(duration: 2)) {
                    opac = 1.0
                }
            }
        }
    }
}

struct spaceAPI_Previews: PreviewProvider {
    static var previews: some View {
        spaceAPI()
    }
}
