//
//  View+Extensions.swift
//  Weather_App
//
//  Created by Stanislav Demyanov on 02.08.2023.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
