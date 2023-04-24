//
//  CoverPhotoContentView.swift
//  TestYouAreLaunched
//
//  Created by Alex on 24.04.2023.
//

import Kingfisher
import SwiftUI

struct CoverPhotoContentView: View {
    
    private let photoImage: PhotoImage?
    
    init(photoImage: PhotoImage?) {
        self.photoImage = photoImage
    }

    var body: some View {
        ZStack {
            GeometryReader { proxy in
                photoView
                    .frame(width: proxy.size.width, height: proxy.size.height)
                linearGradientView
            }
        }
    }
    
    @ViewBuilder var photoView: some View {
        if let mediaUrl = photoImage?.mediaUrl {
            KFImage(URL(string: mediaUrl))
                .resizable()
                .scaledToFill()
        }
    }
        
    private var linearGradientView: some View {
        LinearGradient(colors: [
            Color(uiColor: Asset.Colors._323232.color.withAlphaComponent(0)),
            Color(uiColor: Asset.Colors._131313.color)
        ], startPoint: .top, endPoint: .bottom)
        .opacity(0.8)
    }
}

struct CoverPhotoContentView_Previews: PreviewProvider {
    static var previews: some View {
        CoverPhotoContentView(photoImage: PhotoImage(id: 1, mediaUrl: "https://cdn-staging.chatsumer.app/eyJidWNrZXQiOiJjaGF0c3VtZXItZ2VuZXJhbC1zdGFnaW5nLXN0b3JhZ2UiLCJrZXkiOiIxMy84ZjMzZTgyNy0yNzIxLTQ3ZjctYjViNS0zM2Q5Y2E2MTM1OGQuanBlZyJ9", mediaType: .image))
    }
}
