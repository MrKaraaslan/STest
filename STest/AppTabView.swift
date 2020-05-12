//
//  AppTabView.swift
//  STest
//
//  Created by Mehmet Karaaslan on 12.05.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct AppTabView: View {
    
    var teamList = TeamClass()
    
    var body: some View {
        TabView {
            
            ProfileView().environmentObject(teamList)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("profile")
            }
            RegisterMotherView()
                .tabItem {
                    Image(systemName: "lock")
                    Text("example")
            }
        }
    }
}

struct AppMotherView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
