//
//  ForgotPasswordView.swift
//  STest
//
//  Created by Mehmet Karaaslan on 7.04.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @Binding var currentPage: Int
    
    @State var email = ""
    
    var body: some View {
        VStack {
            VStack(spacing: 32) {
                MyTextField(placeHolder: "Email", imageName: "envelope", value: $email)
                Button(action: {
                    //: firebase and go back
                    withAnimation(){
                        self.currentPage = 1
                    }
                }) {
                    Text("Şifremi Sıfırla").myButton()
                }
            }.frame(maxHeight: .infinity)
            
            VStack {
                Button(action: {
                    //: navigate
                    withAnimation(){
                        self.currentPage = 1
                    }
                }) {
                    Text("Giriş Yap")
                        .foregroundColor(.mainColor)
                }
            }
            
        }.padding([.leading, .trailing], 32)
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView(currentPage: .constant(3))
    }
}
