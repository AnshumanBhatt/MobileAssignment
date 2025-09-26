//
//  ContentViewModel.swift
//  Assignment
//
//  Created by Kunal on 10/01/25.
//

import Foundation


class ContentViewModel : ObservableObject {
    
    private let apiService = ApiService()
    @Published var navigateDetail: DeviceData? = nil
    @Published var data: [DeviceData]? = []
    @Published var searchText:String = ""

    func fetchAPI() {
        apiService.fetchDeviceDetails { item in
            DispatchQueue.main.async {
                self.data = item
            }
            
        }
    }
    
    func navigateToDetail(navigateDetail: DeviceData) {
        self.navigateDetail = navigateDetail
    }
    
    var filterData: [DeviceData]? {
        if searchText.isEmpty {
            return data
        } else {
            return data!.filter {  device in
                device.name.localizedCaseInsensitiveContains(searchText) || (device.data?.description?.localizedCaseInsensitiveContains(searchText) ?? false) || (device.data?.color?.localizedCaseInsensitiveContains(searchText) ?? false)
                
            }
        }
    }
}
