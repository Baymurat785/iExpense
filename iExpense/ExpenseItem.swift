//
//  Expense.swift
//  iExpense
//
//  Created by Baymurat Abdumuratov on 09/04/24.
//

import Foundation
import SwiftData

@Model
class ExpenseItem { // Added Codable protocol for encoding and decoding
    
    var name: String
    var type: String
    var amount: Double
    var currency: String
    
    init(name: String, type: String, amount: Double, currency: String) {
        self.name = name
        self.type = type
        self.amount = amount
        self.currency = currency
    }
    
    // MARK: - Decodable Protocol
//    
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.name = try container.decode(String.self, forKey: .name)
//        self.type = try container.decode(String.self, forKey: .type)
//        self.amount = try container.decode(Double.self, forKey: .amount)
//        self.currency = try container.decode(String.self, forKey: .currency)
//    }
//    
//    // MARK: - Encodable Protocol
//    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(name, forKey: .name)
//        try container.encode(type, forKey: .type)
//        try container.encode(amount, forKey: .amount)
//        try container.encode(currency, forKey: .currency)
//    }
//    
//    // MARK: - CodingKeys
//    
//    enum CodingKeys: String, CodingKey {
//        case name
//        case type
//        case amount
//        case currency
//    }
}


//class Expenses{
//    var items = [ExpenseItem](){
//        didSet {
//            
//            
//            if let encoded = try? JSONEncoder().encode(items){
//                UserDefaults.standard.set(encoded, forKey: "Items")
//            }
//        }
//    }
//    
//    
//    init(){
//        if let savedItems = UserDefaults.standard.data(forKey: "Items"){
//            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems){
//                items = decodedItems}
//        }
//    }
//    
//    
//}
