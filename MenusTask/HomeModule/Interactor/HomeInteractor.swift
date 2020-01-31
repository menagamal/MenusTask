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
    var tags = [TagModel]()
    
    func getAllTags(index: Int, completation: @escaping(([TagModel]) -> Void)) {
        LoadingView.shared.startLoading()
        provider.request(.getAllTags(index: index)) { result in
            LoadingView.shared.stopLoading()
            switch(result) {
            case .success(let response):
                DispatchQueue.main.async {
                    do {
                        if response.statusCode == AppConstant.API.Codes.success.rawValue {
                            let responseModel: TagResponse = try response.map(TagResponse.self)
                            for item in responseModel.tags! {
                                self.tags.append(item)
                            }
                            completation(self.tags)
                        } else {
                            completation(self.tags)
                        }
                    } catch{
                        completation(self.tags)
                    }
                }
            case .failure(_):
                DispatchQueue.main.async {
                    completation(self.tags)
                }
            }
        }
        
    }
    
    
    
    
}
