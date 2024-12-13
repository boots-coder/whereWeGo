import SwiftUI

@main
struct ExploreHereApp: App {
    @StateObject private var tripType = TripType()
    // 移除 @StateObject private var hotelType = HotelType()

    init() {
        let _ = iOSAppSessionManager.shared // 确保 iOS 端的会话管理器被初始化
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(tripType)
                .environmentObject(HotelType.shared) // 使用单例实例
        }
    }
}
