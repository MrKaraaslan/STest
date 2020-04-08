//
//  Profileview.swift
//  STest
//
//  Created by Mehmet Karaaslan on 8.04.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct Profileview: View {
    
    @State var image: Image? = nil
    @State var showImagePicker = false
    @State var useCamera = false
    
    var body: some View {
        VStack {
            
            ZStack(alignment: .bottomTrailing) {
                ZStack {
                    Color.gray
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                    
                    Image(systemName: "camera").imageScale(.large)
                }
                Button(action: {
                    self.showImagePicker = true
                }) {
                    Image(systemName: "person.crop.circle.badge.plus")
                    .imageScale(.large)
                    .foregroundColor(.mainColor)
                    .frame(width: 50, height: 50)
                    .background(Color.white)
                    .clipShape(Circle())
                }.sheet(isPresented: $showImagePicker, content: {
                    CaptureImageView(isShown: self.$showImagePicker, image: self.$image, useCamera: self.$useCamera)
                })
            }
        }
    }
}

struct Profileview_Previews: PreviewProvider {
    static var previews: some View {
        Profileview()
    }
}
