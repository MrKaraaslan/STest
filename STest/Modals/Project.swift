//
//  Project.swift
//  STest
//
//  Created by Mehmet Karaaslan on 17.06.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

class ProjectClass: ObservableObject {
    
    @Published var isOk: Bool = false
    @Published var newName: String = "" {
        didSet {
            if !self.createdList.isEmpty {
                for project in self.createdList {
                    if project.projectName == self.newName {
                        isOk  = false
                        break;
                    }
                    else {
                        isOk = true
                    }
                }
            }
            else {
                isOk = true
            }
        }
    }
    
    var allProjects: [Project] = []
    @Published var createdList: [Project] = []
    @Published var memberList: [Project] = []
    
    func getTeams() {
        //:firebase
        allProjects = projects
    }
}

struct Project { //: save project under team folder if there is a team or save it under personal folder created with user id (maybe?)
    
    var id = UUID().uuidString
    var projectName: String
    
    var additionalInfos: [String]
    var trackNumber: Bool
    
    var steps: [Int:String] //stepNumber : mission
}

let projects:[Project] = []
