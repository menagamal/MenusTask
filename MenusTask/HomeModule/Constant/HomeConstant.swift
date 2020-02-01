//
//  HomeConstant.swift
//  MenusTask
//
//  Created by Mena Gamal on 1/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

enum HomeConstant {
    enum API {
        enum getAllTags {
            static let endPoint = "tags"
            static let SampleData =
            """
            {
            "tags": [
                {
                    "tagName": "1 - Deserts",
                    "photoURL": "https://s3-eu-west-1.amazonaws.com//elmenusv5/Normal/b2276d5d-27b7-11e8-add5-0242ac110011.jpg"
                } ]
            }
            """
        }
        
        
        enum getAllMeals {
            static let endPoint = "items"
            static let SampleData =
            """
            {
            "items": [
                {
                   "id": 132548,
                    "name": "1 - Egyptian -  French Fries",
                    "photoUrl": "https://s3.amazonaws.com/elmenusV3/Photos/Normal/i4g2ehuqrvuw61or.jpg",
                    "description": "Custom premium cut by farm frites. Add melted cheese for 7LE - chili con carne for 9LE"
                } ]
            }
            """
        }
    }
    
    enum HomeError :Error {
        case InvalidURL
        case ParsingError
        var localizedDescription: String {
            switch self {
            case .ParsingError:
                return "the data could not be read in the correct format."
            case .InvalidURL:
                return "Invalid Url Request"
            }
        }
    }
    
}
