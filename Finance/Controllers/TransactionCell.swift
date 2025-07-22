//
//  TransactionCell.swift
//  Finance
//
//  Created by Дарья Литвинова on 21.07.2025.
//

import UIKit

final class TransactionCell: UICollectionViewCell {
    static let reuseIdentifier = "Cell"
    
    lazy var date: UILabel = {
        let date = UILabel()
        date.font = .systemFont(ofSize: 14, weight: .regular)
        date.textAlignment = .left
        date.textColor = .mainText
        date.translatesAutoresizingMaskIntoConstraints = false
        
        return date
    }()
    
    lazy var amount: UILabel = {
        let amount = UILabel()
        amount.font = .systemFont(ofSize: 16, weight: .bold)
        amount.textAlignment = .right
        amount.textColor = .expenseSum
        amount.translatesAutoresizingMaskIntoConstraints = false
        
        return amount
    }()
    
    lazy var category: UILabel = {
        let category = UILabel()
        category.font = .systemFont(ofSize: 14, weight: .light)
        category.textAlignment = .left
        category.textColor = .mainText
        category.translatesAutoresizingMaskIntoConstraints = false
        
        return category
    }()
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let hStack: UIStackView = {
            let vStack = UIStackView(arrangedSubviews: [date, category])
            vStack.translatesAutoresizingMaskIntoConstraints = false
            vStack.axis = .vertical
            vStack.distribution = .equalSpacing
            vStack.spacing = 4
            vStack.alignment = .leading
            let stack = UIStackView(arrangedSubviews: [vStack, amount])
            
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.axis = .horizontal
            stack.distribution = .equalSpacing
            stack.spacing = 8
            stack.alignment = .center
            return stack
        }()
        
        contentView.addSubview(hStack)
        
        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            hStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            hStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            hStack.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
            hStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ])
    }
}
