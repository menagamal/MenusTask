//
//  HomeTarget.swift
//  MenusTask
//
//  Created by Mena Gamal on 1/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import Moya

typealias MoyaMethod = Moya.Method

enum HomeTarget {
    case getAllTags(index:Int)
    case getAllMeals(str:String)
}

extension HomeTarget: TargetType {
    var baseURL: URL {
        return URL(string: AppConstant.API.BaseUrl)!
    }
    
    var path: String {
        switch self {
            
        case .getAllTags(let index):
            return HomeConstant.API.getAllTags.endPoint + "/\(index)"
            
        case .getAllMeals(let str):
            return HomeConstant.API.getAllMeals.endPoint + "/\(str)"
        }
    }
    
    var method: MoyaMethod {
        switch self {

        case .getAllTags(_),.getAllMeals(_):
            return .get
            
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getAllMeals(_):
            return  HomeConstant.API.getAllMeals.SampleData.data(using: String.Encoding.utf8)!
        case .getAllTags(_):
            return  HomeConstant.API.getAllTags.SampleData.data(using: String.Encoding.utf8)!
            
        }
    }
    
    var task: Task {
        switch self {
        case .getAllTags(_),.getAllMeals(_):
            return .requestPlain
        }
    }
    
    public var headers: [String: String]? {
        
        return [String:String]()
    }
    
    // 7
    public var validationType: ValidationType {
        return .successCodes
    }
}

