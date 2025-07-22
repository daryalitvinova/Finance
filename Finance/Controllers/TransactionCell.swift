//
//  TransactionCell.swift
//  Finance
//
//  Created by Дарья Литвинова on 21.07.2025.
//

import UIKit

final class TransactionCell: UICollectionViewCell {
    static let reuseIdentifier = "Cell"
    
    var date = UILabel()
    var amount = UILabel()
    var category = UILabel()
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        date.font = .systemFont(ofSize: 14, weight: .regular)
        date.textAlignment = .left
        date.textColor = .white
        date.backgroundColor = .clear
        date.translatesAutoresizingMaskIntoConstraints = false
        
        category.font = .systemFont(ofSize: 14, weight: .light)
        category.textAlignment = .left
        category.textColor = .white
        category.backgroundColor = .clear
        category.translatesAutoresizingMaskIntoConstraints = false
        
        amount.font = .systemFont(ofSize: 16, weight: .bold)
        amount.textAlignment = .right
        amount.textColor = .orange
        amount.backgroundColor = .clear
        amount.translatesAutoresizingMaskIntoConstraints = false
        
        let hStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [date, category, amount])
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
            hStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            hStack.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: 20),
            hStack.trailingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: contentView.trailingAnchor, multiplier: -20),
            ])
    }
}
