//
//  CreateProjectView.swift
//  STest
//
//  Created by Mehmet Karaaslan on 17.04.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct CreateProjectView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var projectName = ""
    @State var team = ""
    
    @EnvironmentObject var teamList: TeamClass
    
    var body: some View {
        VStack {
            
            VStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Projelerim")
                    }.padding(.leading)
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                
                Form {
                    Section {
                        MyTextField(placeHolder: "Proje Adı", imageName: "", value: $projectName)
                    }
                    /*
                    Section {
                        Picker(selection: $team, label: Text("Takım")){
                            //Text("Kişisel")
                            ForEach(teamList.createdList){
                                Text($0.teamName)
                            }
                            
                        }
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                    }*/
                }
                
                
                
                Button(action: {
                    
                }) {
                    Text("Proje Oluştur")
                }
                .myButton()
                .padding([.leading, .trailing, .bottom])
            }
            //.frame(maxHeight: .infinity) not needed if form is used
            
            
            
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct CreateProjectView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProjectView().environmentObject(TeamClass())
    }
}
