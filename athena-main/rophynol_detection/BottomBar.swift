import SwiftUI

struct BottomBar: View {
    var body: some View {
        HStack {
            TabView{
                ContentView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("HOME")
                            .foregroundColor(.white)
                    }
                    .toolbarBackground(Color.white, for: .tabBar)
                SettingsView()
                    .tabItem {
                        Image(systemName: "gear")
                            .foregroundColor(.white)
                        Text("SETTINGS")
                            .foregroundColor(.white)
                    }
                    .toolbarBackground(Color.white, for: .tabBar)
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                            .foregroundColor(.white)
                        Text("PROFILE")
                    }
                    .toolbarBackground(Color.white, for: .tabBar)
                TutorialView()
                    .tabItem {
                        Image(systemName: "questionmark.circle")
                        Text("HOW TO")
                    }
                    .toolbarBackground(Color.white, for: .tabBar)
            }
            .accentColor(.blue)
            
            
        }
    }
}
    
    
    struct BottomBar_Previews: PreviewProvider {
        static var previews: some View {
            BottomBar()
        }
    }
