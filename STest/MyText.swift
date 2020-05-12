//
//  MyText.swift
//  STest
//
//  Created by Mehmet Karaaslan on 16.04.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct MyText: View {
    
    var header: Text
    var text: String
    var imageName: String
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                header
                    .frame(height: 15)
                    .font(.system(size: 12))
                    .foregroundColor(.grayColor)
            }.frame(maxWidth: .infinity, alignment: .leading)
            HStack(spacing: 0) {
                Text(text)
                    .frame(height: 30)
                    .frame(maxWidth: .infinity, alignment: .leading)
                if imageName != ""{
                    Image(systemName: imageName)
                    .frame(width: 30, height: 30)
                    .imageScale(.large)
                    .font(.system(size: 20))
                    .foregroundColor(.mainColor)
                }
            }.padding([.leading, .trailing], 8)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.grayColor)
            
        }.frame(alignment: .leading)
    }
}

struct MyText_Previews: PreviewProvider {
    static var previews: some View {
        MyText(header: Text("Header"), text: "text", imageName: "person")
    }
}
