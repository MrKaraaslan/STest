//
//  ContentView.swift
//  STest
//
//  Created by Mehmet Karaaslan on 6.04.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var current: UserClass
    
    var body: some View {
        VStack {
            if current.isLoggedIn {
                AppTabView()
            }
            else {
                RegisterMotherView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserClass())
    }
}
