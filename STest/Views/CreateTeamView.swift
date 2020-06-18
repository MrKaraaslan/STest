//
//  CreateTeamView.swift
//  STest
//
//  Created by Mehmet Karaaslan on 18.04.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct CreateTeamView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var teamList: TeamClass
    
    @State var showTeamNameAlert = false
    
    var body: some View {
        VStack {
            VStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Takımlarım")
                    }.padding(.leading)
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
            
            Form {
                Section {
                    HStack {
                        MyTextField(placeHolder: "Takım Adı", imageName: "", value: $teamList.newName)
                        
                        if teamList.newName != "" {
                            if teamList.isOk {
                                MyImage(imageName: "checkmark.circle", imageColor: .green)
                            }
                            else {
                                MyImage(imageName: "x.circle",imageColor: .red)
                                    .alert(isPresented: $showTeamNameAlert){
                                        Alert(title: Text(""), message: Text("Zaten \(teamList.newName) isminde takımınız var."), dismissButton: .default(Text("Tamam")))
                                    }.onTapGesture {
                                        self.showTeamNameAlert = true
                                }
                            }
                        }
                    }
                    
                }
            }
            
            Button(action: {
                
            }) {
                Text("Takım Oluştur")
            }
            .myButton()
            .padding([.leading, .trailing, .bottom])
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct CreateTeam_Previews: PreviewProvider {
    static var previews: some View {
        CreateTeamView().environmentObject(TeamClass())
    }
}
