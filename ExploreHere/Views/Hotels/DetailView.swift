// DetailView.swift
// ExploreHere

import SwiftUI
import MapKit

struct DetailView: View {
    var hotel : Hotels
    @EnvironmentObject var hotelsList : HotelType
    
    @State private var region: MKCoordinateRegion

    init(hotel: Hotels) {
        self.hotel = hotel
        _region = State(initialValue: MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: hotel.latitude, longitude: hotel.longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        ))
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                
                // 酒店图片
                Image(hotel.image)
                    .resizable()
                    .frame(width: 350, height: 350)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                // 地图视图
                Map(coordinateRegion: $region, annotationItems: [hotel]) { place in
                    MapMarker(coordinate: CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude), tint: .red)
                }
                .frame(height: 200)
                .padding(.horizontal)
                
                Text(hotel.name)
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.top, 10)
                
                Text(hotel.description)
                    .tracking(-1)
                    .multilineTextAlignment(.leading)
                    .padding([.leading, .trailing], 10)
                
                if !hotel.nearbyAttractions.isEmpty {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("附近景点")
                            .font(.headline)
                            .padding(.bottom, 5)
                        
                        ForEach(hotel.nearbyAttractions, id: \.self) { attraction in
                            HStack {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.blue)
                                Text(attraction)
                                    .font(.body)
                            }
                        }
                    }
                    .padding([.leading, .trailing], 20)
                    .padding(.top, 10)
                }
                
                Button(action: {
                    withAnimation {
                        hotelsList.addHotels(newItem: hotel)
                        print("INSERT INTO bookings (hotel_name, price) VALUES ('\(hotel.name)', \(hotel.price));")
                    }
                }) {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.blue)
                        .frame(width: 120, height: 60)
                        .overlay(
                            Text("Register")
                                .fontWeight(.heavy)
                                .foregroundColor(Color.white)
                        )
                }
                .padding(.top, 20)
                
            }
            .padding()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(hotel: hotelList[0])
    }
}
