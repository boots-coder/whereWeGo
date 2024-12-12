

import SwiftUI
import MapKit

@available(iOS 16.0, *)
struct DetailExperienceView: View {
//TODO: delete the booking section and increase the map
    var activity : Activities

    @EnvironmentObject var tripType : TripType
    @State var mapRegion : MKCoordinateRegion
    
    init(activity:Activities){
        self.activity = activity
        self._mapRegion = State(
            initialValue: MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                latitude: activity.latitude,
                longitude: activity.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)))
    }
    
    @available(iOS 16.0, *)
    var body: some View {

        VStack {
            VStack(alignment: .center, spacing:10){

                HStack(alignment: .top){
                Image(activity.image)
                        .resizable()
                        .frame(width: 400,height: 250)
                        .cornerRadius(15)
                }
                Text(activity.name)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundStyle(.primary)

                if #available(iOS 16.0, *) {
                    Text(activity.description)
                        .font(.headline)
                        .foregroundStyle(.secondary)
                        .tracking(-1)
                        .multilineTextAlignment(.leading)
                        .padding()
                } else {
                    // Fallback on earlier versions
                };if #available(iOS 16.0, *) {
                    Text(activity.description)
                        .font(.headline)
                        .foregroundStyle(.secondary)
                        .tracking(-1)
                        .multilineTextAlignment(.leading)
                        .padding()
                } else {
                    // Fallback on earlier versions
                }
                
                Map(coordinateRegion:$mapRegion)
                    .cornerRadius(30)
//                HStack(alignment: .top){
//                    Spacer()
//                    Button(action: {
//                        tripType.addActivities(newItem: activity)
//                    })
//                    {
//                        RoundedRectangle(cornerRadius: 30)
//                            .fill(Color.blue)
//                            .frame(width: 160, height: 60)
//
//                            .font(.title)
//                            .overlay(HStack{
//
//                                Text("Add to Cart")
//                                    .fontWeight(.black)
//                                    .foregroundColor(Color.white
//                                    )
//                                
//                            }).padding()
//                    }
//                    Spacer()
//                }
            }
            .ignoresSafeArea()
            .padding()
        }.edgesIgnoringSafeArea(.top)
    }
}


struct DetailExperienceView_Previews: PreviewProvider {
    static let tripTide = TripType()
    static var previews: some View {
        if #available(iOS 16.0, *) {
            DetailExperienceView(activity: activities[0])
                .environmentObject(tripTide)
        } else {
            // Fallback on earlier versions
        }
    }
}
