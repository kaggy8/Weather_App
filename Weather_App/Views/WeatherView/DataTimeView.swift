//
//  DataTimeView.swift
//  Weather_App
//
//  Created by Stanislav Demyanov on 03.08.2023.
//

import SwiftUI

struct DataTimeView: View {
    var date: Date
    
    var body: some View {
        Text(formatDate(date: date))
            .font(.subheadline)
            .foregroundColor(.white)
    }
    
    private func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM HH:mm"
        
        return dateFormatter.string(from: date)
    }
}

struct DataTimeView_Previews: PreviewProvider {
    static var previews: some View {
        DataTimeView(date: Date())
    }
}
