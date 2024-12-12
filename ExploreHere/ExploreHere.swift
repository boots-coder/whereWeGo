

import SwiftUI

@main
struct ExploreHereApp: App {
    @StateObject private var tripType = TripType()
    @StateObject private var hotelType = HotelType()  // 添加
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(tripType)
                .environmentObject(hotelType) // 在这里注入同一个hotelType实例
        }
    }
}
