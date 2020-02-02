//
//  MealModel.swift
//  MenusTask
//
//  Created by Mena Gamal on 2/1/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

class MealModel :  NSObject, Codable, NSCoding {
    let id : Int?
    let name : String?
    let photoUrl : String?
    let descriptionStr : String?
    var imageBase64:String!
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case name = "name"
        case photoUrl = "photoUrl"
        case descriptionStr = "description"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        photoUrl = try values.decodeIfPresent(String.self, forKey: .photoUrl)
        descriptionStr = try values.decodeIfPresent(String.self, forKey: .descriptionStr)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        self.id = aDecoder.decodeObject(forKey: "id") as? Int
        self.name = aDecoder.decodeObject(forKey: "name") as? String
        self.photoUrl = aDecoder.decodeObject(forKey: "photoUrl") as? String
        self.descriptionStr = aDecoder.decodeObject(forKey: "descriptionStr") as? String
        self.imageBase64 = aDecoder.decodeObject(forKey: "imageBase64") as? String
    }
    
    open func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "id")
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.photoUrl, forKey: "photoUrl")
        aCoder.encode(self.descriptionStr, forKey: "descriptionStr")
        aCoder.encode(self.imageBase64, forKey: "imageBase64")
        
    }
    
}



struct MealResponse : Codable {
    let items : [MealModel]?
    
    enum CodingKeys: String, CodingKey {
        
        case items = "items"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        items = try values.decodeIfPresent([MealModel].self, forKey: .items)
    }
    
}
