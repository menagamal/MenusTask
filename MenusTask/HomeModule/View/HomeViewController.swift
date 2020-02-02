//
//  ViewController.swift
//  MenusTask
//
//  Created by Mena Gamal on 1/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {
    
    var presenter : HomePresenter!
    
    var mealsDataSource:MealTableDataSource!
    var tagsDataSource:TagsDataSource!
    var isFirstTime = true
    
    @IBOutlet weak var mealsTableView: UITableView!
    @IBOutlet weak var tagsCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.mealsTableView.hero.id = "bar"
        presenter = HomePresenter(interactor: HomeInteractor(), router: HomeRouter(navigationController: self.navigationController!), view: self)
        
        if NetworkReachabilityManager()!.isReachable {
            presenter.getAllTags()
        } else {
            presenter.loadCachedData()
        }
        
    }
    
}

extension HomeViewController:HomeView ,TagsDataSourceActions ,MealDatasourceDelegate{
    
    func didLoadAllTags(tags: [TagModel]) {
        DispatchQueue.main.async {
            self.tagsDataSource = TagsDataSource(collection: self.tagsCollection, tags: tags,delegate: self)
        }
        if isFirstTime {
            isFirstTime = false
            self.presenter.getAllMeals(tag: tags[0])
            
        }
        
    }
    
    func loadTheNextPage() {
        // Load Next Page
        self.presenter.getAllTags()
    }
    
    func didSelectTag(tag: TagModel) {
        // Call The List API
        self.presenter.getAllMeals(tag: tag)
    }
    
    func didLoadAllMeals(meals: [MealModel]) {
        mealsDataSource = MealTableDataSource(delegate: self, tableView: self.mealsTableView, meals: meals)
        DispatchQueue.main.async {
            self.mealsTableView.setContentOffset(.zero, animated: true)
        }
        
        
    }
    
    func didSelectMeal(meal: MealModel) {
        //
        self.presenter.showMealDetails(meal: meal)
    }
    func showError(errorStr: String) {
        // SHow ERROR
        self.showErrorMessage(error: errorStr)
        
    }
    
    
}

