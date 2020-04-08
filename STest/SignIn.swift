//
//  SignIn.swift
//  STest
//
//  Created by Mehmet Karaaslan on 6.04.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct SignInView: View {
    
    @State var barHidden = true
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    
                    Image("logo").resizable().scaledToFit().padding(.bottom, 64)
                    
                    MyTextField(placeHolder: "Email", imageName: "envelope", value: $email)
                    MySecureField(placeHolder: "Şifre", imageName: "lock", value: $password)
                    
                    Button(action: {
                         //: firebase and navigation
                    }) {
                        Text("Giriş yap")
                    }
                    .MyButton()
                    .padding(.top, 32)
                    
                    Text("Şifremi Unuttum").foregroundColor(.grayColor).padding(.top, 32)
                    
                    
                }.frame(maxHeight: .infinity)
                Text("Kayıt Ol").foregroundColor(.mainColor)
            }
            .padding([.leading, .trailing], 16)
            .navigationBarTitle("")
            .navigationBarHidden(barHidden)
        }
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
