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
        seperator()
    }
    func seperator() {
        createdList = []
        memberList = []
        for project in allProjects {
            if project.creator == "self" { //: change it control users name / == userName...
                createdList.append(project)
            }
            else {
                memberList.append(project)
            }
        }
    }
}

struct Project {
    
    var id = UUID().uuidString
    var creator: String
    var teamId: String
    var projectName: String
    
    var additionalInfos: [String]
    var trackNumber: Bool
    
    var steps: [Int:String] //stepNumber : mission
}

let projects:[Project] = []
