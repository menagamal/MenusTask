//
//  MealModel.swift
//  MenusTask
//
//  Created by Mena Gamal on 2/1/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

import Foundation
struct MealModel : Codable {
    let id : Int?
    let name : String?
    let photoUrl : String?
    let description : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case photoUrl = "photoUrl"
        case description = "description"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        photoUrl = try values.decodeIfPresent(String.self, forKey: .photoUrl)
        description = try values.decodeIfPresent(String.self, forKey: .description)
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
