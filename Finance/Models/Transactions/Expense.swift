//
//  File.swift
//  Finance
//
//  Created by Дарья Литвинова on 20.07.2025.
//

import Foundation

class Expense: TransactionProtocol {
    var id: UUID = UUID()
    var date: Date
    var amount: Double
    var note: String?
    var category: CategoryProtocol
    
    init(date: Date, amount: Double, category: CategoryProtocol, note: String? = nil) {
        self.date = date
        self.amount = amount
        self.note = note
        self.category = category
    }
}
