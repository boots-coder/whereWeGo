//
//  WatchConnectivity.swift
//  ExploreHere
//
//  Created by bootscoder on 12/12/24.
//

import WatchConnectivity

class iOSWatchSessionManager: NSObject, WCSessionDelegate {
    static let shared = iOSWatchSessionManager()
    let session = WCSession.default
    
    private override init() {
        super.init()
        if WCSession.isSupported() {
            session.delegate = self
            session.activate()
        }
    }

    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        // 处理从 watch 接收到的消息
        if message["action"] as? String == "addHotel",
           let name = message["name"] as? String,
           let price = message["price"] as? Int,
           let image = message["image"] as? String {
            
            // 尝试匹配酒店
            if let matchedHotel = hotelList.first(where: { $0.name == name }) {
                DispatchQueue.main.async {
                    // 假设你在 iOS 的某个位置有共享的 HotelType 实例
                    let hotelsList = /* 你的 HotelType 实例引用，比如在 App 中用 .environmentObject 注入 */
                    hotelsList.addHotels(newItem: matchedHotel)
                }
            } else {
                // 如果找不到匹配的酒店，你也可以使用发送过来的数据创建一个临时的 Hotel 对象再加入
                let newHotel = Hotels(name: name, description: "From Watch", image: image, suitRoom: nil, price: price, nearbyAttractions: [], latitude: 0, longitude: 0)
                DispatchQueue.main.async {
                    let hotelsList = /* 你的 HotelType 实例 */
                    hotelsList.addHotels(newItem: newHotel)
                }
            }
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {}
}
