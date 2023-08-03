//
//  TemperatureView.swift
//  Weather_App
//
//  Created by Stanislav Demyanov on 31.07.2023.
//

import SwiftUI

struct TemperatureView: View {
    var temperature: Double?
    
    var body: some View {
        if let temperature = temperature {
            Text("\(temperature, specifier: "%.1f")°C")
                .font(.system(size: 50))
                .fontWeight(.bold)
                .foregroundColor(.white)
        } else {
            Text("N/A")
                .font(.system(size: 50))
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
    }
}

struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView()
    }
}
