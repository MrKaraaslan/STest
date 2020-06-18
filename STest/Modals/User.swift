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
    
    init() {
        self.isLoggedIn = false
        self.user = User()
    }
}


struct User {
    
    var id = UUID().uuidString
    var name: String
    var email: String
    var memberList: [String] //list of team id's
    
    init() {
        name = ""
        email = ""
        memberList = []
    }
}
