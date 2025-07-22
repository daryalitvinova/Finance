//
//  CreateViewController.swift
//  Finance
//
//  Created by Дарья Литвинова on 22.07.2025.
//

import UIKit

class CreateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black

        let createView = ViewBuilder.shared.buildCreateView()
        view.addSubview(createView)
        
        NSLayoutConstraint.activate([
            createView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            createView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            createView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
