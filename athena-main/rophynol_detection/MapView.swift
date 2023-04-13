import SwiftUI
import MapKit

struct MapView: View {
    @State var showingSheet = false
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.9132, longitude: -79.0558), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    @State private var offsetY: CGFloat = 0

    let users: [User] = [
        User(name: "Stacy", coordinate: CLLocationCoordinate2D(latitude: 35.9132, longitude: -79.0558), status: "Going Out"),
        User(name: "Jose", coordinate: CLLocationCoordinate2D(latitude: 35.9049, longitude: -79.0469), status: "At Home"),
        User(name: "Priya", coordinate: CLLocationCoordinate2D(latitude: 35.9110, longitude: -79.0516), status: "Unavailable"),
        User(name: "John", coordinate: CLLocationCoordinate2D(latitude: 35.8997, longitude: -79.0123), status: "Going Out")
    ]

    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, annotationItems: users) { user in
                MapAnnotation(coordinate: user.coordinate) {
                    VStack {
                        Text(user.name)
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding(2)
                            .background(Color.black.opacity(0.7))
                            .cornerRadius(5)

                        Circle()
                            .fill(Color.blue)
                            .frame(width: 20, height: 20)
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)

            VStack {
                Text("ATHENA")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.top, 5)
                Spacer()
            }
            
           
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Map")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
            }
        }
    }
}

struct User: Identifiable, Equatable, Hashable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let status: String

    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}




//            VStack {
//                Spacer()
//                HStack {
//                    Spacer()
//                    Image(systemName: "chevron.up")
//                        .resizable()
//                        .frame(width: 24, height: 14)
//                        .foregroundColor(.gray)
//                        .padding(.bottom, 4)
//                    Spacer()
//                }
//                .frame(maxWidth: .infinity)
//                .background(Color.gray.opacity(0.5))
//                .cornerRadius(10)
//                .offset(y: offsetY)
//                .gesture(
//                    DragGesture(minimumDistance: 10)
//                        .onChanged { value in
//                            offsetY = max(0, value.translation.height)
//                        }
//                        .onEnded { value in
//                            if value.translation.height > 200 {
//                                offsetY = UIScreen.main.bounds.height * 0.6
//                            } else {
//                                offsetY = 0
//                            }
//                        }
//                )
//
//            }
//            .cornerRadius(10)
//            .offset(y: offsetY)
//            .animation(.spring(), value: offsetY)
//            .edgesIgnoringSafeArea(.bottom)
//            .padding(.bottom, -30)
