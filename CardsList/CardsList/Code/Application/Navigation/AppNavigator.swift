//
//  AppNavigator.swift
//  CardsList
//
//  Created by Sergey Tszyu on 16.06.2023.
//

import Foundation
import UIKit

struct AppNavigator {
    
    static func setupRootViewController(for window: UIWindow?) {
        
        guard let cardsListViewController = UIStoryboard(name: "CardsList", bundle: nil).instantiateInitialViewController() else {
            return
        }
        let navigationController = UINavigationController(rootViewController: cardsListViewController)
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .gray
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            
            navigationController.navigationBar.tintColor = .white
            navigationController.navigationBar.standardAppearance = appearance
            navigationController.navigationBar.compactAppearance = appearance
            navigationController.navigationBar.scrollEdgeAppearance = appearance
        }

        window?.rootViewController  = navigationController
        window?.makeKeyAndVisible()
    }
    
}
