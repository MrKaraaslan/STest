//
//  Project.swift
//  STest
//
//  Created by Mehmet Karaaslan on 17.06.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

class ProjectClass {
    // holds list of projects
}

struct Project {
    
    var id = UUID()
    var creator: String
    var teamName: String
    var projectName: String
    
    var additionalInfos: [String]
    var trackNumber: Bool
    
    var numberOfSteps: Int
}
