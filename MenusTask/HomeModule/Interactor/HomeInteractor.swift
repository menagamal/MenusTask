//
//  HomeInteractor.swift
//  MenusTask
//
//  Created by Mena Gamal on 1/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import Moya


typealias HomeTagResponse = (Error?,[TagModel])
typealias HomeMealsResponse = (Error?,[MealModel])

protocol HomeUseCase {
    func getAllTags(index:Int,completation:@escaping( (HomeTagResponse)-> Void))
    func getAllMeals(str:String,completation:@escaping( (HomeMealsResponse)-> Void))
}

class HomeInteractor: HomeUseCase {
    
    var provider = MoyaProvider<HomeTarget>(callbackQueue: DispatchQueue.global(qos: .utility))
    var tags = [TagModel]()
    var items = [MealModel]()
    
    func getAllMeals(str: String, completation: @escaping ((HomeMealsResponse) -> Void)) {
//        LoadingView.shared.startLoading()
        provider.request(.getAllMeals(str: str)) { result in
            //LoadingView.shared.stopLoading()
            switch(result) {
            case .success(let response):
                DispatchQueue.main.async {
                    do {
                        if response.statusCode == AppConstant.API.Codes.success.rawValue {
                            let responseModel: MealResponse = try response.map(MealResponse.self)
                            
                            completation((nil,responseModel.items!))
                        } else {
                            completation((HomeConstant.HomeError.InvalidURL,[MealModel]()))
                        }
                    } catch{
                        completation((HomeConstant.HomeError.ParsingError,[MealModel]()))
                    }
                }
            case .failure(_):
                DispatchQueue.main.async {
                    completation((HomeConstant.HomeError.InvalidURL,[MealModel]()))
                }
            }
        }
    }
    
    func getAllTags(index: Int, completation: @escaping((HomeTagResponse) -> Void)) {
//        LoadingView.shared.startLoading()
        provider.request(.getAllTags(index: index)) { result in
//            LoadingView.shared.stopLoading()
            switch(result) {
            case .success(let response):
                DispatchQueue.main.async {
                    do {
                        if response.statusCode == AppConstant.API.Codes.success.rawValue {
                            let responseModel: TagResponse = try response.map(TagResponse.self)
                            for item in responseModel.tags! {
                                self.tags.append(item)
                            }
                            completation((nil,self.tags))
                        } else {
                            completation((HomeConstant.HomeError.InvalidURL,self.tags))
                        }
                    } catch{
                        completation((HomeConstant.HomeError.ParsingError,self.tags))
                    }
                }
            case .failure(_):
                DispatchQueue.main.async {
                    completation((HomeConstant.HomeError.InvalidURL,self.tags))
                }
            }
        }
        
    }
    
}
