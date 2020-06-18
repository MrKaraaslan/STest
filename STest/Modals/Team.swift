//
//  Team.swift
//  STest
//
//  Created by Mehmet Karaaslan on 18.04.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

class TeamClass: ObservableObject {
    
    @Published var isOk: Bool = false
    @Published var newName: String = "" {
        didSet {
            print("check")
            if !self.createdList.isEmpty {
                for team in self.createdList {
                    print("for")
                    if team.teamName == self.newName {
                        print("f")
                        isOk  = false
                        break;
                    }
                    else {
                        print("t")
                        isOk = true
                    }
                }
            }
            else {
                isOk = true
            }
        }
    }
    
    
    var allTeams: [Team] = []
    @Published var createdList: [Team] = []
    @Published var memberList: [Team] = []
    
    func getTeams() {
        //:firebase
        allTeams = teams
        seperator()
    }
    func seperator() {
        createdList = []
        memberList = []
        for team in allTeams {
            if team.creator == "self" { //: change it control users name / == userName...
                createdList.append(team)
            }
            else {
                memberList.append(team)
            }
        }
    }
}


struct Team: Identifiable {
    
    var id = UUID().uuidString
    var creator: String
    var teamImage: Image
    var teamName: String
    var teamMembers: Int
    var teamCapacitiy: Int
    
    var teamFullness: Double {return Double(teamMembers)/Double(teamCapacitiy)}
}

let teams = [
    Team(creator: "self", teamImage: Image("img1"), teamName: "c1", teamMembers: 12, teamCapacitiy: 20),
    Team(creator: "self", teamImage: Image("img2"), teamName: "c2", teamMembers: 17, teamCapacitiy: 20),
    Team(creator: "example name", teamImage: Image("img1"), teamName: "example team name1", teamMembers: 12, teamCapacitiy: 20),
    Team(creator: "mehmet karaaslan", teamImage: Image("img2"), teamName: "example team name2", teamMembers: 17, teamCapacitiy: 20),
    Team(creator: "self", teamImage: Image("img3"), teamName: "c3", teamMembers: 1, teamCapacitiy: 20),
    Team(creator: "self", teamImage: Image("img4"), teamName: "c4", teamMembers: 15, teamCapacitiy: 30),
    Team(creator: "examle mehmet", teamImage: Image("img3"), teamName: "example team name3", teamMembers: 1, teamCapacitiy: 20),
    Team(creator: "v for vendetta", teamImage: Image("img4"), teamName: "example team name4", teamMembers: 9, teamCapacitiy: 20)
]
