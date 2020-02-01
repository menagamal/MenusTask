//
//  DetailsPresenter.swift
//  MenusTask
//
//  Created by Mena Gamal on 2/1/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

protocol DetailsPresenterDelegate {
    func getMealDetails()
}

class DetailsPresenter: DetailsPresenterDelegate {
    
    private var interactor:DetailsInteractor?
    private var router:DetailsRouter?
    
    //MARK: TO AVOID RETAIN CYCLE
    private weak var view:DetailsView?
    
    
    
    init(interactor:DetailsInteractor,router:DetailsRouter,view:DetailsView) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    
    func getMealDetails() {
        if let meal = interactor?.getMealDetails() {
            self.view?.labelId.text = "#\(meal.id!)"
            self.view?.labelName.text = meal.name
            self.view?.labelDesc.text = meal.description
            self.view?.mealImageView.setImageWithUrl(url: meal.photoUrl!)
        } else {
            self.view?.showError(errorStr: DetailsError.FoundNil.localizedDescription)
        }
    }
    
    
    
}
