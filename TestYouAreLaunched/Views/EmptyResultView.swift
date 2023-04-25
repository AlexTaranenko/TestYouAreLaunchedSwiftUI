//
//  EmptyResultView.swift
//  TestYouAreLaunched
//
//  Created by Alex on 26.04.2023.
//

import SwiftUI

struct EmptyResultView: View {
    var body: some View {
        VStack(spacing: .spacing08dp, content: {
            Text("Sorry! No results found...")
                .modifier(HeadlineBoldModifier())
            
            Text("Please try a different search request or browse businesses from the list")
                .modifier(BodyModifier())
                .font(.system(size: 16))
                .multilineTextAlignment(.center)
        })
    }
}

struct EmptyResultView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyResultView()
    }
}
