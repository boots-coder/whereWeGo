// DetailView_watchOS.swift
import SwiftUI

struct DetailView: View {
    var hotel: Hotels
    @EnvironmentObject var hotelsList: HotelType
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 10) {
                // 酒店图片（由于watch屏幕较小，可适当缩小尺寸）
                Image(hotel.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                // 酒店名称
                Text(hotel.name)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .padding(.top, 5)
                
                // 酒店描述
                Text(hotel.description)
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 5)
                
                // 附近景点
                if !hotel.nearbyAttractions.isEmpty {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Nearby")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        
                        ForEach(hotel.nearbyAttractions, id: \.self) { attraction in
                            HStack {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.blue)
                                    .font(.caption)
                                Text(attraction)
                                    .font(.caption)
                            }
                        }
                    }
                    .padding(.top, 5)
                }
                
                // 注册按钮
                Button(action: {
//                    hotelsList.addHotels(newItem: hotel)
                    WatchSessionManager.shared.sendHotelToiPhone(hotel: hotel)
                }) {
                    Text("Register")
                        .fontWeight(.heavy)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 15)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(15)
                }
                .padding(.top, 10)
            }
            .padding()
        }
    }
}
