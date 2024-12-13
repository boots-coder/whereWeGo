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

    // MARK: - WCSessionDelegate Methods

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        // 会话激活后会调用此处
        print("iOS: WCSession activationDidComplete: \(activationState) error: \(String(describing: error))")
    }

    // 必须实现的方法，即使不需要处理
    func sessionDidBecomeInactive(_ session: WCSession) {
        // 当会话变为非活动状态时调用
        print("iOS: WCSession did become inactive")
    }

    func sessionDidDeactivate(_ session: WCSession) {
        // 当会话被停用时调用
        print("iOS: WCSession did deactivate")
        // 通常在这里重新激活会话
        session.activate()
    }

    // 如果需要处理其他代理方法，可以在扩展中继续实现
}

extension iOSAppSessionManager {
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        // 当 watchOS 端发来消息时处理
        print("iOS: didReceiveMessage triggered")
        if let hotelData = message["hotel"] as? [String: Any],
           let h = decodeHotel(from: hotelData) {
            DispatchQueue.main.async {
                HotelType.shared.addHotels(newItem: h)
            }
        }
    }

    private func decodeHotel(from dict: [String: Any]) -> Hotels? {
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
