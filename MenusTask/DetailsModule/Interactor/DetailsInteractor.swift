//
//  DetailsInteractor.swift
//  MenusTask
//
//  Created by Mena Gamal on 2/1/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

protocol DetailsUseCase {
    
    func getMealDetails() -> MealModel?
}

class DetailsInteractor: DetailsUseCase {
    
    var meal:MealModel?
    
    init(meal:MealModel) {
        self.meal = meal
    }
    
    func getMealDetails() -> MealModel? {
        guard let meal = self.meal else {
            return nil
        }
        return meal
    }
    
}
