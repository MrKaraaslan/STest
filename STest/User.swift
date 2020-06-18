//
//  User.swift
//  STest
//
//  Created by Mehmet Karaaslan on 18.06.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct User {
    
    var id = UUID().uuidString
    var name: String
    var email: String
    var memberList: [String] //list of team id's
}
