//
//  ProjectDetailView.swift
//  STest
//
//  Created by Mehmet Karaaslan on 24.06.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct ProjectDetailView: View {
    
    var project: Project
    @State var showDeleteSheet = false
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Proje Adı")) {
                    Text(project.projectName)
                }
                
                if project.additionalInfos != nil {
                    Section(header: Text("Ek Bilgiler")) {
                        ForEach(0 ..< project.additionalInfos!.count) { num in
                            Text(self.project.additionalInfos![num])
                        }
                    }
                }
                
                Section {
                    HStack {
                        Text("Adet")
                        Spacer()
                        if project.trackNumber {
                            MyImage(imageName: "checkmark.circle", imageColor: .green)
                        }
                        else {
                            MyImage(imageName: "x.circle",imageColor: .red)
                        }
                    }
                    
                }
                
                if project.steps != nil {
                    Section(header: Text("Adımlar")) {
                        ForEach(1 ..< project.steps!.count + 1) { num in
                            Text(self.project.steps![num]!)
                        }
                    }
                }
            }
            
            Button(action: {
                self.showDeleteSheet = true
            }) {
                VStack {
                    Text("Projeyi Sil")
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
                        message: Text("Projeyi silmeniz bütün bilgileri siler"),
                        buttons: [
                            .destructive(Text("Projeyi Sil")), //: action
                            .cancel(Text("Vazgeç"))
                        ])
                }
            }.padding([.leading, .trailing, .bottom])
        }
    }
}

struct ProjectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectDetailView(project: projects[0])
    }
}
