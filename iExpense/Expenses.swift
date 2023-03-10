//
//  Expenses.swift
//  iExpense
//
//  Created by Nick Pavlov on 2/16/23.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpensesItem]() {
        
        // Archiving data to UserDefaults
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    // Unarchiving data from UserDefaults
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpensesItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}
