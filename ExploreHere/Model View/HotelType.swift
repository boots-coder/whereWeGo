//
//  HotelType.swift
//  ExploreHere
//
//  Created by William Souef on 25/09/2022.
//

import SwiftUI

//MARK: MODEL VIEW

class HotelType: ObservableObject {
    @Published var hotelComponent: [Hotels] = []

    func addHotels(newItem: Hotels) {
        hotelComponent.append(newItem)
    }
}
