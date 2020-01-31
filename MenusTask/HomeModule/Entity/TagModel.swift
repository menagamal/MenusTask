//
//  TagModel.swift
//  MenusTask
//
//  Created by Mena Gamal on 1/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//



import Foundation
struct TagModel : Codable {
    let tagName : String?
    let photoURL : String?

    enum CodingKeys: String, CodingKey {

        case tagName = "tagName"
        case photoURL = "photoURL"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        tagName = try values.decodeIfPresent(String.self, forKey: .tagName)
        photoURL = try values.decodeIfPresent(String.self, forKey: .photoURL)
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
