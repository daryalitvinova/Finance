//
//  TabBarController.swift
//  Finance
//
//  Created by Дарья Литвинова on 22.07.2025.
//

import UIKit

class TabBarController: UITabBarController {
    let historyVC = HistoryViewController()
    let createVC = CreateViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        historyVC.tabBarItem = UITabBarItem(
            title: "История",
            image: UIImage(systemName: "book.pages"),
            selectedImage: UIImage(systemName: "book.pages.fill"))

        createVC.tabBarItem = UITabBarItem(
            title: "Добавить",
            image: UIImage(systemName: "plus.app"),
            selectedImage: UIImage(systemName: "plus.app.fill"))
        
        viewControllers = [historyVC, createVC]
        
        tabBar.backgroundColor = .black
        
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .systemBlue
        
        UITabBar.appearance().unselectedItemTintColor = .tabBarItem
        UITabBar.appearance().tintColor = .tabBarItem
    }
}
