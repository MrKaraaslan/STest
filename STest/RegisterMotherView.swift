//
//  RegisterMotherView.swift
//  STest
//
//  Created by Mehmet Karaaslan on 7.04.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct RegisterMotherView: View {
    
    @State var current = 1
    
    var body: some View {
        VStack {
            if current == 1 {
                SignInView(current: $current)
                    .transition(.scale)
            }else if current == 2 {
                SignUpView(current: $current)
                    .transition(.scale)
            }else if current == 3 {
                ForgotPasswordView(current: $current)
                    .transition(.scale)
            }
        }
    }
}

struct RegisterMotherView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterMotherView()
    }
}
