//
//  ContentView.swift
//  Assignment
//
//  Created by Kunal on 03/01/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    @State private var path: [DeviceData] = [] // Navigation path

    var body: some View {
        NavigationStack(path: $path) {
            Group {
                if !viewModel.data!.isEmpty {
                    DevicesList(devices: viewModel.data!) { selectedComputer in
                        viewModel.navigateToDetail(navigateDetail: selectedComputer)
                    }
                } else  {
                     if viewModel.searchText.isEmpty {
                        ProgressView("Loading...")
                    } else {
                        ContentUnavailableView("No results," , systemImage: "magnifyingglass")
                    }
                }
            }
            .onChange(of: viewModel.navigateDetail) { value in
                if let navigate = value {
                    path.append(navigate)
                }
            }
            .navigationTitle("Devices")
            .navigationDestination(for: DeviceData.self) { computer in
                DetailView(device: computer)
            }
            .searchable(text: $viewModel.searchText, prompt: "Search")
            .onAppear {
                viewModel.fetchAPI()
            }
        }
    }
}
