//
//  Extensions.swift
//  STest
//
//  Created by Mehmet Karaaslan on 6.04.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

// contains extensions and modifiers

import SwiftUI

extension Color {
    static let mainColor = Color(red: 71/255, green: 56/255, blue: 250/255)
    static let grayColor = Color(red: 127/255, green: 140/255, blue: 151/255)
}

extension View {
    func myButton() -> some View {
        self.modifier(ButtonModifier())
    }
}



struct ButtonModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(Color.mainColor)
            .cornerRadius(25)
    }
}
