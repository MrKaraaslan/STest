//
//  MySecureField.swift
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
            
            if placeHolder != "" {
                Text(placeHolder).frame(height: 10).frame(maxWidth: .infinity, alignment: .leading).foregroundColor(.grayColor).font(.system(size: 10))
            }
            
            HStack(spacing: 0) {
                SecureField("", text: $value)
                    .frame(height: 40)
                    .padding(.leading, 8)
                if imageName != "" {
                    Image(systemName: imageName)
                        .frame(width: 40, height: 40)
                        .imageScale(.large)
                        .font(.system(size: 20))
                        .foregroundColor(.mainColor)
                        .padding(.trailing, 8)
                }
            }
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.grayColor)
        }
    }
}
