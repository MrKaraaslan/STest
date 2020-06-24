//
//  CreateProjectView.swift
//  STest
//
//  Created by Mehmet Karaaslan on 17.04.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct CreateProjectView: View {
    
    @EnvironmentObject var current: UserClass
    
    @State var projectName = ""
    @State var isTeam = false
    @State var teamId = ""
    
    @State var additionalList: [AdditionalField] = []
    @State var steps: [Step] = []
    
    @State var useNumber = false
    
    
    
    var body: some View {
        VStack {
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
                            if current.cTeams.isEmpty {
                                Text("Henüz Takım Oluşturmadınız")
                            }
                            else {
                                Picker(selection: $teamId, label: teamId == "" ? Text("Takım Seçiniz"): nil) {
                                    ForEach(current.cTeams, id: \.id) { team in
                                        HStack {
                                            team.teamImage
                                                .renderingMode(Image.TemplateRenderingMode.original)
                                                .resizable()
                                                .frame(width: 55, height: 55)
                                                .clipShape(Circle())
                                            
                                            Text(team.teamName)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                        }
                                        .tag(team.id)
                                    }
                                }
                            }
                        }
                    }
                    
                    Section(header: Text("Ek Bilgiler")) {
                        //kişisel bilgiler dışında en başta almak istediği bilgi varsa kullanılacak kısım
                        
                        ForEach(self.additionalList, id: \.id) {field in
                            HStack {
                                field
                                
                                MyImage(imageName: "minus.circle", imageColor: .red)
                                    .onTapGesture {
                                        self.removeField(id: field.id)
                                }
                            }
                        }
                        
                        MyImage(imageName: "plus.circle")
                            .onTapGesture {
                                self.addField()
                        }
                    }
                    
                    Section {
                        Toggle(isOn: $useNumber) {
                            Text("Adet")
                        }
                    }
                    
                    Section(header: Text("Adımlar")) {
                        ForEach(self.steps, id: \.id) {step in
                            HStack {
                                step
                                
                                MyImage(imageName: "minus.circle", imageColor: .red)
                                    .onTapGesture {
                                        self.removeStep(id: step.id)
                                }
                            }
                        }
                        
                        MyImage(imageName: "plus.circle")
                            .onTapGesture {
                                self.addStep()
                        }
                    }
                }
                
                
                
                Button(action: {
                    // save date
                    // check project name again
                    // check team -> if toggle is opened team must be selected
                    
                }) {
                    Text("Proje Oluştur").myButton()
                }
                .padding([.leading, .trailing, .bottom])
            }
            //.frame(maxHeight: .infinity) not needed if form is used
            
            
            
        }
        .navigationBarTitle(Text("Proje Oluştur"))
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
    
    func addStep() {
        
        let newStep = Step()
        steps.append(newStep)
    }
    
    func removeStep(id: UUID) {
        steps.removeAll { (Step) -> Bool in
            if Step.id == id {
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

struct Step: View {
    
    var id = UUID()
    @State var mission = ""
    var body: some View {
        MyTextField(placeHolder: "Görev", imageName: "", value: $mission)
    }
}

struct CreateProjectView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProjectView().environmentObject(UserClass())
    }
}
