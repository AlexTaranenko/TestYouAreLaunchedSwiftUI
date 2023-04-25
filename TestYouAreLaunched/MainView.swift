//
//  ContentView.swift
//  TestYouAreLaunched
//
//  Created by Alex on 23.04.2023.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Properties
    @StateObject var mainViewModel = MainViewModel()
    @State(initialValue: nil) private var error: Error?
    
    // MARK: - Body
    var body: some View {
        ZStack {
            VStack {
                SearchView(text: $mainViewModel.searchText)
                
                if mainViewModel.filteredVendors.isEmpty && !mainViewModel.searchText.isEmpty {
                        ZStack {
                            Color.clear.edgesIgnoringSafeArea(.all)
                            EmptyResultView()
                        }
                } else {
                    List {
                        ForEach(mainViewModel.filteredVendors, id: \.id) { vendor in
                            ListItemRowView(vendor: vendor)
                                .listRowSeparator(.hidden)
                        }
                    }
                    .listStyle(.plain)
                    .scrollIndicators(.hidden)
                }
            }
        }
        .onAppear {
            do {
                try mainViewModel.loadVendors()
            } catch let error {
                self.error = error
            }
        }
        .errorAlert(error: $error)
        .padding(.vertical, .padding24dp)
        .padding(.horizontal, .padding16dp)
        .edgesIgnoringSafeArea(.bottom)
    }
}

#if DEBUG
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
#endif
