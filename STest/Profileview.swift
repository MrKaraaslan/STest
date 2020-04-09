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
    @State var showImageSheet = false
    @State var showImagePicker = false
    @State var useCamera = false
    
    var body: some View {
        VStack {
            
            ZStack(alignment: .bottomTrailing) {
                if(image != nil){
                    image?.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                }
                else {
                    ZStack {
                        Color.gray
                            .frame(width: 150, height: 150)
                                            
                        Image(systemName: "camera").imageScale(.large)

                    }.clipShape(Circle())
                }
                
                Button(action: {
                    self.showImageSheet = true
                }) {
                    Image(systemName: "person.crop.circle.badge.plus")
                        .imageScale(.large)
                        .foregroundColor(.mainColor)
                        .frame(width: 50, height: 50)
                        .background(Color.white)
                        .clipShape(Circle())
                        .actionSheet(isPresented: $showImageSheet){
                            ActionSheet(
                                title: Text("title"),
                                buttons: image == nil ? [
                                    .default(Text("Fotoğraf Çek"), action: {
                                        self.useCamera = true
                                        self.showImagePicker = true
                                    }),
                                    .default(Text("Galeriden Seç"), action: {
                                        self.useCamera = false
                                        self.showImagePicker = true
                                    }),
                                    .cancel(Text("Vazgeç"))
                                ]:[
                                    .default(Text("Fotoğraf Çek"), action: {
                                        self.useCamera = true
                                        self.showImagePicker = true
                                    }),
                                    .default(Text("Galeriden Seç"), action: {
                                        self.useCamera = false
                                        self.showImagePicker = true
                                    }),
                                    .destructive(Text("Fotoğrafı Kaldır"), action: {
                                        self.deleteImage()
                                    }),
                                    .cancel(Text("Vazgeç"))
                            ])
                    }
                }.sheet(isPresented: $showImagePicker, content: {
                    CaptureImageView(isShown: self.$showImagePicker, image: self.$image, useCamera: self.$useCamera)
                })
            }
        }
    }
    
    func deleteImage(){
        self.image = nil //: firebase
    }
}

struct Profileview_Previews: PreviewProvider {
    static var previews: some View {
        Profileview()
    }
}
