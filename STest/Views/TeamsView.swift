//
//  TeamsView.swift
//  STest
//
//  Created by Mehmet Karaaslan on 18.04.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct TeamsView: View {
    
    @EnvironmentObject var current: UserClass
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Oluşturduğum Takımlar")) {
                    if current.cTeams.isEmpty {
                        Text("Henüz bir takım oluşturmadınız!")
                    }
                    else {
                        ForEach(current.cTeams, id: \.id) { team in
                            NavigationLink(destination: TeamDetailView(team: team, isCreator: true)) {
                                CreatedTeams(team: team)
                            }
                        }
                    }
                }
                Section(header: Text("Katıldığım Takımlar")) {
                    if current.mTeams.isEmpty {
                        Text("Henüz bir takıma katılmadınız!")
                    }
                    else {
                        ForEach(current.mTeams, id: \.id) { team in
                            NavigationLink(destination: TeamDetailView(team: team, isCreator: false)) {
                                MemberTeams(team: team)
                            }
                        }
                    }
                    
                }
            }
            
            VStack {
                NavigationLink(destination: CreateTeamView().environmentObject(current)) {
                    MyNavigationButton(text: Text("Takım Oluştur"))
                }
            }.padding([.leading, .trailing, .bottom])
        }
        .navigationBarTitle(Text("Takımlarım"))
        .navigationBarItems(trailing:
            MyImage(imageName: "questionmark.circle")
        )
    }
}

struct TeamsView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsView().environmentObject(UserClass())
    }
}

struct CreatedTeams: View {
    
    var team: Team
    
    var body: some View {
        HStack {
            ZStack {
                ProgressBar(progress: team.teamFullness)
                    .frame(width: 60, height: 60)
                
                team.teamImage
                    .resizable()
                    .frame(width: 55, height: 55)
                    .clipShape(Circle())
            }
            Text(team.teamName)
        }
    }
}

struct MemberTeams: View {
    
    var team: Team
    
    var body: some View {
        HStack {
            ZStack {
                ProgressBar(progress: team.teamFullness)
                    .frame(width: 60, height: 60)
                
                team.teamImage
                    .resizable()
                    .frame(width: 55, height: 55)
                    .clipShape(Circle())
            }
            VStack {
                Text(team.teamName).frame(maxWidth: .infinity, alignment: .leading)
                Text(team.creator).frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

struct ProgressBar: View {
    
    var progress: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 5.0)
                .opacity(0.3)
                .foregroundColor(.mainColor)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(self.progress))
                .stroke(style: StrokeStyle(lineWidth: 5.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(.mainColor)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
        }
    }
}
