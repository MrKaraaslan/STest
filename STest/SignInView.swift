//
//  SignIn.swift
//  STest
//
//  Created by Mehmet Karaaslan on 6.04.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct SignInView: View {
    
    @Binding var current: Int
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            VStack {
                
                Image("logo").resizable().scaledToFit().padding(.bottom, 64)
                
                VStack(spacing: 16) {
                    MyTextField(placeHolder: "Email", imageName: "envelope", value: $email)
                    MySecureField(placeHolder: "Şifre", imageName: "lock", value: $password)
                }
                
                Button(action: {
                     //: firebase and navigation
                }) {
                    Text("Giriş yap")
                }
                .myButton()
                .padding(.top, 32)
                
                Text("Şifremi Unuttum")
                    .foregroundColor(.grayColor)
                    .padding(.top, 32)
                    .onTapGesture {
                        withAnimation(){
                            self.current = 3
                        }
                }
                
                
            }.frame(maxHeight: .infinity)
            
            VStack {
                Button(action: {
                    //: navigate
                    withAnimation(){
                        self.current = 2
                    }
                }) {
                    Text("Kayıt Ol")
                        .foregroundColor(.mainColor)
                }
            }
        }
        .padding([.leading, .trailing],32)
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(current: .constant(1))
    }
}
