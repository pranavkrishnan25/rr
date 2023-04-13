import SwiftUI
import CoreLocation

struct UserList: View {
    let users: [User]

    var body: some View {
        VStack {
            VStack {
                ForEach(users) { user in
                    VStack {
                        Text(user.name)
                            .font(.system(size: 24))
                            .bold()
                            .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                            .background(Color.gray.opacity(0.8))
                            .cornerRadius(8)

                        VStack {
                            HStack {
                                Text(user.status)
                                    .font(.system(size: 18))
                                
                                Text("— NO DETECTION")

                            
                            }
                        }
                        .padding(5)
                        .background(Color.black)
                        .cornerRadius(8)
                    }
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    .foregroundColor(.white)
                    .font(.system(size: 18))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                }
            }
            .padding(.all, 8)
            .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.5)))
            .padding(.all, 8)
        }
    }
}

struct UserList_Previews: PreviewProvider {
    static var previews: some View {
        UserList(users: [
            User(name: "Stacy", coordinate: CLLocationCoordinate2D(latitude: 35.9132, longitude: -79.0558), status: "Going Out"),
            User(name: "Jose", coordinate: CLLocationCoordinate2D(latitude: 35.9049, longitude: -79.0469), status: "At Home"),
            User(name: "Priya", coordinate: CLLocationCoordinate2D(latitude: 35.9110, longitude: -79.0516), status: "Unavailable"),
            User(name: "John", coordinate: CLLocationCoordinate2D(latitude: 35.8997, longitude: -79.0123), status: "Going Out")
        ])
    }
}
