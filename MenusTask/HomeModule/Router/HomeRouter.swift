//
//  HomeRouter.swift
//  MenusTask
//
//  Created by Mena Gamal on 1/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import UIKit

class HomeRouter: BaseRouter{
    enum Destination {
        case None
    }
    var navigationController: UINavigationController?
    // MARK: - Initializer
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController!.navigationBar.prefersLargeTitles = true
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

    func makeViewController(for destination: Destination) -> UIViewController {
        switch destination {
     
        case .None:
            return UIViewController()
        }
    }
    
}
