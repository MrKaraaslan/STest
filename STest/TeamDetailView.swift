//
//  TeamDetailView.swift
//  STest
//
//  Created by Mehmet Karaaslan on 18.04.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct TeamDetailView: View {
    
    @Binding var teamImage: Image
    @Binding var teamName: String
    
    var body: some View {
        VStack {
            teamImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                //.frame(width: 150, height: 150)
                //.clipShape(Circle())
            
            
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct TeamDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TeamDetailView(teamImage: .constant(Image("img1")), teamName: .constant("team name"))
    }
}
