//
//  SignUpView.swift
//  STest
//
//  Created by Mehmet Karaaslan on 6.04.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    
    @Binding var current: Int
    
    @State var name = ""
    @State var email = ""
    @State var password = ""
    @State var passwordCheck = ""
    
    var body: some View {
        VStack {
            VStack {
                VStack(spacing: 16) {
                    MyTextField(placeHolder: "Kullanıcı Adı", imageName: "person.circle", value: $name)
                    MyTextField(placeHolder: "Email", imageName: "envelope", value: $email)
                    MySecureField(placeHolder: "Şifre", imageName: "lock", value: $password)
                    MySecureField(placeHolder: "Şifre Tekrar", imageName: "lock", value: $passwordCheck)
                }
                
                Button(action: {
                    //: firebase and go back
                    withAnimation(){
                        self.current = 1
                    }
                    
                }) {
                    Text("Kayıt Ol")
                }
                .MyButton()
                .padding(.top, 32)
            }.frame(maxHeight: .infinity)
            
            VStack {
                Button(action: {
                    //: navigate
                    withAnimation(){
                        self.current = 1
                    }
                }) {
                    Text("Giriş Yap")
                        .foregroundColor(.mainColor)
                }
            }
            
            
        }
        .padding([.leading, .trailing], 32)
        .navigationBarTitle("Kayıt Ol", displayMode: .inline)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(current: .constant(2))
    }
}
