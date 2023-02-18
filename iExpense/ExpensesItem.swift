//
//  ExpensesItem.swift
//  iExpense
//
//  Created by Nick Pavlov on 2/16/23.
//

import Foundation

struct ExpensesItem: Identifiable, Codable {
    var id = UUID()
    var name: String
    var type: String
    var amount: Double
}
