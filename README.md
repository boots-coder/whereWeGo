# iOS + watchOS Tourism App Development Documentation
## main-pageList
<p align="center">
   <img src="https://github.com/boots-coder/whereWeGo/blob/main/pic-list/bootscoder_2024-12-14_05-51-39.png" alt="bootscoder_2024-12-14_05-51-39" width="300px">
  <img src="https://github.com/boots-coder/whereWeGo/blob/main/pic-list/bootscoder_2024-12-20_02-32-37.png" alt="bootscoder_2024-12-14_05-40-52" width="300px">

  <img src="https://github.com/boots-coder/whereWeGo/blob/main/pic-list/bootscoder_2024-12-14_05-40-52.png" alt="bootscoder_2024-12-14_05-40-52" width="300px">
  <img src="https://github.com/boots-coder/whereWeGo/blob/main/pic-list/bootscoder_2024-12-14_05-40-59.png" alt="bootscoder_2024-12-14_05-40-59" width="300px">
  <img src="https://github.com/boots-coder/whereWeGo/blob/main/pic-list/bootscoder_2024-12-14_05-41-16.png" alt="bootscoder_2024-12-14_05-41-16" width="300px">
  <img src="https://github.com/boots-coder/whereWeGo/blob/main/pic-list/bootscoder_2024-12-14_05-41-23.png" alt="bootscoder_2024-12-14_05-41-23" width="300px">
    <img src="https://github.com/boots-coder/whereWeGo/blob/main/pic-list/bootscoder_2024-12-14_05-41-36.png" alt="bootscoder_2024-12-14_05-41-36" width="300px">
    <img src="https://github.com/boots-coder/whereWeGo/blob/main/pic-list/bootscoder_2024-12-14_05-41-29.png" alt="bootscoder_2024-12-14_05-41-29" width="300px">
 
</p>

**Project Goal:**
Create a clean, user-friendly tourism booking app that supports iOS, iPadOS, and watchOS. The prototype focuses on Hong Kong as a destination and integrates hotel booking and nearby attractions, while ensuring data consistency and synchronization across devices (iPhone and Apple Watch).

**Project Duration:** 14 days (12/3 - 12/17)

## Background & Motivation

Existing tourism products (e.g., many domestic travel apps) may contain excessive ads and redundant features. The goal is to develop a cleaner, more streamlined travel booking experience. Additionally, integrating iOS and Apple Watch adds convenience for users to view, book, and track their trips on multiple devices.

**Key Features:**

- Target destination: Hong Kong tourism.
- Hotel booking and nearby attraction suggestions.
- Support across Apple ecosystem: iOS, iPad, Apple Watch.
- After booking, record logs in a SQL database (for potential future integration).
- Ultimately, build a minimal, clean, and efficient travel application.

## Day 1: Requirements & Initial Research

**Tasks:**

1. **Identify Core Requirements**:
   - Browse hotels and attractions.
   - Allow booking of hotels.
   - Display nearby points of interest.
   - Sync bookings and data across iOS and Apple Watch.
   - Potential Apple Pay integration for a smoother payment experience.
2. **Initial Codebase Selection & Open-Source Resources**:
   We researched existing SwiftUI-based open-source travel apps as a starting point. One promising codebase is **“Travel-Booking-App-SwiftUI”**, which already includes hotel browsing, MapKit integration, and Apple Pay support. This can serve as a strong foundation.

**Some Useful Open-Source Repositories Studied:**

- **Travel-Booking-App-SwiftUI**: E-commerce-like travel booking with hotel and activities booking, SwiftUI, MapKit, Apple Pay.
- **NearMe**: SwiftUI + MapKit app for discovering nearby places.
- **swiftui-hike-app**: SwiftUI-based hiking route discovery application.
- Other curated lists from “awesome-swift” and “awesome-swiftui” repositories.

## Day 2: Learning & Getting Started With Swift and SwiftUI

Before modifying the selected codebase, a quick refresher and learning session on Swift, SwiftUI, and Apple frameworks:

**References:**

