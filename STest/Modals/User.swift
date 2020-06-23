//
//  User.swift
//  STest
//
//  Created by Mehmet Karaaslan on 18.06.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

class UserClass: ObservableObject {
    
    @Published var isLoggedIn: Bool
    @Published var user: User
    @Published var cTeams: [Team]
    @Published var mTeams: [Team]
    
    init() {
        self.isLoggedIn = false
        self.user = User()
        self.cTeams = []
        self.mTeams = []
    }
    
    func info() { //: firebase
        // called one time while login
        //test...
        user.id = "testId"
        user.name = "Mehmet Karaaslan"
        user.email = "developerkaraaslan@gmail.com"
        user.image = Image("logo")
        //...test
    }
    
    func teamData() { //: firebase, always listening data function
        // should work all the time
//        user.memberList =
//        user.createdList =
        
        //test...
        cTeams = createdTeams
        mTeams = memberTeams
        //...test
    }
}


struct User {
    
    var id = UUID().uuidString
    var name: String
    var email: String
    var image: Image?
    var createdList: [String] //list of created teams' ids
    var memberList: [String] //list of team id's
    
    init() {
        name = ""
        email = ""
        image = nil
        createdList = []
        memberList = []
    }
}
