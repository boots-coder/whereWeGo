

import WatchConnectivity

class WatchSessionManager: NSObject, WCSessionDelegate, ObservableObject {
    static let shared = WatchSessionManager()
    private let session = WCSession.default
    
    override private init() {
        super.init()
        if WCSession.isSupported() {
            session.delegate = self
            session.activate()
        }
    }

    func sendHotelToiPhone(hotel: Hotels) {
        if session.isReachable {
            let hotelData: [String: Any] = [
                "action": "addHotel",
                "name": hotel.name,
                "price": hotel.price,
                "image": hotel.image
                // 可以根据需要再补充其他字段
            ]
            session.sendMessage(hotelData, replyHandler: nil, errorHandler: { error in
                print("Failed to send: \(error)")
            })
        } else {
            // 如果不可达，可以用 transferUserInfo 发送延迟信息
            session.transferUserInfo(["action": "addHotel", "name": hotel.name, "price": hotel.price, "image": hotel.image])
        }
    }
    
    // 实现 WCSessionDelegate 的必要方法
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {}
    #if os(watchOS)
    func sessionReachabilityDidChange(_ session: WCSession) {}
    #endif
}

