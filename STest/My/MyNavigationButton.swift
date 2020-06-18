//
//  MyNavigationButton.swift
//  STest
//
//  Created by Mehmet Karaaslan on 9.05.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct MyNavigationButton: View {
    
    var text: Text
    
    var body: some View {
        HStack {
            text.foregroundColor(.mainColor)
            MyImage(imageName: "arrowshape.turn.up.right")
        }
        .frame(maxWidth: .infinity)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.mainColor)
        )
    }
}
