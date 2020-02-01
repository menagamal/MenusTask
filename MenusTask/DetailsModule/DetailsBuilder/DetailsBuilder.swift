//
//  DetailsBuilder.swift
//  MenusTask
//
//  Created by Mena Gamal on 2/1/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

import Foundation
import UIKit

class DetailsBuilder {
    func build(navigationController: UINavigationController,meal:MealModel) -> DetailsViewController {
        let vc:DetailsViewController = UIViewController.instanceXib()
        let interactor = DetailsInteractor(meal: meal)
        let router = DetailsRouter(navigationController: navigationController)
        vc.presenter = DetailsPresenter(interactor: interactor, router: router, view: vc)
        return vc
    }
}
