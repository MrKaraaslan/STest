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
    
    @State var additionalList: [AdditionalField] = []
    @State var index = 0
    
    @State var useNumber = false
    @State var useAmount = false
    @State var useDeadline = false
    
    
    
    var body: some View {
        VStack {
            
            VStack {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Projelerim")
                        }.padding(.leading)
                    }
                    
                    Spacer()
                    MyImage(imageName: "questionmark.circle")
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                
                Form {
                    Section(header: Text("Proje Adı")) {
                        MyTextField(placeHolder: "", imageName: "", value: $projectName)
                    }
                    
                    Section {
                        Toggle(isOn: $isTeam) {
                            Text("Takım")
                        }
                        
                        if isTeam {
                            if teamList.createdList.isEmpty {
                                Text("Henüz Takım Oluşturmadınız")
                            }
                            else {
                                Picker(selection: $team, label: team == "" ? Text("Takım Seçiniz"): nil) {
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
                    
                    Section(header: Text("Ek Bilgiler")) {
                        //kişisel bilgiler dışında en başta almak istediği bilgi varsa kullanılacak kısım
                        
                        ForEach(self.additionalList, id: \.id) {field in
                            HStack {
                                field
                                
                                Button(action: {
                                    self.removeField(id: field.id)
                                }) {
                                    MyImage(imageName: "minus.circle", imageColor: .red)
                                }
                            }
                        }
                        
                        Button(action: {
                            self.addField()
                        }) {
                            MyImage(imageName: "plus.circle")
                        }
                    }
                    
                    Section {
                        Toggle(isOn: $useNumber) {
                            Text("Adet")
                        }
                    }
                    
                    Section(header: Text("Adımlar")) {
                        Text("never mind")
                    }
                }
                
                
                
                Button(action: {
                    // save date
                    // check project name again
                    // check team -> if toggle is opened team must be selected
                    
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
    
    func addField() {
        
        let newField = AdditionalField()
        additionalList.append(newField)
    }
    
    func removeField(id: UUID) {
        additionalList.removeAll { (AdditionalField) -> Bool in
            if AdditionalField.id == id {
                return true
            }
            return false
        }
    }
}

struct AdditionalField: View {
    
    var id = UUID()
    @State var text = ""
    var body: some View {
        MyTextField(placeHolder: "", imageName: "", value: $text)
    }
}

struct CreateProjectView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProjectView().environmentObject(TeamClass())
    }
}
