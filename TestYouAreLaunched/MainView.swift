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
    
    // MARK: - Body
    var body: some View {
        VStack {
            SearchView(text: $mainViewModel.searchText)
            
            if mainViewModel.filteredVendors.isEmpty {
                
            }
                
            List {
                ForEach(mainViewModel.filteredVendors, id: \.id) { vendor in
                    ListItemRowView(vendor: vendor)
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
        }
        .onAppear {
            do {
                try mainViewModel.loadVendors()
            } catch let error {
                debugPrint(error)
            }
        }
        .padding(.vertical, .padding24dp)
        .padding(.horizontal, .padding16dp)
    }
}

#if DEBUG
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
#endif
