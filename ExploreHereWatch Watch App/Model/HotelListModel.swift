import Foundation
import SwiftUI

//MARK: MODEL
struct Hotels : Identifiable {
    var id = UUID()
    var name : String
    var description: String
    var image : String
    var suitRoom : String?
    var price : Int
    var nearbyAttractions: [String]
    var latitude: Double
    var longitude: Double
}

// 以下坐标为参考香港各酒店大致位置的合理猜测值，并非精确真实坐标。
// 你可根据实际需要进一步调整。
var hotel1 = Hotels(
    name: "香港文华东方酒店",
    description: "位于中环的豪华五星级酒店，拥有一流的服务和维多利亚港的迷人景观。",
    image: "Tokyo 1",
    suitRoom: "Yes",
    price: 300,
    nearbyAttractions: ["兰桂坊", "太平山顶缆车", "香港摩天轮"],
    latitude: 22.2816,   // 文华东方香港位于中环
    longitude: 114.1579
)

var hotel2 = Hotels(
    name: "香港半岛酒店",
    description: "坐落于尖沙咀，融合历史与现代奢华享受，被誉为远东贵妇。",
    image: "Tokyo 2",
    suitRoom: "Yes",
    price: 280,
    nearbyAttractions: ["星光大道", "维多利亚港夜景", "香港艺术馆"],
    latitude: 22.2950,   // 半岛酒店位于尖沙咀
    longitude: 114.1711
)

var hotel3 = Hotels(
    name: "香港丽思卡尔顿酒店",
    description: "位于环球贸易广场高层，可俯瞰全港景色。",
    image: "Tokyo 3",
    suitRoom: "Yes",
    price: 350,
    nearbyAttractions: ["天际100观景台", "西九文化区", "圆方商场"],
    latitude: 22.3033,  // 丽思卡尔顿位于ICC（西九龙）
    longitude: 114.1602
)

var hotel4 = Hotels(
    name: "香港港丽酒店",
    description: "坐落金钟，为商务与休闲旅客提供便利。",
    image: "Tokyo 4",
    suitRoom: "Yes",
    price: 220,
    nearbyAttractions: ["香港公园", "太古广场", "中环至半山自动扶梯"],
    latitude: 22.2771,  // 港丽酒店位于金钟
    longitude: 114.1652
)

var hotel5 = Hotels(
    name: "香港四季酒店",
    description: "位于中环国际金融中心旁，以米其林餐厅闻名。",
    image: "Tokyo 5",
    suitRoom: "Yes",
    price: 320,
    nearbyAttractions: ["中环码头", "IFC商场", "交易广场"],
    latitude: 22.2866,  // 四季酒店靠近IFC中环
    longitude: 114.1589
)

var hotel6 = Hotels(
    name: "香港W酒店",
    description: "座落于西九龙，设计风格现代年轻。",
    image: "Tokyo 6",
    suitRoom: "Yes",
    price: 200,
    nearbyAttractions: ["Elements圆方商场", "西九龙高铁站", "西九艺术公园"],
    latitude: 22.3161,  // W酒店位于西九龙
    longitude: 114.1609
)

var hotelList : [Hotels] = [hotel1, hotel2, hotel3, hotel4, hotel5, hotel6]
