//
//  listName.swift
//  Setaraaaaa
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 09/04/23.
//

import Foundation

//struct ListName {
//    var name: String
//    var isChecked: Bool
//    var itemNames: [String] = []
//    var itemPrices: [Int] = []
//}

struct ListName: Codable {
    var name: String
    var isChecked: Bool
    var food: [FoodList]
    var total: Int
}

struct FoodList: Codable {
    let itemName: String
    let itemPrice: Int
}



