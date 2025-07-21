//
//  Category.swift
//  Finance
//
//  Created by Дарья Литвинова on 21.07.2025.
//

import Foundation

protocol CategoryProtocol: EntityProtocol {
    var id: UUID { get }
    var name: String { get set }
}

class Category: CategoryProtocol {
    var id: UUID
    
    var name: String
    
    init(name: String) {
        self.id = UUID()
        self.name = name
    }
}
