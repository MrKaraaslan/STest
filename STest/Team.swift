//
//  Team.swift
//  STest
//
//  Created by Mehmet Karaaslan on 18.04.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

class TeamClass: ObservableObject {
    
    @Published var createdList: [Team] = []
    @Published var memberList: [Team] = []
    
    func lister() {
        //:firebase
        createdList = created
        memberList = member
    }
}


struct Team: Identifiable {
    
    var id = UUID()
    var creator: String
    var teamImage: Image
    var teamName: String
    var teamMembers: Double
    var teamCapacitiy: Double
    
    var teamFullness: Double {return teamMembers/teamCapacitiy}
}

let created = [
    Team(creator: "self", teamImage: Image("img1"), teamName: "c1", teamMembers: 12, teamCapacitiy: 20),
    Team(creator: "self", teamImage: Image("img2"), teamName: "c2", teamMembers: 17, teamCapacitiy: 20),
    Team(creator: "self", teamImage: Image("img3"), teamName: "c3", teamMembers: 1, teamCapacitiy: 20),
    Team(creator: "self", teamImage: Image("img4"), teamName: "c4", teamMembers: 17, teamCapacitiy: 20)
]

let member = [
    Team(creator: "example name", teamImage: Image("img1"), teamName: "example team name1", teamMembers: 12, teamCapacitiy: 20),
    Team(creator: "mehmet karaaslan", teamImage: Image("img2"), teamName: "example team name2", teamMembers: 17, teamCapacitiy: 20),
    Team(creator: "examle mehmet", teamImage: Image("img3"), teamName: "example team name3", teamMembers: 1, teamCapacitiy: 20),
    Team(creator: "v for vendetta", teamImage: Image("img4"), teamName: "example team name4", teamMembers: 17, teamCapacitiy: 20)
]
