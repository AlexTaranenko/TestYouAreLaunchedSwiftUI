//
//  HeadlineBoldModifier.swift
//  TestYouAreLaunched
//
//  Created by Alex on 26.04.2023.
//

import SwiftUI

struct HeadlineBoldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 24, weight: .bold))
            .foregroundColor(Color(uiColor: Asset.Colors._289460.color))
    }
}
