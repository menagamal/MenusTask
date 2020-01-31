//
//  ViewController.swift
//  MenusTask
//
//  Created by Mena Gamal on 1/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var presenter : HomePresenter!
    var tagsDataSource:TagsDataSource!
    
    @IBOutlet weak var tagsCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = HomePresenter(interactor: HomeInteractor(), router: HomeRouter(navigationController: self.navigationController!), view: self)
        presenter.getAllTags()
    }
    
}

extension HomeViewController:HomeView ,TagsDataSourceActions {
    
    func didLoadAllTags(tags: [TagModel]) {
        DispatchQueue.main.async {
            self.tagsDataSource = TagsDataSource(collection: self.tagsCollection, tags: tags,delegate: self)
        }
        
    }
    func loadTheNextPage() {
        // Load Next Page
        self.presenter.getAllTags()
    }
    
    func didSelectTag(tag: TagModel) {
        // Call The List API
    }
    
}

