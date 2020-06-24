//
//  AppTabView.swift
//  STest
//
//  Created by Mehmet Karaaslan on 12.05.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct AppTabView: View {
    
    var body: some View {
        TabView {
            
            blankPage1()
                .tabItem {
                    Image(systemName: "x.circle")
                    Text("test-1")
            }
            
            blankPage2()
                .tabItem {
                    Image(systemName: "x.circle.fill")
                    Text("test-2")
            }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("profile")
            }
        }
    }
}

struct AppMotherView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
