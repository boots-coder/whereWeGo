import SwiftUI

@main
struct MyWatchApp: App {
    init() {
            let _ = WatchSessionManager.shared
        }
    @StateObject var type = HotelType()

    @SceneBuilder var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(type)
        }
    }
}
