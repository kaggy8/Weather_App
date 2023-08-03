//
//  WeatherButtonView.swift
//  Weather_App
//
//  Created by Stanislav Demyanov on 31.07.2023.
//

import SwiftUI

struct WeatherButtonView: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Text(LocalizedStringKey("Get Weather"))
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 200, height: 50)
                .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]),
                                           startPoint: .leading,
                                           endPoint: .trailing))
                .cornerRadius(25)
        })
        .padding(.top)
    }
}

struct WeatherButtonView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherButtonView(action: {})
    }
}
