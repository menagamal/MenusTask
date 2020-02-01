//
//  MenusTaskTests.swift
//  MenusTaskTests
//
//  Created by Mena Gamal on 1/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import XCTest
import Moya
@testable import MenusTask

class MenusTaskTests: XCTestCase {
    
    var homeInteractor:HomeInteractorMock!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        homeInteractor = HomeInteractorMock()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetAllTags()  {
        homeInteractor.getAllTags(index: 0) { (result) in
            XCTAssertNotNil(result.1)
            XCTAssertNil(result.0)
            if result.1.isEmpty {
                XCTFail()
            }
        }
    }
    func testGetAllMeals()  {
        homeInteractor.getAllMeals(str: "testName") { (result) in
            XCTAssertNotNil(result.1)
            XCTAssertNil(result.0)
            if result.1.isEmpty {
                XCTFail()
            }
        }
    }
    
}
