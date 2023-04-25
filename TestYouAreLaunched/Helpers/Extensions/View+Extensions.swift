//
//  View+Extensions.swift
//  TestYouAreLaunched
//
//  Created by Alex on 26.04.2023.
//

import SwiftUI

extension View {
    func errorAlert(error: Binding<Error?>) -> some View {
        self.modifier(ErrorAlertModifier(error: error))
    }
}
