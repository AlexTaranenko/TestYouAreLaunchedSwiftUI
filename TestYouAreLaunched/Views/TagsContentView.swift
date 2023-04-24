//
//  TagsContentView.swift
//  TestYouAreLaunched
//
//  Created by Alex on 24.04.2023.
//

import SwiftUI

struct TagsContentView: View {
    
    private let tags: [Tag]
    
    init(tags: [Tag]) {
        self.tags = tags
    }
    
    var body: some View {
        Text(tags.compactMap({"• \($0.name ?? "")" }).joined(separator: " "))
            .modifier(BodyModifier(color: Color(uiColor: Asset.Colors._949494.color)))
    }
}

struct TagsContentView_Previews: PreviewProvider {
    static var previews: some View {
        TagsContentView(tags: [
            Tag(id: 1, name: "qwertyuiop", purpose: nil)
        ])
    }
}
