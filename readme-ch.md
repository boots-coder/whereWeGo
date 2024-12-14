# iOS-app-trip-in-HK - how to study and get the new product in 2 weeks 

during 12. 3 - 12.17  = 14 days

> ps：本人有java springboot开发和python的人工智能的基础知识背景; 但是我认为学习新技术的方法应该是一样的 ，本文记录了从0开始到一个产品落地的全过程

## Day 1 确定需求和进行初步调研

> 目前github 主要针对的是iOS 单独的应用， 并没有和iwatch 进行深入的连接；因此该项目进行开发就有了其独特的意义；
>
> 旅游产品：携程等，广告多， 国内软件和应用冗余；希望开发一款比较干净的旅游产品

Some details ：

以 china HK 为例子：

- 以香港旅游为主要研究对象和主题
- 酒店预定-询
- 介绍酒店附近景点
- apple 全设备支持（iOS-ipad-iwatch）
- 预约之后需要有sql 日志输出

一些开源程序的搜索

| 序号 | 项目名称                           | 描述                                                         | GitHub 链接                                                  |
| ---- | ---------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| 1    | **NearMe**                         | 使用 SwiftUI 开发的 iOS 应用，可发现附近的地点，利用 MapKit 和 Core Location 提供交互式地图、搜索、详细地点信息和路线指引等功能。 | [NearMe](https://github.com/lavkushry/Nearme)                |
| 2    | **swiftui-hike-app**               | 基于 SwiftUI 的 iOS 应用，旨在激发用户发现和探索徒步旅行路线，展示了 SwiftUI 在创建精美卡片视图和优雅设置界面方面的能力。 | [swiftui-hike-app](https://github.com/pshivakumar/swiftui-hike-app) |
| 3    | ==**Travel-Booking-App-SwiftUI**== | 电子商务旅行预订应用，用户可预订酒店和活动，使用 SwiftUI 开发，集成了 MapKit 和 Apple Pay。 | [Travel-Booking-App-SwiftUI](https://github.com/williamsouef/Travel-Booking-App-SwiftUI) |
| 4    | **TravelApp-SwiftUI**              | 使用 SwiftUI 构建的旅行应用界面示例，展示了如何使用 SwiftUI 构建现代旅行应用界面。 | [TravelApp-SwiftUI](https://github.com/EnginBolat/TravelApp-SwiftUI) |
| 5    | **swift_travel**                   | 开源的公共交通应用，提供路线搜索、时刻表和 AI 驱动的智能建议等功能。 | [swift_travel](https://github.com/gaetschwartz/swift_travel) |
| 6    | **AwesomeSwift**                   | 汇集了 Swift 开源精选资源的项目，以思维导图形式呈现，包含多个旅行相关的应用示例。 | [AwesomeSwift](https://github.com/xzshedon/awesome-swift)    |
| 7    | **swift-open-project**             | Swift 开源项目分类汇总，其中包含多个旅行应用的示例和资源。   | [swift-open-project](https://github.com/thinkloki/swift-open-project) |
| 8    | **awesome-swift-1**                | 汇集了 Swift 开源精选资源的文档，以思维导图形式呈现，包含旅行应用的示例。 | [awesome-swift-1](https://github.com/WolfSamWell/awesome-swift-1) |
| 9    | **awesome-swiftui**                | 精心策划的优秀 SwiftUI 开源项目列表，其中包含旅行应用的示例。 | [awesome-swiftui](https://github.com/chinsyo/awesome-swiftui) |
| 10   | **OpenSwiftUI**                    | 开源的 SwiftUI 实现项目，可用于构建跨平台的旅行应用。        | [OpenSwiftUI](https://github.com/OpenSwiftUIProject/OpenSwiftUI) |

经过调研，决定在标亮度的产品上做二次开发

## Day 2 ，学习和入门 swift 

### 参考：

swift官网学习导航：

https://developer.apple.com/cn/documentation/swift/?utm_source=chatgpt.com

语法特性：

https://docs.swift.org/swift-book/documentation/the-swift-programming-language/

swiftUI：

https://developer.apple.com/cn/xcode/swiftui/

https://developer.apple.com/tutorials/swiftui/

playGround:

https://designcode.io/swiftui-handbook-visual-editor-in-xcode





## Day3 ，修改项目代码

1. 形成详细的源文件的技术报告

该开源项目“Travel-Booking-App-SwiftUI”是一个用于预订酒店和活动的电子商务旅行应用，采用 Swift 和 SwiftUI 开发，集成了 MapKit 和 Apple Pay 等技术。

**项目文件结构及各文件作用：**

​    •    **ExploreHere.xcodeproj**：Xcode 项目文件，包含项目的配置和元数据。

​    •    **ExploreHere**：主代码目录，包含应用的源代码和资源。

​    •    **.DS_Store**：macOS 系统文件，存储文件夹的显示属性。

​    •    **README.md**：项目的自述文件，提供项目概述、技术栈和功能说明。

**项目包含的 UI：**

​    •    **探索活动界面**：展示可预订的活动列表，用户可以浏览并选择感兴趣的活动。

​    •    **购物车界面**：用户添加的旅行计划和活动会显示在此，支持添加和删除操作。

​    •    **详细视图界面**：提供所选活动或酒店的详细信息，包括描述、位置等。

​    •    **旅行计划视图**：展示用户的旅行行程和相关预订信息。



**使用的技术：**

​    •    **Swift**：主要编程语言。

​    •    **SwiftUI**：用于构建用户界面的声明式框架。

​    •    **MapKit**：用于在应用中嵌入地图功能，显示活动或酒店的位置。

​    •    **Apple Pay**：集成支付功能，方便用户完成预订付款。



**实现的主要功能：**

​    •    **活动和酒店浏览**：用户可以浏览可预订的活动和酒店列表，查看详细信息。

​    •    **添加和管理旅行计划**：用户可以将感兴趣的活动或酒店添加到购物车，管理自己的旅行计划。

​    •    **地图显示**：通过 MapKit 显示活动或酒店的位置，帮助用户直观了解地理信息。

​    •    **支付功能**：集成 Apple Pay，用户可以直接在应用内完成支付，简化预订流程。



该项目采用 MVVM（Model-View-ViewModel）架构，确保代码的可维护性和可扩展性。





## Day 4 转代码到 iwatch 

生成图标：https://www.appicon.co/

### 核心问题： 数据一致性

下面是一个总体思路和示例，帮助你在 watchOS 与 iOS 间共享酒店数据，并在 watchOS 上预订酒店后，将结果同步到 iOS 的购物车中。

如果你需要更多特定信息（比如 WatchConnectivity 的详细实现、数据模型如何保持一致、或是工程文件的组织方式），请告诉我你需要哪些进一步信息，我将为你提供更详细的说明。

------

#### 总体思路

1. **数据一致性**：
   在 watchOS 与 iOS 间共享同一套酒店数据（`Hotels` 结构、`hotelList`数组等），确保 watchOS 和 iOS 使用相同的数据模型文件。在实际项目中，你可以把 `Hotels.swift` 和 `HotelType.swift` 等数据层文件放入一个 Shared 文件夹，并通过 Target Membership 同时勾选 iOS 和 watchOS，这样两端共享同一套代码。

2. **数据同步机制**：
   使用 `WatchConnectivity` 框架来在 iOS 和 watchOS 间传递数据。当用户在 watchOS 的 `DetailView` 中点击注册（预订）按钮时，向 iPhone 发送一条消息包含预订酒店的信息。iPhone 端接收到该信息后，将该酒店加入 `HotelType.hotelComponent`，从而更新 iOS 的购物车界面。

3. **具体步骤**：

   - 在 iOS 和 watchOS 的 Extension 中分别创建 `WCSession` 会话，并设置代理。
   - 当 watchOS 用户点击 "Register" 按钮时，通过 `session.sendMessage` 发送 `["action": "addHotel", "hotelID": ...]` 或直接发送完整的酒店信息字典。
   - iOS 接收到后根据 ID 或信息匹配到对应的酒店对象，调用 `hotelsList.addHotels(newItem:)` 将酒店加入购物车。
   - iOS 上的购物车界面因为数据是 `@Published`，会自动刷新显示新加入的酒店。

   

## Day 5 完善项目和进行成果展示

- [x] 修复数据一致性问题
- [x] 添加图片



下面是本次实现 Apple Watch 与 iOS App 之间数据同步功能的完整工作记录和技术总结，可作为其他开发者的参考与学习资料。

------

### 背景与目标

我们希望在 Apple Watch 上完成酒店预订操作后，将该预订信息实时同步到 iOS 端的购物车界面中。通过实现此功能，用户可以在 Apple Watch 上独立浏览并订购酒店，而 iOS App 则能自动更新购物车数据，呈现最新的订单状态。

### 使用技术与框架

- **WatchConnectivity**：Apple 提供的框架，用于在可配对的 iPhone 与 Apple Watch 之间进行双向通信。
- **SwiftUI**：构建 iOS 与 watchOS App 的 UI 界面，并使用 `@EnvironmentObject` 和 `@Published` 属性实现数据驱动的界面更新。

### 实现步骤

#### 一、项目结构与初始化

1. **同一 Workspace 中的多 Target**：
   确保项目中包含 iOS App 目标和 watchOS Extension/Watch App 目标。这使得 iOS 和 watchOS 项目可以共享数据模型文件（如 `Hotels` 和 `HotelType`），并在后续使用 WatchConnectivity 进行通信。
2. **单独运行测试**：
   在实现数据同步前，先确保 iOS 与 watchOS 应用均能独立运行无误。（这一步建议分开启动，这样有利于进行调试）

#### 二、启动与激活 WatchConnectivity 会话

1. **iOS 端会话初始化**：
   在 iOS App 中（`App`入口点，如 `ExploreHereApp.swift`），初始化 `iOSAppSessionManager` 单例，激活 `WCSession`。

   ```swift
   @main
   struct ExploreHereApp: App {
       init() {
           let _ = iOSAppSessionManager.shared
       }
       var body: some Scene {
           WindowGroup {
               ContentView()
                   .environmentObject(TripType())
                   .environmentObject(HotelType.shared) // 单例注入
           }
       }
   }
   ```

   `iOSAppSessionManager.swift`：

   ```swift
   swift
   
   import WatchConnectivity
   
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
   
       func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
           print("iOS: WCSession activationDidComplete: \(activationState) error: \(String(describing: error))")
       }
   }
   ```

2. **watchOS 端会话初始化**：
   在 watchOS App 的入口点中，同样创建 `WatchSessionManager` 单例初始化会话。

   ```swift
   @main
   struct ExploreHereWatchApp: App {
       init() {
           let _ = WatchSessionManager.shared
       }
       var body: some Scene {
           WindowGroup {
               ContentView()
                   .environmentObject(HotelType.shared)
           }
       }
   }
   ```

   `WatchSessionManager.swift`：

   ```swift
   import WatchConnectivity
   
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
   
       func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
           print("watchOS: WCSession activationDidComplete: \(activationState) error: \(String(describing: error))")
       }
   
       func sessionReachabilityDidChange(_ session: WCSession) {
           print("watchOS: Reachability Changed: \(session.isReachable)")
       }
   }
   ```

通过上述步骤，iOS 和 watchOS 端的会话被激活，当两个设备连接时 `session.isReachable` 会为 `true`，表明可以双向通信。

#### 三、数据模型与单例共享（这一步非常关键）

1. **数据模型定义**：

   ```swift
   struct Hotels: Identifiable {
       var id = UUID()
       var name: String
       var description: String
       var image: String
       var suitRoom: String?
       var price: Int
       var nearbyAttractions: [String]
       var latitude: Double
       var longitude: Double
   }
   
   class HotelType: ObservableObject {
       static let shared = HotelType() // 单例
   
       @Published var hotelComponent: [Hotels] = []
   
       func addHotels(newItem: Hotels) {
           hotelComponent.append(newItem)
           print("HotelType: Added hotel - \(newItem.name)")
       }
   
       func removeHotel(item: Hotels) {
           if let index = hotelComponent.firstIndex(where: { $0.id == item.id }) {
               hotelComponent.remove(at: index)
           }
       }
   }
   ```

   在 iOS 与 watchOS 两端共享同一数据模型文件，以保持数据一致性与便于转换。

2. **环境对象注入**：
   在 iOS 的 `ExploreHereApp` 中使用 `.environmentObject(HotelType.shared)` 以保证全局使用相同的 `HotelType` 实例，使得更新在任意位置发生后，UI 都能感知到变更。

#### 四、从 watchOS 端发送数据到 iOS 端

1. **watchOS 发送数据**：
   当用户在 watchOS 上点击 “Register” 按钮预订酒店时，构建可序列化的字典并通过 `sendMessage` 发送到 iOS：

   ```swift
   extension WatchSessionManager {
       func sendHotelToiPhone(hotel: Hotels) {
           guard session.isReachable else {
               print("watchOS: iPhone不可达，数据未发送")
               return
           }
   
           var hotelData: [String: Any] = [
               "name": hotel.name,
               "description": hotel.description,
               "image": hotel.image,
               "price": hotel.price,
               "nearbyAttractions": hotel.nearbyAttractions,
               "latitude": hotel.latitude,
               "longitude": hotel.longitude
           ]
   
           // 若 suitRoom 存在则添加，否则省略或使用空字符串避免 nil
           if let room = hotel.suitRoom {
               hotelData["suitRoom"] = room
           }
   
           session.sendMessage(["hotel": hotelData], replyHandler: nil, errorHandler: { error in
               print("watchOS: 发送失败 - \(error.localizedDescription)")
           })
       }
   }
   ```

   在 watchOS `DetailView` 的注册按钮中调用：

   ```swift
   
   Button(action: {
       // 可选，本地添加到 watchOS 端的数据模型
       // hotelsList.addHotels(newItem: hotel)
   
       // 发送给 iOS
       WatchSessionManager.shared.sendHotelToiPhone(hotel: hotel)
   }) {
       Text("Register").foregroundColor(.white)
           .padding()
           .background(Color.blue)
           .cornerRadius(15)
   }
   ```

2. **iOS 接收数据并更新模型**：
   在 `iOSAppSessionManager` 中实现 `didReceiveMessage`，解析收到的酒店字典并添加到 `HotelType.shared`：

   ```swift
   
   extension iOSAppSessionManager {
       func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
           print("iOS: didReceiveMessage triggered")
           if let hotelData = message["hotel"] as? [String:Any],
              let h = decodeHotel(from: hotelData) {
               DispatchQueue.main.async {
                   HotelType.shared.addHotels(newItem: h)
               }
           }
       }
   
       private func decodeHotel(from dict: [String:Any]) -> Hotels? {
           guard let name = dict["name"] as? String,
                 let description = dict["description"] as? String,
                 let image = dict["image"] as? String,
                 let price = dict["price"] as? Int,
                 let nearbyAttractions = dict["nearbyAttractions"] as? [String],
                 let latitude = dict["latitude"] as? Double,
                 let longitude = dict["longitude"] as? Double else {
               return nil
           }
           let suitRoom = dict["suitRoom"] as? String
   
           return Hotels(
               name: name,
               description: description,
               image: image,
               suitRoom: suitRoom,
               price: price,
               nearbyAttractions: nearbyAttractions,
               latitude: latitude,
               longitude: longitude
           )
       }
   }
   ```

#### 五、UI自动刷新与故障排查

1. **UI自动刷新**：
   `CartView` 使用 `@EnvironmentObject var hotelType: HotelType`，当 `hotelComponent` 改变时，视图会自动刷新显示最新的酒店订单。

   ```swift
   if hotelType.hotelComponent.count > 0 {
       ForEach(hotelType.hotelComponent, id: \.id) { hotel in
           // 显示已预订的酒店信息
       }
   } else {
       Text("No hotels booked yet!")
           .padding()
   }
   ```

2. **错误与警告处理**：

   - 如果出现 `Payload contains unsupported type` 错误，检查发送的字典中是否有 `nil` 或非 Property List 类型的值。例如：确保可选值处理得当。（细节）
   - 若出现 “Modifying state during view update” 警告，可确保在主线程中异步更新数据，并检查在视图刷新周期外进行数据修改。（不重要）
   - 确保 iOS App 在前台才能收到 `sendMessage` 消息，否则考虑使用 `transferUserInfo` 进行异步数据传输。（没有尝试）

#### 六、最终效果

在完成上述工作后，流程为：

1. 用户在 Apple Watch 的 `DetailView` 中点击 “Register” 按钮。
2. watchOS 通过 `WatchSessionManager` 使用 `sendMessage` 将酒店数据字典发送给 iOS。
3. iOS `iOSAppSessionManager` 的 `didReceiveMessage` 回调触发，解析数据后更新 `HotelType.shared`。
4. 因为 `CartView` 使用了 `hotelType` 的 `@EnvironmentObject`，数据改变会自动触发 UI 刷新，并在购物车中显示新增的酒店订单。

------

### 总结

通过 WatchConnectivity 框架和 SwiftUI 的数据驱动机制，我们成功实现了 Apple Watch 与 iOS App 之间的实时数据同步。当用户在 watchOS 上进行酒店预订时，无需手动刷新或额外交互，iOS 端的购物车界面就能自动展示最新订单信息。这为跨设备的使用体验提供了便利，也为后续拓展更多交互打下了基础。

本次实现的要点包括：

- 使用 `WCSession` 在 iOS 与 watchOS 之间建立通信通道。
- 在 watchOS 上通过 `sendMessage` 发送 Property List 类型的字典数据。
- 在 iOS 上使用 `didReceiveMessage` 回调解析并更新数据模型。
- 使用单例模式与 `@EnvironmentObject` 确保数据共享与 UI 同步。
- 处理可选值与数据类型，确保消息传输过程中不出现不支持的类型。

这样，其他开发者可以参考本记录快速上手，将类似的数据同步功能集成到自己的 watchOS 和 iOS 应用中。



### 补充

1. **iOS 端成功接收到来自 watchOS 的消息**，但 **iOS 端的购物车界面（CartView）没有更新**。

#### 问题分析

1. **实例不一致**：
   - 你的 `CartView` 使用的是通过 `@EnvironmentObject var hotelType: HotelType` 注入的 `hotelType` 实例。
   - 而在 `iOSAppSessionManager` 中，你试图通过 `HotelType.shared` 来更新数据。
   - 如果 `HotelType` 没有定义 `shared` 静态实例，或者 `shared` 实例与 `CartView` 使用的实例不同步，`CartView` 自然无法感知到数据的变化。

#### 解决方案

##### 步骤一：确保 `HotelType` 使用单例模式

为了确保所有地方都在更新同一个 `HotelType` 实例，我们将 `HotelType` 修改为单例模式，并确保在 `ExploreHereApp` 中注入的是这个单例实例。

1. **修改 `HotelType` 类**：

   ```swift
   import Foundation
   import SwiftUI
   
   //MARK: MODEL VIEW
   
   class HotelType: ObservableObject {
       static let shared = HotelType() // 添加这一行，创建单例实例
   
       @Published var hotelComponent: [Hotels] = []
   
       func addHotels(newItem: Hotels) {
           hotelComponent.append(newItem)
       }
   
       // 新增删除方法
       func removeHotel(item: Hotels) {
           if let index = hotelComponent.firstIndex(where: { $0.id == item.id }) {
               hotelComponent.remove(at: index)
           }
       }
   }
   ```

2. **修改 `ExploreHereApp` 以使用 `HotelType.shared`**：

   ```swift
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
   ```

3. **确保 `iOSAppSessionManager` 使用同一个 `HotelType` 实例**：

   ```swift
   import Foundation
   import WatchConnectivity
   
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
   
       func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
           // 会话激活后会调用此处
           print("iOS: WCSession activationDidComplete: \(activationState) error: \(String(describing: error))")
       }
   
       // 移除不可用的方法
       // func sessionDidBecomeInactive(_ session: WCSession) {}
       // func sessionDidDeactivate(_ session: WCSession) {}
   }
   
   extension iOSAppSessionManager {
       func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
           // 当 watchOS 端发来酒店数据时处理
           print("iOS: didReceiveMessage triggered")
           if let hotelData = message["hotel"] as? [String:Any],
              let h = decodeHotel(from: hotelData) {
               DispatchQueue.main.async {
                   HotelType.shared.addHotels(newItem: h)
               }
           }
       }
   
       private func decodeHotel(from dict: [String:Any]) -> Hotels? {
           guard let name = dict["name"] as? String,
                 let description = dict["description"] as? String,
                 let image = dict["image"] as? String,
                 let price = dict["price"] as? Int,
                 let nearbyAttractions = dict["nearbyAttractions"] as? [String],
                 let latitude = dict["latitude"] as? Double,
                 let longitude = dict["longitude"] as? Double else {
               return nil
           }
   
           let suitRoom = dict["suitRoom"] as? String
           return Hotels(
               name: name,
               description: description,
               image: image,
               suitRoom: suitRoom,
               price: price,
               nearbyAttractions: nearbyAttractions,
               latitude: latitude,
               longitude: longitude
           )
       }
   }
   ```

##### 步骤二：确保 `HotelType.shared` 被正确注入

1. **检查 `ContentView`**：

   确保 `ContentView` 使用的是通过 `@EnvironmentObject` 注入的 `HotelType.shared` 实例。

   ```swift
   
   import SwiftUI
   
   struct ContentView: View {
       @EnvironmentObject var tripType : TripType
       @EnvironmentObject var hotelType : HotelType
       @State private var ListScreenIsShowing = false
       @State private var selection = 1
   
       var body: some View {
           VStack{
               TabView(selection:$selection){
   
                   Homescreen()
                       .tabItem {
                           Image(systemName: "house")
                           Text("Home")
                               .fontWeight(.black)
                       }
                       .tag(3)
                   ListScreen(ListScreenisShowing: $ListScreenIsShowing)
                       .tabItem{
                           Image(systemName: "bed.double")
                               .resizable()
                           Text("Hotel")
                       }
                       .tag(0)
                   PlanTripView()
                       //.environmentObject(tripType)
   
                       .tabItem {
                           Image(systemName:"figure.walk")
                               .resizable()
                           Text ("Activities")
                       }
                       .tag(1)
                   CartView()
   
                       .tabItem{ 
                           CartButton(numberOfItems: 0)
                           Text ("Cart")
                       }
                       .badge(hotelType.hotelComponent.count)
               }
               .accentColor(.blue)
           }
       }
   }
   
   struct ContentView_Previews: PreviewProvider {
       static var previews: some View {
           ContentView()
               .environmentObject(TripType())
               .environmentObject(HotelType.shared) // 使用单例实例
       }
   }
   ```

2. **确保 `HotelType.shared` 被正确使用**：

   现在，所有通过 `@EnvironmentObject var hotelType: HotelType` 获取的 `hotelType` 实例都指向 `HotelType.shared`，确保数据一致。

##### 步骤三：修复警告“Modifying state during view update”

这类警告通常是由于在 SwiftUI 视图更新期间修改了 `@Published` 属性。虽然你已经在主线程异步更新数据，但警告仍然存在，可能是由于视图更新与数据更新的时间点冲突。

**解决方法**：

1. **确保数据更新在视图更新之外**：

   你的 `iOSAppSessionManager` 已经通过 `DispatchQueue.main.async` 来异步更新数据，这是正确的。确保没有其他地方在视图更新期间同步修改 `hotelType.hotelComponent`。

2. **避免在视图生命周期方法中直接修改数据**：

   确保你没有在视图的 `body` 或其他同步执行的闭包中直接修改 `hotelType.hotelComponent`。

3. **添加更多调试信息**：

   在 `HotelType.addHotels(newItem:)` 中添加打印语句，确认数据确实被添加。

   ```swift
   class HotelType: ObservableObject {
       static let shared = HotelType()
   
       @Published var hotelComponent: [Hotels] = []
   
       func addHotels(newItem: Hotels) {
           hotelComponent.append(newItem)
           print("HotelType: Added hotel - \(newItem.name)")
       }
   
       func removeHotel(item: Hotels) {
           if let index = hotelComponent.firstIndex(where: { $0.id == item.id }) {
               hotelComponent.remove(at: index)
               print("HotelType: Removed hotel - \(item.name)")
           }
       }
   }
   ```

4. **确认 `CartView` 正在监听 `hotelComponent` 的变化**：

   确保 `CartView` 中的 `hotelType.hotelComponent` 确实被观察，并在变化时刷新视图。

##### 步骤四：验证数据同步

1. **重新编译并运行应用**：

   - **先运行 iOS App**： 在 iOS 模拟器或真机上运行你的 iOS App，并确保它处于前台。
   - **然后运行 watchOS App**： 在 watch 模拟器或真机上运行 watchOS App。
   - **在 watchOS App 中点击“Register”按钮**： 这将发送酒店数据到 iOS App。

2. **观察控制台日志**：

   - iOS 端

     ：

     - 应该看到 `iOS: didReceiveMessage triggered`
     - 应该看到 `HotelType: Added hotel - [酒店名称]`

   - watchOS 端

     ：

     - 应该看到 `watchOS: WCSession activationDidComplete: activated ...`
     - 应该看到 `watchOS: Reachability Changed: true`
     - 不应该再看到 `watchOS: iPhone不可达，数据未发送`

3. **检查 `CartView`**：

   - 确认 `CartView` 中的酒店列表是否已更新，显示了从 watchOS 添加的新酒店。

##### 步骤五：处理“Modifying state during view update”警告

如果警告依然存在，但数据同步功能正常，你可以暂时忽略这个警告。但为了更彻底地解决，可以尝试以下方法：

1. **延迟数据更新**：（这一步没用）

   在 `iOSAppSessionManager` 中，稍微延迟数据的添加，以避免在 SwiftUI 视图更新期间修改数据。

   ```swift
   DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
       HotelType.shared.addHotels(newItem: h)
   }
   ```

2. **检查视图层级**：

   确保没有其他视图在数据更新期间触发状态变化，导致数据被多次修改。

3. **优化数据更新逻辑**：

   确保数据更新仅在必要时进行，避免重复或不必要的修改。

#### 总结

通过以下步骤，你应该能够解决数据同步和警告问题：

1. **确保 `HotelType` 使用单例模式**，并在 `ExploreHereApp` 中注入 `HotelType.shared`。
2. **确保 `iOSAppSessionManager` 使用同一个 `HotelType.shared` 实例** 来更新数据。
3. **确认数据更新在主线程异步执行**，避免在视图更新期间修改数据。
4. **重新运行应用**，确保数据同步功能正常，`CartView` 能够实时显示新增的酒店数据。
5. **处理警告信息**，确保 SwiftUI 视图的稳定性和数据一致性。

### 展示

见github
