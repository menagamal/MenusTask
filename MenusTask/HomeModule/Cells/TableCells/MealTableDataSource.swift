//
//  MealTableDataSource.swift
//  MenusTask
//
//  Created by Mena Gamal on 2/1/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import UIKit

class MealTableDataSource:  NSObject, UITableViewDataSource,UITableViewDelegate {
    
     var delegate: MealDatasourceDelegate!
    
    var tableView: UITableView!
  
    var meals = [MealModel]()
    
    init(delegate:MealDatasourceDelegate,tableView:UITableView,meals : [MealModel]) {
        super.init()
        
        self.meals = meals
        self.delegate = delegate
        self.tableView = tableView
        self.tableView.register(UINib(nibName: "MealTableViewCell", bundle: nil), forCellReuseIdentifier: "MealTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.reloadData()
        
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealTableViewCell", for: indexPath) as! MealTableViewCell
        cell.setDetails(meal: meals[indexPath.row], completation: { img in
            
            let imageData = img.pngData()
            let imageToBaseStr = imageData!.base64EncodedString(options: .lineLength76Characters)
            self.meals[indexPath.row].imageBase64 = imageToBaseStr

        })
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didSelectMeal(meal: meals[indexPath.row])
    }
    
}

protocol MealDatasourceDelegate {
    func didSelectMeal(meal:MealModel)
}

