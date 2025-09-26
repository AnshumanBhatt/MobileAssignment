//
//  ComputerList.swift
//  Assignment
//
//  Created by Kunal on 03/01/25.
//

import SwiftUI

struct DevicesList: View {
    let devices: [DeviceData]
    let onSelect: (DeviceData) -> Void // Callback for item selection

    var body: some View {
        List(devices) { device in
            NavigationLink(value: device) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(device.name)
                        .font(.title2)
                    
                    if let color = device.data?.color {
                        Text(color)
                            .font(.headline)
                    }
                    if let capacity = device.data?.capacity {
                        Text(capacity)
                            .font(.headline)
                    }
                    
                    AssignmentText(text: device.name)
                  
                }
            }
            
        }
    }
}
