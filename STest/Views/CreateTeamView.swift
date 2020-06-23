//
//  CreateTeamView.swift
//  STest
//
//  Created by Mehmet Karaaslan on 18.04.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct CreateTeamView: View {
    
    @EnvironmentObject var current: UserClass
    
    @State var showTeamNameAlert = false
    
    @ObservedObject var newTeam = newTeamClass()
    
    var body: some View {
        VStack {
            Form {
                Section {
                    HStack {
                        MyTextField(placeHolder: "Takım Adı", imageName: "", value: $newTeam.name)
                        
                        if newTeam.name != "" {
                            if newTeam.isOk {
                                MyImage(imageName: "checkmark.circle", imageColor: .green)
                            }
                            else {
                                MyImage(imageName: "x.circle",imageColor: .red)
                                    .alert(isPresented: $showTeamNameAlert){
                                        Alert(title: Text(""), message: Text("Zaten \(newTeam.name) isminde takımınız var."), dismissButton: .default(Text("Tamam")))
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
                Text("Takım Oluştur").myButton()
            }
            .padding([.leading, .trailing, .bottom])
        }
        .navigationBarTitle(Text("Takım Oluştur"))
        .onAppear(perform: {
            self.newTeam.getTeams(self.current.cTeams)
        })
    }
}

struct CreateTeam_Previews: PreviewProvider {
    static var previews: some View {
        CreateTeamView().environmentObject(UserClass())
    }
}
