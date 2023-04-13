import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        NavigationView {
                VStack(spacing: 20) {
                    Spacer()
                    HStack {
                        Spacer()
                        Text("ATHENA")
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                    Spacer()
                    
                    VStack(spacing: 20) {
                        NavigationLink(destination: CirclesView()) {
                            Text("Circles")
                                .fontWeight(.bold)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.gray.opacity(0.55))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                        Text("Current Readings")
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.55))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        
                        Text("View Recent History")
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.55))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        
                        Text("Configuration")
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.55))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    
                    RoundedRectangleMapView()
                        .frame(height: 200)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .padding(.bottom)
                    
                    Spacer()
                    
                    
                }
                .background(Color.black)
                .navigationBarHidden(true)
            }
            
        }
        
    }
    

struct RoundedRectangleMapView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.9132, longitude: -79.0558), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

    let users: [MapViewUser] = [
        MapViewUser(name: "Stacy", coordinate: CLLocationCoordinate2D(latitude: 35.9132, longitude: -79.0558)),
        MapViewUser(name: "Priya", coordinate: CLLocationCoordinate2D(latitude: 35.9110, longitude: -79.0516)),
    ]

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.55), lineWidth: 1)
                )

            Map(coordinateRegion: $region, interactionModes: [], showsUserLocation: false, annotationItems: users) { user in
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
                            .frame(width: 10, height: 10)
                    }
                }
            }
        }
    }
}

struct MapViewUser: Identifiable, Equatable, Hashable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D

    static func == (lhs: MapViewUser, rhs: MapViewUser) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
