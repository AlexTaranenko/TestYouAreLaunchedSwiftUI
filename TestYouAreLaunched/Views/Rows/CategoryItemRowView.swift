//
//  CategoryItemRowView.swift
//  TestYouAreLaunched
//
//  Created by Alex on 25.04.2023.
//

import Kingfisher
import SwiftUI
import Foundation

struct CategoryItemRowView: View {
    
    private let category: Category?
    
    init(category: Category?) {
        self.category = category
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 0, content: {
            iconView
            titleView
        })
        .padding(.zero)
    }
    
    @ViewBuilder private var iconView: some View {
        if let mediaUrl = category?.image?.mediaUrl {
                KFImage(URL(string: mediaUrl))
                .setProcessor(SVGImgProcessor())
                    .resizable()
                    .aspectRatio(CGSize(width: 22, height: 22), contentMode: .fit)
                    .frame(width: 22, height: 22)
        }
    }
    
    private var titleView: some View {
        Text(category?.name ?? "")
            .modifier(BodyModifier())
            .fixedSize()
    }
}

struct CategoryItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemRowView(category: Category(id: 1, name: "Florists", image: PhotoImage(id: 1, mediaUrl: "https://media-staging.chatsumer.app/48/1830f855-6315-4d3c-a5dc-088ea826aef2.svg", mediaType: .image)))
    }
}
