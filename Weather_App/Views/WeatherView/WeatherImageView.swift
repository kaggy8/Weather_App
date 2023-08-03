//
//  WeatherImageView.swift
//  Weather_App
//
//  Created by Stanislav Demyanov on 31.07.2023.
//

import SwiftUI

struct WeatherImageView: View {
    var body: some View {
        Image(systemName: "cloud.sun.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.yellow)
            .frame(width: 100, height: 100)
            .padding()
    }
}

struct WeatherImageView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherImageView()
    }
}
