import Foundation
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
    func sendHotelToiPhone(hotel: Hotels) {
        guard session.isReachable else {
            // 如果 session 不可达，可以使用 transferUserInfo
            // 但为简单起见，此处先尝试发送 message，如果不可达可后续考虑 transferUserInfo。
            print("watchOS: iPhone不可达，数据未发送")
            return
        }

        let hotelData: [String: Any] = [
            "name": hotel.name,
            "description": hotel.description,
            "image": hotel.image,
            "price": hotel.price,
            "nearbyAttractions": hotel.nearbyAttractions,
            "latitude": hotel.latitude,
            "longitude": hotel.longitude,
            "suitRoom": hotel.suitRoom as Any
        ]

        session.sendMessage(["hotel": hotelData], replyHandler: nil, errorHandler: { error in
            print("watchOS: 发送失败 - \(error.localizedDescription)")
        })
    }

    // 不要在 watchOS 中实现 sessionDidBecomeInactive 和 sessionDidDeactivate
    // func sessionDidBecomeInactive(_ session: WCSession) {}
    // func sessionDidDeactivate(_ session: WCSession) {}
}
