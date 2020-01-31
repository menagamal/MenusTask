//
//  HomeInteractor.swift
//  MenusTask
//
//  Created by Mena Gamal on 1/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import Moya

protocol HomeUseCase {
    func getAllTags(index:Int,completation:@escaping(([TagModel])-> Void))
}

class HomeInteractor: HomeUseCase {
    
    var provider = MoyaProvider<HomeTarget>(callbackQueue: DispatchQueue.global(qos: .utility))
    
    func getAllTags(index: Int, completation: @escaping(([TagModel]) -> Void)) {
        provider.request(.getAllTags(index: index)) { result in
            switch(result) {
            case .success(let response):
                DispatchQueue.main.async {
                    do {
                        if response.statusCode == AppConstant.API.Codes.success.rawValue {
                            let responseModel: TagResponse = try response.map(TagResponse.self)
                            completation(responseModel.tags!)
                        } else {
                            completation([TagModel]())
                        }
                    } catch{
                        completation([TagModel]())
                    }
                }
            case .failure(_):
                DispatchQueue.main.async {
                    completation([TagModel]())
                }
            }
        }
        
    }
    
    
    
    
}
