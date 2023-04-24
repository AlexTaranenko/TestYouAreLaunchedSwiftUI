//
//  PrimaryModifier.swift
//  TestYouAreLaunched
//
//  Created by Alex on 24.04.2023.
//

import SwiftUI

struct BodyModifier: ViewModifier {
    
    private let color: Color
    
    init(color: Color = Color(uiColor: Asset.Colors._575757.color)) {
        self.color = color
    }
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14))
            .foregroundColor(color)
            .padding(.vertical, 2)
            .padding(.horizontal, 8)
    }
}
