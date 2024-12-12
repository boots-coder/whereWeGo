
import SwiftUI

//MARK: MODEL VIEW

class HotelType: ObservableObject {
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
