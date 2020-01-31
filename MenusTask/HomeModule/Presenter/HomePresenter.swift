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
}

class HomePresenter: HomePresenterDelegate {
    
    private var interactor:HomeInteractor?
    private var router:HomeRouter?
    
    //MARK: TO AVOID RETAIN CYCLE
    private weak var view:HomeView?
    
    
    private var pageCounter = 0
    
    init(interactor:HomeInteractor,router:HomeRouter,view:HomeView) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    
    func getAllTags() {
        interactor?.getAllTags(index: pageCounter, completation: { (tags) in
            self.view?.didLoadAllTags(tags: tags)
        })
    }
    
}


