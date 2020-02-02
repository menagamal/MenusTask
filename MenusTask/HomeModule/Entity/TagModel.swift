//
//  TagModel.swift
//  MenusTask
//
//  Created by Mena Gamal on 1/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//


import UIKit
import Foundation
class TagModel : NSObject, Codable, NSCoding {
    
    let tagName : String?
    let photoURL : String?
    var imageBase64:String?
    
    enum CodingKeys: String, CodingKey {

        case tagName = "tagName"
        case photoURL = "photoURL"
    }

    required init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        tagName = try values.decodeIfPresent(String.self, forKey: .tagName)
        photoURL = try values.decodeIfPresent(String.self, forKey: .photoURL)
        
        
    }
    public required init?(coder aDecoder: NSCoder) {
         
        self.tagName = aDecoder.decodeObject(forKey: "tagName") as? String
        self.photoURL = aDecoder.decodeObject(forKey: "photoURL") as? String
        self.imageBase64 = aDecoder.decodeObject(forKey: "imageBase64") as? String
     }
     
     open func encode(with aCoder: NSCoder) {
        
         aCoder.encode(self.tagName, forKey: "tagName")
         aCoder.encode(self.photoURL, forKey: "photoURL")
         aCoder.encode(self.imageBase64, forKey: "imageBase64")

     }
}



import Foundation
struct TagResponse : Codable {
    let tags : [TagModel]?

    enum CodingKeys: String, CodingKey {

        case tags = "tags"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        tags = try values.decodeIfPresent([TagModel].self, forKey: .tags)
    }

}
