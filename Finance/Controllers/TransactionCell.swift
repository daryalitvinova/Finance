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
}
