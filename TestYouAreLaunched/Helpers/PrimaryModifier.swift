//
//  PrimaryModifier.swift
//  TestYouAreLaunched
//
//  Created by Alex on 24.04.2023.
//

import SwiftUI

struct PrimaryModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14))
            .foregroundColor(Color(uiColor: Asset.Colors._575757.color))
            .padding(.vertical, 2)
            .padding(.horizontal, 8)
    }
}
