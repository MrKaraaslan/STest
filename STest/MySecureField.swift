//
//  UnderlinedSecureField.swift
//  STest
//
//  Created by Mehmet Karaaslan on 6.04.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct MySecureField: View {
    
    var placeHolder: String
    var imageName: String
    @Binding var value: String

    var body: some View {
        VStack(spacing: 0) {
            
            Text(placeHolder).frame(height: 10).frame(maxWidth: .infinity, alignment: .leading).foregroundColor(.grayColor).font(.system(size: 10))
            
            HStack(spacing: 0) {
                SecureField("", text: $value)
                    .frame(height: 40)
                Image(systemName: imageName)
                    .frame(width: 40, height: 40)
                    .imageScale(.large)
                    .font(.system(size: 20))
                    .foregroundColor(.mainColor)
            }
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.grayColor)
        }
    }
}
