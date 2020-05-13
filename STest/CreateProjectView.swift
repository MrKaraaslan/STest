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
    @EnvironmentObject var teamList: TeamClass
    
    @State var projectName = ""
    @State var isTeam = false
    @State var team = ""
    
    
    
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
                    
                    Section {
                        Toggle(isOn: $isTeam) {
                            Text("Takım")
                        }
                        
                        if isTeam {
                            Picker("", selection: $team){
                                ForEach(teamList.createdList) { team in
                                    HStack {
                                        team.teamImage
                                            .renderingMode(Image.TemplateRenderingMode.original)
                                            .resizable()
                                            .frame(width: 55, height: 55)
                                            .clipShape(Circle())
                                        
                                        Text(team.teamName)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                    .tag(team.teamName)
                                }
                            }
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                        }
                    }
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

/*
 ZStack {
     ProgressBar(progress: team.teamFullness)
         .frame(width: 60, height: 60)
     
     team.teamImage
         .resizable()
         .frame(width: 55, height: 55)
         .clipShape(Circle())
 }
 Text(team.teamName)
 
 
 */
struct CreateProjectView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProjectView().environmentObject(TeamClass())
    }
}
