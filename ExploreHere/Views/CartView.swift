
import SwiftUI
struct CartView: View {
    
    @EnvironmentObject var tripType : TripType
    @EnvironmentObject var hotelType: HotelType

    var body: some View {
        VStack(alignment: .leading) {
            Text("Cart")
                .font(.largeTitle).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            ScrollView {
                
                // 显示活动列表
                if tripType.activities.count > 0 {
                    ForEach(tripType.activities, id: \.id) { activity in
                        ItemRows(activity: activity)
                    }
                } else {
                    Text("Your activities cart is empty!")
                        .padding()
                }
                
                // 显示酒店列表
                if hotelType.hotelComponent.count > 0 {
                    ForEach(hotelType.hotelComponent, id: \.id) { hotel in
                        HStack {
                            Image(hotel.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .cornerRadius(20)
                            
                            VStack(alignment: .leading) {
                                Text(hotel.name)
                                    .bold()
                                Text("$\(hotel.price)")
                            }
                            Spacer()
                            Image(systemName: "trash")
                                .foregroundColor(Color(hue:1.0, saturation:0.89, brightness:0.835))
                                .onTapGesture {
                                    hotelType.removeHotel(item: hotel)
                                }
                                .padding()
                        }
                        .padding(.horizontal)
                    }
                } else {
                    Text("No hotels booked yet!")
                        .padding()
                }

                // 显示总价
                Text("Total price for activities: $\(tripType.total)")
                
                let hotelTotal = hotelType.hotelComponent.reduce(0) { $0 + $1.price }
                Text("Total price for hotels: $\(hotelTotal)")
                
                PaymentButtonView(action: {})
                    .padding()
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(TripType())
            .environmentObject(HotelType())
    }
}
