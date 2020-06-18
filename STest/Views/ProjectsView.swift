//
//  ProjectsView.swift
//  STest
//
//  Created by Mehmet Karaaslan on 17.04.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct ProjectsView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var teamList: TeamClass
    
    var body: some View {
        VStack {
            
            VStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Profil")
                    }.padding(.leading)
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
            
            Form {
                Section(header: Text("Oluşturduğum projeler")) {
                    Text("coming")
                }
                Section(header: Text("Katıldığım projeler")){
                    Text("soon")
                }
            }//on tap navigate to next view to see details
            
            
            VStack {
                NavigationLink(destination: CreateProjectView()) {
                    MyNavigationButton(text: Text("Proje Oluştur"))
                }
            }.padding([.leading, .trailing, .bottom])
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct ProjectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsView().environmentObject(TeamClass())
    }
}
