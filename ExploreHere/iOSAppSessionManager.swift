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

    // 可选实现一些其他代理方法
    func sessionDidBecomeInactive(_ session: WCSession) {}
    func sessionDidDeactivate(_ session: WCSession) {}
}
extension iOSAppSessionManager {
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        // 当 watchOS 端发来酒店数据时处理
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
