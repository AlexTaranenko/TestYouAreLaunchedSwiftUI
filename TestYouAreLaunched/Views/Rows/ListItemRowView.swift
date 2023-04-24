//
//  ListItemRowView.swift
//  TestYouAreLaunched
//
//  Created by Alex on 24.04.2023.
//

import SwiftUI

struct ListItemRowView: View {
    
    private let vendor: Vendor?
    
    init(vendor: Vendor?) {
        self.vendor = vendor
    }
    
    var body: some View {
        VStack(alignment: .leading, content: {
            photoImageView
            Spacer(minLength: 10)
            headTitleView
            Spacer(minLength: 8)
            tagsView
        })
    }
    
    var photoImageView: some View {
            GeometryReader { geometryProxy in
                ZStack {
                    CoverPhotoContentView(photoImage: vendor?.coverPhoto)
                    cityWithFavoriteContentView
                }
                .frame(width: geometryProxy.size.width, height: geometryProxy.size.height / 2)
                .cornerRadius(10)
            }
    }
    
    private var cityWithFavoriteContentView: some View {
        VStack {
            HStack {
                Spacer()
                FavoriteButton(vendor: vendor) {
                    
                }
            }
            .padding(10)
            Spacer()
            HStack {
                cityView
                Spacer()
            }
            .padding(8)
        }
    }
    
    @ViewBuilder var cityView: some View {
        if let areaServed = vendor?.areaServed {
            Text(areaServed)
                .modifier(BodyModifier())
                .background(.white)
                .cornerRadius(16)
                .opacity(0.9)
        }
    }
    
    @ViewBuilder var headTitleView: some View {
        if let companyName = vendor?.companyName {
            Text(companyName)
                .modifier(HeadlineModifier())
        }
    }
    
    @ViewBuilder var tagsView: some View {
        if let tags = vendor?.tags {
            TagsContentView(tags: tags)
        }
    }
}

struct ListItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemRowView(vendor: Vendor(id: 1, companyName: "North St. Butchery", areaServed: "sdsdsds", shopType: nil, favorited: false, follow: false, businessType: .physical, coverPhoto: PhotoImage(id: 1, mediaUrl: "https://cdn-staging.chatsumer.app/eyJidWNrZXQiOiJjaGF0c3VtZXItZ2VuZXJhbC1zdGFnaW5nLXN0b3JhZ2UiLCJrZXkiOiIxMy84ZjMzZTgyNy0yNzIxLTQ3ZjctYjViNS0zM2Q5Y2E2MTM1OGQuanBlZyJ9", mediaType: .image), categories: nil, tags: [
            Tag(id: 1, name: "qwerty", purpose: .shop),
            Tag(id: 2, name: "uiop", purpose: .shop)
        ]))
    }
}
