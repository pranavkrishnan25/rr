//
//  SettingsView.swift
//  rophynol_detection
//
//  Created by Neil Auroni on 4/12/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
                    Color.black.edgesIgnoringSafeArea(.all)
                    Text("Settings")
                        .foregroundColor(.white) 
                }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
