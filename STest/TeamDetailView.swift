//
//  TeamDetailView.swift
//  STest
//
//  Created by Mehmet Karaaslan on 18.04.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct TeamDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var team: Team
    var isCreator: Bool
    
    @State var showDeleteSheet = false
    
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
            
            VStack {
                VStack {
                    team.teamImage
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity)
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                    
                    MyText(header: Text("Takım adı"), text: team.teamName, imageName: "")
                    
                    if !isCreator {
                        MyText(header: Text("Takım lideri"), text: team.creator, imageName: "")
                    }
                    Bar(members: team.teamMembers, capacity: team.teamCapacitiy, progress: team.teamFullness)
                    
                    
                    
                    
                }
                .frame(maxHeight: .infinity, alignment: .top)
                
                Button(action: {
                    self.showDeleteSheet = true
                }) {
                    VStack {
                        if self.isCreator {
                            Text("Takımı Sil")
                        }
                        else {
                            Text("Takımdan Ayrıl")
                        }
                    }
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.red)
                    )
                    .foregroundColor(.red)
                    .actionSheet(isPresented: $showDeleteSheet){
                        ActionSheet(
                            title: Text("Bu işlemi geri alamazsınız!"),
                            message: isCreator ? Text("Takımı silmeniz bütün takım projelerini siler") : nil,
                            buttons: [
                                isCreator ?
                                .destructive(Text("Takımı Sil")): //: actions
                                .destructive(Text("Takımdan Ayrıl")),
                                .cancel(Text("Vazgeç"))
                            ])
                    }
                }
                
                

            }.padding([.leading, .trailing])
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct TeamDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TeamDetailView(team: teams[3], isCreator: false)
    }
}

struct Bar: View {
    
    var members: Int
    var capacity: Int
    var progress: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .opacity(0.3)
                    .foregroundColor(.mainColor)
                
                Rectangle()
                    .foregroundColor(.mainColor)
                    .frame(width: geometry.size.width*CGFloat(self.progress))
                
                Text("\(self.members) / \(self.capacity)")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(.white)
            }.cornerRadius(20)
        }.frame(height: 40)
    }
}
