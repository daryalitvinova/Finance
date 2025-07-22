//
//  ViewController.swift
//  Finance
//
//  Created by Дарья Литвинова on 20.07.2025.
//

import UIKit

class HistoryViewController: UIViewController {
    
    private lazy var transactions = ExpenseManager.shared.getAll()
    
    private lazy var historyCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.width, height: 60)
        layout.minimumLineSpacing = 5
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(TransactionCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(historyCollection)
        NSLayoutConstraint.activate([
            historyCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            historyCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            historyCollection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            historyCollection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ExpenseManager.shared.createExpense(expense: Expense(date: Date(), amount: 300, category: Category(name: "Продукты")))
        ExpenseManager.shared.createExpense(expense: Expense(date: Date(), amount: 20, category: Category(name: "Транспорт")))
        ExpenseManager.shared.createExpense(expense: Expense(date: Date(), amount: 5000, category: Category(name: "Аптеки")))
    }
}

extension HistoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        transactions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TransactionCell.reuseIdentifier, for: indexPath) as! TransactionCell
        let transaction = transactions[indexPath.item]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        cell.date.text = dateFormatter.string(from: transaction.date)
        cell.category.text = transaction.category.name
    
        let rublesFormatter = NumberFormatter()
        rublesFormatter.numberStyle = .currency
        rublesFormatter.currencyCode = "RUB"
        rublesFormatter.maximumFractionDigits = 2
        rublesFormatter.minimumFractionDigits = 0
        rublesFormatter.locale = Locale(identifier: "RU_ru")
        cell.amount.text = String(rublesFormatter.string(from: NSNumber(value: transaction.amount)) ?? "0")
        return cell
    }
}
