//
//  TeamsView.swift
//  STest
//
//  Created by Mehmet Karaaslan on 18.04.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct TeamsView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var teams = TeamClass()
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Profil")
                        }
                    }
                    Spacer()
                    MyImage(imageName: "questionmark.circle")
                }
            }.padding([.leading, .trailing])
            
            
            Form {
                Section(header: Text("Oluşturduğum Takımlar")) {
                    ForEach(teams.createdList, id: \.id) { team in
                        HStack {
                            team.teamImage
                                .resizable()
                                .frame(width: 60, height: 60)
                            Text(team.teamName)
                        }
                    }
                }
                Section(header: Text("Katıldığım Takımlar")) {
                    ForEach(teams.memberList, id: \.id) { team in
                        HStack {
                            team.teamImage
                                .resizable()
                                .frame(width: 60, height: 60)
                            VStack {
                                Text(team.teamName).frame(maxWidth: .infinity, alignment: .leading)
                                Text(team.creator).frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }
                }
            }
            
            VStack {
                NavigationLink(destination: CreateTeamView()) {
                    HStack {
                        Text("Takım Oluştur").foregroundColor(.mainColor)
                        MyImage(imageName: "arrowshape.turn.up.right")
                    }
                    .frame(maxWidth: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.mainColor)
                    )
                }
            }.padding([.leading, .trailing])
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .onAppear(perform: {
            self.teams.lister()
        })
    }
}

struct TeamsView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsView()
    }
}
