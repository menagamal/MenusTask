//
//  HomePresenter.swift
//  MenusTask
//
//  Created by Mena Gamal on 1/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

protocol HomePresenterDelegate {
    func getAllTags()
    func getAllMeals(tag:TagModel)
    func showMealDetails(meal:MealModel)
    func loadCachedData()
}

class HomePresenter: HomePresenterDelegate {
    
    private var cachedObj:ArrayOfCachedModule!
    private var interactor:HomeInteractor?
    private var router:HomeRouter?
    
    //MARK: TO AVOID RETAIN CYCLE
    private weak var view:HomeView?
    
    //MARK: Cached Items
    var isLoadingCachedItems = false
    var cachedTags = [TagModel]()
    var cachedMealsDict = [String:[MealModel]]()
    
    
    private var pageCounter = 0
    
    init(interactor:HomeInteractor,router:HomeRouter,view:HomeView) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    
    func getAllMeals(tag:TagModel)  {
        if isLoadingCachedItems {
            self.view?.didLoadAllMeals(meals: cachedMealsDict[tag.tagName!]! )
        } else {
            interactor?.getAllMeals(tag: tag, completation: { (response) in
                
                if let error = response.0 {
                    self.view?.showError(errorStr: error.localizedDescription)
                } else {
                    let meals = response.1
                    self.view?.didLoadAllMeals(meals: meals)
                }
            })
        }
        
    }
    
    func getAllTags() {
        if !isLoadingCachedItems {
            interactor?.getAllTags(index: pageCounter, completation: { (response) in
                
                if let error = response.0 {
                    self.view?.showError(errorStr: error.localizedDescription)
                } else {
                    let tags = response.1
                    self.pageCounter += 1
                    self.view?.didLoadAllTags(tags: tags)
                }
                
            })
        }
    }
    
    func showMealDetails(meal: MealModel) {
        self.router?.navigate(to:.showDetails(meal: meal))
    }
    
    func loadCachedData() {
        if let obj = interactor?.loadAllCachedData() {
            // LOAD THE UI
            
            for cached in obj.modules {
                cachedTags.append(cached.tag)
                cachedMealsDict[cached.tag.tagName!] = cached.items
            }
            self.isLoadingCachedItems = true
            self.view?.didLoadAllTags(tags: cachedTags)
            self.view?.didLoadAllMeals(meals: cachedMealsDict.first!.value)
            
        } else {
            // NO INTERNET ON THE FIRST TIME
            self.view?.showError(errorStr: "Connect to the internet To Sync New Data")
        }
    }
    
    
}


