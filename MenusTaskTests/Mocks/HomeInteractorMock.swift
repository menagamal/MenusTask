//
//  HomeInteractorMock.swift
//  MenusTaskTests
//
//  Created by Mena Gamal on 1/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
@testable import MenusTask


class HomeInteractorMock: HomeUseCase {
    
    func getAllTags(index: Int, completation: @escaping ((HomeTagResponse) -> Void)) {
        let temp = HomeTarget.getAllTags(index: 0).sampleData
        do {
            let responseModel: TagResponse = try JSONDecoder().decode(TagResponse.self, from: temp)
            completation((nil,responseModel.tags!))
        } catch {
            completation((HomeConstant.HomeError.ParsingError,[TagModel]()))
        }
    }
    
}
