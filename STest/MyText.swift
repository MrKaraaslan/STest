//
//  MyText.swift
//  STest
//
//  Created by Mehmet Karaaslan on 16.04.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct MyText: View {
    
    var text: String
    var imageName: String
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text(text)
                    .frame(height: 30)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)
                Image(systemName: imageName)
                    .frame(width: 30, height: 30)
                    .imageScale(.large)
                    .font(.system(size: 20))
                    .foregroundColor(.mainColor)
            }
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.grayColor)
            
        }.frame(alignment: .leading)
    }
}
