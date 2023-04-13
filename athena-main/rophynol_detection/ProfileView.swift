//
//  ProfileView.swift
//  rophynol_detection
//
//  Created by Neil Auroni on 4/12/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
                    Color.black.edgesIgnoringSafeArea(.all)
                    Text("Profile")
                        .foregroundColor(.white)
                }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
