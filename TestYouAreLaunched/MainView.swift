//
//  ContentView.swift
//  TestYouAreLaunched
//
//  Created by Alex on 23.04.2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            SearchView(text: .constant(""))
                .padding(.bottom, 24)
            List {
                
            }
        }
        .padding(.vertical, 24)
        .padding(.horizontal, 16)
    }
}

#if DEBUG
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
#endif
