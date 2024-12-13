import Foundation
import SwiftUI

//MARK: MODEL
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

// The following coordinates are reasonable approximations of the general locations of hotels in Hong Kong and are not precise. Adjust them as needed.
var hotel1 = Hotels(
    name: "Mandarin Oriental Hong Kong",
    description: "A luxury five-star hotel in Central with exceptional service and stunning views of Victoria Harbour.",
    image: "Tokyo 1",
    suitRoom: "Yes",
    price: 300,
    nearbyAttractions: ["Lan Kwai Fong", "The Peak Tram", "Hong Kong Observation Wheel"],
    latitude: 22.2816,   // Mandarin Oriental Hong Kong is in Central
    longitude: 114.1579
)

var hotel2 = Hotels(
    name: "The Peninsula Hong Kong",
    description: "Located in Tsim Sha Tsui, blending history with modern luxury, known as the 'Grande Dame of the Far East.'",
    image: "Tokyo 2",
    suitRoom: "Yes",
    price: 280,
    nearbyAttractions: ["Avenue of Stars", "Victoria Harbour Night View", "Hong Kong Museum of Art"],
    latitude: 22.2950,   // The Peninsula Hong Kong is in Tsim Sha Tsui
    longitude: 114.1711
)

var hotel3 = Hotels(
    name: "The Ritz-Carlton Hong Kong",
    description: "Located on the upper floors of the International Commerce Centre, offering panoramic views of Hong Kong.",
    image: "Tokyo 3",
    suitRoom: "Yes",
    price: 350,
    nearbyAttractions: ["Sky100 Observation Deck", "West Kowloon Cultural District", "Elements Mall"],
    latitude: 22.3033,  // The Ritz-Carlton is in ICC (West Kowloon)
    longitude: 114.1602
)

var hotel4 = Hotels(
    name: "Conrad Hong Kong",
    description: "Situated in Admiralty, offering convenience for both business and leisure travelers.",
    image: "Tokyo 4",
    suitRoom: "Yes",
    price: 220,
    nearbyAttractions: ["Hong Kong Park", "Pacific Place", "Central–Mid-Levels Escalator"],
    latitude: 22.2771,  // Conrad Hong Kong is in Admiralty
    longitude: 114.1652
)

var hotel5 = Hotels(
    name: "Four Seasons Hotel Hong Kong",
    description: "Located next to the International Finance Centre in Central, renowned for its Michelin-starred dining.",
    image: "Tokyo 5",
    suitRoom: "Yes",
    price: 320,
    nearbyAttractions: ["Central Pier", "IFC Mall", "Exchange Square"],
    latitude: 22.2866,  // Four Seasons Hotel is near IFC in Central
    longitude: 114.1589
)

var hotel6 = Hotels(
    name: "W Hong Kong",
    description: "Located in West Kowloon, offering a modern and youthful design.",
    image: "Tokyo 6",
    suitRoom: "Yes",
    price: 200,
    nearbyAttractions: ["Elements Mall", "West Kowloon High-Speed Rail Station", "West Kowloon Art Park"],
    latitude: 22.3161,  // W Hong Kong is in West Kowloon
    longitude: 114.1609
)

var hotelList: [Hotels] = [hotel1, hotel2, hotel3, hotel4, hotel5, hotel6]
