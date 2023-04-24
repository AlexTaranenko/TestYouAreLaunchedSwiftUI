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
            .padding(.vertical, 9)
            .padding(.horizontal, 14)
        }
        .background(background)
    }
    
    private var background: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(.white)
                .shadow(color: .black.opacity(0.05), radius: 14, x: 0, y: 6)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(text: .constant(""))
    }
}
