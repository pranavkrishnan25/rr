//
//  TutorialView.swift
//  rophynol_detection
//
//  Created by Neil Auroni on 4/12/23.
//

import SwiftUI

struct TutorialView: View {
    var body: some View {
        ZStack {
                    Color.black.edgesIgnoringSafeArea(.all)
                    Text("Help Me")
                        .foregroundColor(.white)
                }
    }
    
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
