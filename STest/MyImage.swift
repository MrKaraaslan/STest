//
//  MyImage.swift
//  STest
//
//  Created by Mehmet Karaaslan on 16.04.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct MyImage: View {
    
    var imageName: String
    
    var body: some View {
        Image(systemName: imageName)
            .imageScale(.large)
            .frame(width: 40, height: 40, alignment: .center)
            .foregroundColor(.mainColor)
    }
}
