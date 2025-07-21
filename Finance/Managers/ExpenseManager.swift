//
//  TransactionManager.swift
//  Finance
//
//  Created by Дарья Литвинова on 21.07.2025.
//

import Foundation

class ExpenseManager {
    static let shared = ExpenseManager()
    
    private init() {}
    
    private var storage: [Expense] = []
    
    func createExpense(expense: Expense) {
        storage.append(expense)
    }
    
    func updateExpense(expense: Expense) -> UUID? {
        if let index = storage.firstIndex(where: { $0.id == expense.id })  {
            storage[index].amount = expense.amount
            storage[index].date = expense.date
            storage[index].category = expense.category
            storage[index].note = expense.note
            return storage[index].id
        } else {
            return nil
        }
    }
    
    func deleteExpense(id: UUID) -> UUID? {
        if let index = storage.firstIndex(where: { $0.id == id}) {
            storage.remove(at: index)
            return id
        } else {
            return nil
        }
    }
    
    func getById(id: UUID) -> Expense? {
        if let expense = storage.first(where: { $0.id == id}) {
            return expense
        } else {
            return nil
        }
    }
    
    func getAll() -> [Expense] {
        return storage
    }
}
