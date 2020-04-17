//
//  ProjectsView.swift
//  STest
//
//  Created by Mehmet Karaaslan on 17.04.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct ProjectsView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Text("back")
        }
    }
}

struct ProjectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsView()
    }
}
