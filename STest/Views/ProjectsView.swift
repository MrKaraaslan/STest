//
//  ProjectsView.swift
//  STest
//
//  Created by Mehmet Karaaslan on 17.04.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct ProjectsView: View {
    
    @EnvironmentObject var current: UserClass
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Projelerim")) {
                    ForEach(current.pProjects, id: \.id) { project in
                        NavigationLink(destination: ProjectDetailView(project: project)) {
                            Text(project.projectName)
                        }
                    }
                }
            }//on tap navigate to next view to see details
            
            
            VStack {
                NavigationLink(destination: CreateProjectView().environmentObject(current)) {
                    MyNavigationButton(text: Text("Proje Oluştur"))
                }
            }.padding([.leading, .trailing, .bottom])
        }
        .navigationBarTitle("Projelerim")
    }
}

struct ProjectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsView().environmentObject(UserClass())
    }
}
