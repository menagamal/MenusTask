//
//  HomeRouter.swift
//  MenusTask
//
//  Created by Mena Gamal on 1/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import UIKit
import Hero

class HomeRouter: BaseRouter{
    enum Destination {
        case showDetails(meal:MealModel) , None
    }
    var navigationController: UINavigationController?
    // MARK: - Initializer
    
    init() {
        
    }
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
    }
    
    func navigate(to destination: HomeRouter.Destination) {
        let viewController = makeViewController(for: destination)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func root(to destination: HomeRouter.Destination) {
        let viewController = makeViewController(for: destination)
        navigationController?.viewControllers = [viewController]
        UIApplication.shared.keyWindowInConnectedScenes?.rootViewController = navigationController
    }
    
    func present(to destination: HomeRouter.Destination) {
        let viewController = makeViewController(for: destination)
        navigationController?.present(viewController, animated: true) {}
    }
    
    private func detailsViewController(meal:MealModel) -> DetailsViewController {
        let vc: DetailsViewController = DetailsBuilder().build(navigationController: self.navigationController!, meal: meal)
        vc.hero.isEnabled = true
        return vc
    }
    
    func makeViewController(for destination: Destination) -> UIViewController {
        switch destination {
        case .None:
            return UIViewController()
        case .showDetails(let meal):
            return detailsViewController(meal: meal)
        }
    }
    
}
