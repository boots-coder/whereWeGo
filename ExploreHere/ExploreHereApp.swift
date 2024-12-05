

import SwiftUI

@main
struct ExploreHereApp: App {
    @StateObject private var tripType = TripType()    // 修改这里
    @StateObject private var hotelType = HotelType()  // 添加这行

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(tripType)    // 保留
                .environmentObject(hotelType)   // 添加这行
        }
    }
}
