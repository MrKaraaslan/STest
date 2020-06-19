//
//  ProjectsView.swift
//  STest
//
//  Created by Mehmet Karaaslan on 17.04.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct ProjectsView: View {
    
    @EnvironmentObject var teamList: TeamClass
    
    var body: some View {
        VStack {
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
        .navigationBarTitle("Projelerim")
        
    }
}

struct ProjectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsView().environmentObject(TeamClass())
    }
}
