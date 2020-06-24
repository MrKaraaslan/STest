//
//  Project.swift
//  STest
//
//  Created by Mehmet Karaaslan on 17.06.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct Project: Identifiable { //: save project under team folder if there is a team or save it under personal folder created with user id (maybe?)
    
    var id = UUID().uuidString
    var projectName: String
    
    var additionalInfos: [String]?
    var trackNumber: Bool
    
    var steps: [Int:String]? //stepNumber : mission
}

let projects:[Project] = [
    Project(projectName: "Personal sample project", additionalInfos: ["ülke","şehir"], trackNumber: false, steps: [1: "ülkeye git", 2: "şehre git"]),
    Project(projectName: "kumbara", additionalInfos: nil, trackNumber: true, steps: [1: "kumbarayı al", 2: "parayı teslim et"]),
    Project(projectName: "2020 kurban", additionalInfos: ["kesilecek ülke"], trackNumber: true, steps: [1: "ödeme al", 2: "kurbanı kestir"])
]
