//
//  TransactionProtocol.swift
//  Finance
//
//  Created by Дарья Литвинова on 20.07.2025.
//

import Foundation

protocol TransactionProtocol: EntityProtocol {
    var date: Date { get set }
    var amount: Double { get set }
    var note: String? { get set }
    var category: CategoryProtocol { get set }
}
