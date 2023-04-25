//
//  ErrorAlertModifier.swift
//  TestYouAreLaunched
//
//  Created by Alex on 26.04.2023.
//

import SwiftUI

struct ErrorAlertModifier: ViewModifier {
    
    @Binding var error: Error?
        
    private var isShowingError: Binding<Bool> {
        Binding {
            error != nil
        } set: { _ in
            error = nil
        }
    }
    
    func body(content: Content) -> some View {
        content
            .alert(isPresented: isShowingError) {
                Alert(title: Text("Error"),
                      message: Text(error?.localizedDescription ?? ""),
                      dismissButton: .default(Text("OK"), action: {
                    error = nil
                }))
            }
    }
}
