//
//  CityInputView.swift
//  Weather_App
//
//  Created by Stanislav Demyanov on 31.07.2023.
//

import SwiftUI

struct CityInputView: View {
    @Binding var city: String
    
    var body: some View {
        TextField(LocalizedStringKey("Enter city"), text: $city)
            .padding()
            .frame(height: 40)
            .submitLabel(.done)
            .background(Color.white.opacity(0.5))
            .cornerRadius(10)
            .padding(.horizontal)
    }
}

struct CityInputView_Previews: PreviewProvider {
    static var previews: some View {
        CityInputView(city: .constant("Enter city"))
    }
}
