//
//  Profileview.swift
//  STest
//
//  Created by Mehmet Karaaslan on 8.04.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct Profileview: View {
    
    @State var userImage: Image? = nil
    @State var showImageSheet = false
    @State var showImagePicker = false
    @State var useCamera = false
    
    @State var showSettings = false
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "gear")
                    .myIcon()
                    .onTapGesture {
                        self.showSettings = true
                    }
                    .sheet(isPresented: $showSettings, content: {
                        SettingsView()
                    })
                Spacer()
                Image(systemName: "bell").myIcon()
            }
            VStack {
                //user image
                ZStack(alignment: .bottomTrailing) {
                    if(userImage != nil){
                        userImage?.resizable()
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
                            .myIcon()
                            .background(Color.white)
                            .clipShape(Circle())
                            .actionSheet(isPresented: $showImageSheet){
                                ActionSheet(
                                    title: Text("İşleminizi Seçiniz"),
                                    buttons: userImage == nil ? [
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
                        CaptureImageView(isShown: self.$showImagePicker, image: self.$userImage, useCamera: self.$useCamera)
                    })
                }
                // user image ends
                
                Text("name")
                
                
            }.frame(maxHeight: .infinity, alignment: .top)
            
        }.padding([.leading, .trailing], 16)
    }
    
    func deleteImage(){
        self.userImage = nil //: firebase
    }
}

struct Profileview_Previews: PreviewProvider {
    static var previews: some View {
        Profileview()
    }
}
