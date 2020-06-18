//
//  RegisterMotherView.swift
//  STest
//
//  Created by Mehmet Karaaslan on 7.04.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct RegisterMotherView: View {
    
    @State var currentPage = 1
    
    var body: some View {
        VStack {
            if currentPage == 1 {
                SignInView(currentPage: $currentPage)
                    .transition(.scale)
            }else if currentPage == 2 {
                SignUpView(currentPage: $currentPage)
                    .transition(.scale)
            }else if currentPage == 3 {
                ForgotPasswordView(currentPage: $currentPage)
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
