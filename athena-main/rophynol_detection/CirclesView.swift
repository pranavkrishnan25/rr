//import SwiftUI
//
//struct CirclesView: View {
//    var body: some View {
//        NavigationView {
//            ZStack {
//                VStack {
//                    Spacer()
//
//                    NavigationLink(destination: MapView()) {
//                        CircleButton(title: "Roomates", color: Color.gray.opacity(0.55), filledStar: true)
//                    }
//
//                    CircleButton(title: "Family", color: Color.gray.opacity(0.55), filledStar: false)
//
//                    CircleButton(title: "Dawgs", color: Color.gray.opacity(0.55), filledStar: false)
//
//                    Spacer()
//                }
//
//                VStack {
//                    Spacer()
//
//                    NavigationLink(destination: Text("Create a new Family Circle")) {
//                        Text("+ Create a new Family Circle")
//                            .padding()
//                            .frame(maxWidth: .infinity)
//                            .background(Color.gray.opacity(0.55))
//                            .foregroundColor(.white)
//                            .font(.system(size: 20))
//                            .cornerRadius(10)
//                            .padding(.horizontal)
//                            .padding(.bottom, 16)
//                    }
//                }
//            }
//            .background(Color.black)
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbar {
//                ToolbarItem(placement: .principal) {
//                    VStack(spacing: 10) {
//                        Text("Circles")
//                            .font(.system( size: 50))
//                            .fontWeight(.bold)
//                            .foregroundColor(.white)
//                    }
//                    .padding(.top, 50)
//                }
//            }
//        }
//    }
//}
//
//struct CircleButton: View {
//    let title: String
//    let color: Color
//    let filledStar: Bool
//
//    var body: some View {
//        HStack {
//            Image(systemName: filledStar ? "star.fill" : "star")
//                .foregroundColor(.white)
//                .padding(.leading)
//
//            Text(title)
//                .padding()
//                .frame(maxWidth: .infinity)
//                .background(color)
//                .foregroundColor(.white)
//                .font(.system(size: 18))
//                .cornerRadius(10)
//                .padding(.horizontal)
//                .padding(.vertical, 5)
//        }
//    }
//}
//
//struct CirclesView_Previews: PreviewProvider {
//    static var previews: some View {
//        CirclesView()
//    }
//}


import SwiftUI

struct CirclesView: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Spacer()
                    
                    NavigationLink(destination: MapView()) {
                        CircleButton(title: "Roommates", color: Color.gray.opacity(0.55), filledStar: true)
                    }
                    
                    CircleButton(title: "Family", color: Color.gray.opacity(0.55), filledStar: false)
                    
                    CircleButton(title: "Dawgs", color: Color.gray.opacity(0.55), filledStar: false)
                    
                    Spacer()
                }
                
                VStack {
                    Spacer()
                    
                    NavigationLink(destination: ContactsView()) {
                        Text("+ Create a new Family Circle")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.55))
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .padding(.bottom, 16)
                    }
                }
            }
            .background(Color.black)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack(spacing: 10) {
                        Text("Circles")
                            .font(.system( size: 50))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .padding(.top, 50)
                }
            }
        }
    }
}

struct CircleButton: View {
    let title: String
    let color: Color
    let filledStar: Bool

    var body: some View {
        HStack {
            Image(systemName: filledStar ? "star.fill" : "star")
                .foregroundColor(.white)
                .padding(.leading)

            Text(title)
                .padding()
                .frame(maxWidth: .infinity)
                .background(color)
                .foregroundColor(.white)
                .font(.system(size: 18))
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.vertical, 5)
        }
    }
}
struct CirclesView_Previews: PreviewProvider {
    static var previews: some View {
        CirclesView()
    }
}
