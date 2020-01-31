//
//  HomeBuilder.swift
//  MenusTask
//
//  Created by Mena Gamal on 1/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import UIKit

class HomeBuilder {
    func build(navigator:UINavigationController) -> HomeViewController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
        let interactor = HomeInteractor()
        let router = HomeRouter(navigationController: navigator)
        vc.presenter = HomePresenter(interactor: interactor, router: router, view: vc)
        return vc
    }
}
