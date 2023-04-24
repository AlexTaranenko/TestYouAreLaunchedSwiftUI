//
//  FavoriteButton.swift
//  TestYouAreLaunched
//
//  Created by Alex on 24.04.2023.
//

import SwiftUI

struct FavoriteButton: View {
    
    private let vendor: Vendor?
    private let onAction: () -> Void
    
    init(vendor: Vendor?, onAction: @escaping () -> Void) {
        self.vendor = vendor
        self.onAction = onAction
    }
    
    var body: some View {
        Button {
            onAction()
        } label: {
            ZStack {
                Circle()
                    .fill(fillColor)
                image
            }
        }
        .frame(width: 36, height: 36)
    }
    
    private var fillColor: Color {
        let favorited = vendor?.favorited ?? false
        return favorited ? Color(uiColor: Asset.Colors._55C595.color) : .white
    }
    
    private var image: Image {
        let favorited = vendor?.favorited ?? false
        if favorited {
            return Image(uiImage: Asset.Images.iconFavoriteSelected.image)
        }
        return Image(uiImage: Asset.Images.iconFavoriteNormal.image)
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(vendor: Vendor(id: 1, companyName: "", areaServed: "sdsdsds", shopType: nil, favorited: true, follow: false, businessType: .physical, coverPhoto: PhotoImage(id: 1, mediaUrl: "https://cdn-staging.chatsumer.app/eyJidWNrZXQiOiJjaGF0c3VtZXItZ2VuZXJhbC1zdGFnaW5nLXN0b3JhZ2UiLCJrZXkiOiIxMy84ZjMzZTgyNy0yNzIxLTQ3ZjctYjViNS0zM2Q5Y2E2MTM1OGQuanBlZyJ9", mediaType: .image), categories: nil, tags: nil)) {
            
        }
    }
}
