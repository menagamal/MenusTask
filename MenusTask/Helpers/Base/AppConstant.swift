//
//  AppConstant.swift
//  MenusTask
//
//  Created by Mena Gamal on 1/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

enum AppConstant {
    enum API {
        static let BaseUrl = "https://elmenus-task.getsandbox.com/"
        enum Codes: Int {
            case success = 200
            case failed = 404
        }
    }
    
    enum Regex{
        static let Email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        static let Password = "^(?=.*[A-Z])[a-zA-Z\\d]{8,}$"
    }
    
}

