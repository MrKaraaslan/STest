//
//  ProfileView.swift
//  STest
//
//  Created by Mehmet Karaaslan on 8.04.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var current: UserClass
    @State var logout = false
    
    @State var showImageSheet = false
    @State var showImagePicker = false
    @State var useCamera = false
    
    @State var showSettings = false
    
    @EnvironmentObject var teamList: TeamClass
    
    var body: some View {
        NavigationView {
            VStack(spacing: 32) {
                //user image
                ZStack(alignment: .bottomTrailing) {
                    if(self.current.user.image != nil){
                        self.current.user.image?
                            .resizable()
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
                        MyImage(imageName: "person.crop.circle.badge.plus")
                            .background(Color.white)
                            .clipShape(Circle())
                            .actionSheet(isPresented: $showImageSheet){
                                ActionSheet(
                                    title: Text("İşleminizi Seçiniz"),
                                    buttons: self.current.user.image == nil ? [
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
                        ImagePickerView(isShown: self.$showImagePicker, image: self.$current.user.image, useCamera: self.$useCamera)
                    })
                }.padding(.top)
                // user image ends
                
                VStack(spacing: 16) {
                    MyText(header: Text("Kullanıcı Adı"), text: self.current.user.name, imageName: "person.circle")
                    MyText(header: Text("Email"), text: self.current.user.email, imageName: "envelope")
                    NavigationLink(destination: TeamsView().environmentObject(teamList).environmentObject(current)) {
                        MyNavigationButton(text: Text("Takımlarım"))
                    }
                    NavigationLink(destination: ProjectsView()) {
                        MyNavigationButton(text: Text("Projelerim"))
                    }
                    
                    
                    
                    
                    
                }
                
                
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding([.leading, .trailing])
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(
                leading:
                MyImage(imageName: "gear")
                    .onTapGesture {
                        self.showSettings = true
                }
                .sheet(isPresented: $showSettings, onDismiss: {
                    if self.logout {
                        self.current.isLoggedIn = false
                    }
                }, content: {
                    SettingsView(logout: self.$logout)
                }),
                trailing:
                MyImage(imageName: "bell")
            )
        }
    }
    
    func deleteImage(){
        self.current.user.image = nil //: firebase
    }
}

struct Profileview_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(TeamClass()).environmentObject(UserClass())
    }
}
