//
//  SearchView.swift
//  TestYouAreLaunched
//
//  Created by Alex on 23.04.2023.
//

import SwiftUI

struct SearchView: View {
    
    @Binding private var text: String
    
    init(text: Binding<String>) {
        self._text = text
    }
    
    var body: some View {
        ZStack {
            HStack {
                TextField("Search...", text: $text)
                Image(uiImage: Asset.Images.iconSearch.image)
            }
            .padding(.vertical, .padding08dp + 1)
            .padding(.horizontal, .padding12dp + .padding02dp)
        }
        .background(background)
    }
    
    private var background: some View {
        ZStack {
            RoundedRectangle(cornerRadius: .radius16dp)
                .fill(.white)
                .shadow(color: .black.opacity(0.05), radius: .radius16dp - .radius02dp, x: 0, y: 6)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(text: .constant(""))
    }
}
