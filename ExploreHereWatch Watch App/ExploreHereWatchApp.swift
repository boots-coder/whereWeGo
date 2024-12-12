import SwiftUI

@main
struct MyWatchApp: App {
    @StateObject var type = HotelType()

    @SceneBuilder var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(type)
        }
    }
}
