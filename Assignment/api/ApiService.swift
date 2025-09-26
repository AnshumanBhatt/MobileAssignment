//
//  ApiService.swift
//  Assignment
//
//  Created by Kunal on 10/01/25.
//

import Foundation

class ApiService : NSObject {
    
    private let sourcesURL = URL(string: "https://api.restful-api.dev/objects")!
    
    func fetchDeviceDetails(completion : @escaping ([DeviceData]) -> ()){
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let error = error {
                print("Network error: \(error.localizedDescription)")
                completion([]) // Return an empty array on network failure
                return
            }
            
            guard let data = data else {
                print("No data")
                completion([])
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let empData = try? jsonDecoder.decode([DeviceData].self, from: data)
                completion(empData!)
            }
            catch {
                print("Error: \(error.localizedDescription)")
                completion([])
            }
               
        }.resume()
    }
}

