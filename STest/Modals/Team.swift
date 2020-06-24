//
//  Team.swift
//  STest
//
//  Created by Mehmet Karaaslan on 18.04.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct Team: Identifiable {
    
    var id = UUID().uuidString
    var creator: String
    var teamImage: Image
    var teamName: String
    var teamMembers: Int
    var teamCapacitiy: Int
    
    var teamFullness: Double {return Double(teamMembers)/Double(teamCapacitiy)}
    
    var projectList: [Project] = []
    //: add init if necessary
}

class newTeamClass: ObservableObject {
    
    var teams: [Team] = []
    @Published var isOk: Bool = false
    @Published var name: String = "" {
        didSet {
            if !self.teams.isEmpty {
                for team in self.teams {
                    if team.teamName == self.name {
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
    
    func getTeams(_ teams: [Team]) {
        self.teams = teams
    }
}

let teams = [ // probably will be deleted
    Team(creator: "self", teamImage: Image("img1"), teamName: "c1", teamMembers: 12, teamCapacitiy: 20),
    Team(creator: "self", teamImage: Image("img2"), teamName: "c2", teamMembers: 17, teamCapacitiy: 20),
    Team(creator: "example name", teamImage: Image("img1"), teamName: "example team name1", teamMembers: 12, teamCapacitiy: 20),
    Team(creator: "mehmet karaaslan", teamImage: Image("img2"), teamName: "example team name2", teamMembers: 17, teamCapacitiy: 20),
    Team(creator: "self", teamImage: Image("img3"), teamName: "c3", teamMembers: 1, teamCapacitiy: 20),
    Team(creator: "self", teamImage: Image("img4"), teamName: "c4", teamMembers: 15, teamCapacitiy: 30),
    Team(creator: "examle mehmet", teamImage: Image("img3"), teamName: "example team name3", teamMembers: 1, teamCapacitiy: 20),
    Team(creator: "v for vendetta", teamImage: Image("img4"), teamName: "example team name4", teamMembers: 9, teamCapacitiy: 20)
]

let createdTeams = [
    Team(creator: "Mehmet Karaaslan", teamImage: Image("img1"), teamName: "c1", teamMembers: 12, teamCapacitiy: 20),
    Team(creator: "Mehmet Karaaslan", teamImage: Image("img2"), teamName: "c2", teamMembers: 17, teamCapacitiy: 20),
    Team(creator: "Mehmet Karaaslan", teamImage: Image("img3"), teamName: "c3", teamMembers: 1, teamCapacitiy: 20),
    Team(creator: "Mehmet Karaaslan", teamImage: Image("img4"), teamName: "c4", teamMembers: 15, teamCapacitiy: 30),
]

let memberTeams = [
    Team(creator: "example name", teamImage: Image("img1"), teamName: "example team name1", teamMembers: 12, teamCapacitiy: 20),
    Team(creator: "mehmet karaaslan", teamImage: Image("img2"), teamName: "example team name2", teamMembers: 17, teamCapacitiy: 20),
    Team(creator: "examle mehmet", teamImage: Image("img3"), teamName: "example team name3", teamMembers: 1, teamCapacitiy: 20),
    Team(creator: "v for vendetta", teamImage: Image("img4"), teamName: "example team name4", teamMembers: 9, teamCapacitiy: 20)
]