- **Swift Language**: [Swift Official Docs](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/)
- **SwiftUI Tutorials**: [Apple SwiftUI Tutorials](https://developer.apple.com/tutorials/swiftui/)
- **Xcode Playground**: Explore SwiftUI features interactively.

**Key Takeaways:**

- SwiftUI’s declarative UI simplifies building interfaces that respond to data changes.
- Swift’s property wrappers like `@StateObject`, `@Published`, and `@EnvironmentObject` help maintain and share state across views.
- Understanding MVVM architecture for cleaner code maintenance.

## Day 3: Analyzing and Modifying the Selected Codebase

**Chosen Base Project:**
**Travel-Booking-App-SwiftUI**

**Features Identified:**

- Hotel & activity browsing.
- Shopping cart-like booking mechanism.
- MapKit integration for showing locations.
- Apple Pay for quick payments.
- MVVM architecture for maintainable code.

**Planned Modifications:**

1. Integrate Apple Watch support.
2. Ensure data consistency across iOS and watchOS.
3. Add Hong Kong-specific hotels and attractions data.
4. Streamline UI/UX and remove unnecessary components.
5. Prepare logging system for booking operations (SQL integration planned).

## Day 4: Extending the Codebase to Apple Watch

**Goal:** Enable browsing and booking hotels on Apple Watch, and sync those bookings back to the iOS app’s shopping cart.

**Key Steps:**

1. **Shared Data Models:**
   Place shared data models (e.g., `Hotels`, `HotelType`) in a “Shared” folder. Enable Target Membership for both iOS and watchOS targets so both apps share identical data definitions.
2. **Data Synchronization with WatchConnectivity:**
   - Use `WCSession` to communicate between watchOS and iOS.
   - When a hotel is booked on watchOS, send its data to iOS via `sendMessage`.
   - On iOS, upon receiving the data, update `HotelType.shared` so the shopping cart view refreshes automatically.
3. **Maintaining Data Consistency:**
   By relying on a single source of truth (`HotelType.shared`), data changes on iOS propagate to all views. Similarly, watchOS initiates changes via messages, and iOS updates the single data store.

**Icon Generation:**
Use a tool like [appicon.co](https://www.appicon.co/) to generate app icons and ensure a professional look on all platforms.

## Technical Implementation Details

**WatchConnectivity Setup:**

- **iOS Side (`iOSAppSessionManager`)**:

  ```swift
  
   
  class iOSAppSessionManager: NSObject, WCSessionDelegate {
      static let shared = iOSAppSessionManager()
      let session = WCSession.default
  
      override init() {
          super.init()
          if WCSession.isSupported() {
              session.delegate = self
              session.activate()
          }
      }
  
      func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
          // Parse hotel data and update HotelType.shared
      }
  }
  ```

- **watchOS Side (`WatchSessionManager`)**:

  ```swift
   
  class WatchSessionManager: NSObject, WCSessionDelegate, ObservableObject {
      static let shared = WatchSessionManager()
      let session = WCSession.default
  
      override init() {
          super.init()
          if WCSession.isSupported() {
              session.delegate = self
              session.activate()
          }
      }
  
      func sendHotelToiPhone(hotel: Hotels) {
          // Send hotel data dictionary via session.sendMessage(...)
      }
  }
  ```

**HotelType Singleton:**

```swift

class HotelType: ObservableObject {
    static let shared = HotelType()
    @Published var hotelComponent: [Hotels] = []

    func addHotels(newItem: Hotels) {
        hotelComponent.append(newItem)
    }
}
```

By injecting `HotelType.shared` into the `ContentView` environment, both iOS and watchOS UIs update automatically when `hotelComponent` changes.

## Day 5: Finalizing the Integration & Demonstration

**Completed Tasks:**

-  Data consistency between iOS and watchOS.
-  A working example of sending a booked hotel from Apple Watch to iOS.
-  UI updates in the iOS CartView upon receiving new bookings.
-  Cleaned up code, documented steps, and prepared final demonstration.

### Process Summary

1. **Initialized Project & Researched**: Chose a strong base (Travel-Booking-App-SwiftUI).
2. **Learned Swift & SwiftUI Basics**: Ensured understanding of the language and framework.
3. **Analyzed and Modified the Codebase**: Integrated watchOS target, shared data models, applied MVVM architecture.
4. **Implemented Data Synchronization**: Used WatchConnectivity for seamless cross-device updates.
5. **Refined & Documented**: Cleaned code, added icons, tested communication, and prepared final docs.

### Demonstration & Testing

- **iOS Simulation**: Run app in iOS Simulator.
- **watchOS Simulation**: Run the watch app in Watch Simulator, ensure both are paired and connected.
- **Book a Hotel on Apple Watch**:
  Tapping "Register" on the watch sends hotel info to iOS. iOS receives the data and updates the cart instantly.
- **UI Refresh**: iOS cart view automatically shows new bookings from watchOS without manual refresh.

## Common Issues & Solutions

- **Data Not Syncing?**
  Check that `WCSession` is activated and `session.isReachable` is true.
- **No UI Update on iOS?**
  Ensure `HotelType.shared` is injected into the environment and that the UI uses `@EnvironmentObject var hotelType: HotelType`.
- **"Modifying state during view update" Warning**:
  Use `DispatchQueue.main.async` for updates. If warnings persist, ensure data updates happen outside the immediate view-render cycle or slightly delay updates.

## Future Extensions

- **SQL Logging**: Implement a database to log bookings. When `hotelComponent` updates, add a database write operation.
- **Additional Payment Integrations**: Expand Apple Pay features and add more robust payment handling.
- **More Destinations & Enhanced UI**: Introduce multiple city support, richer maps, and more interactive views.

## Conclusion

This documentation outlines the entire development process—from initial idea and open-source code selection to integrating watchOS and ensuring data synchronization. By following these steps and best practices, you have a framework for building a coherent, multi-device travel booking app with clean architecture and a streamlined user experience.

------

**References:**

- [Swift Official Documentation](https://developer.apple.com/documentation/swift/)
- [SwiftUI Tutorials by Apple](https://developer.apple.com/tutorials/swiftui/)
- [WatchConnectivity Framework Docs](https://developer.apple.com/documentation/watchconnectivity/)
