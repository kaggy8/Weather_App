//
//  WeatherDescriptionView.swift
//  Weather_App
//
//  Created by Stanislav Demyanov on 31.07.2023.
//

import SwiftUI

struct WeatherDescriptionView: View {
    var description: String
    
    var body: some View {
        Text(description)
            .font(.title2)
            .foregroundColor(.white)
    }
}

struct WeatherDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDescriptionView(description: "Partly cloudy")
    }
}
