//
//  CategoryManager.swift
//  Finance
//
//  Created by Дарья Литвинова on 21.07.2025.
//

import Foundation

class CategoryManager {
    static let shared = CategoryManager()
    
    private init() {}
    
    private var storage: [Category] = []
}
