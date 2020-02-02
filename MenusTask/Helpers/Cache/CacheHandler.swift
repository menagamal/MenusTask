//
//  CacheHandler.swift
//  MenusTask
//
//  Created by Mena Gamal on 2/2/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import DataCache

class CacheHandler {
    
    static func SaveData(tag:TagModel,meals:[MealModel])  {
        
        if let data = DataCache.instance.readData(forKey: HomeConstant.Keys.cachedItems)  {
            
            if let items = NSKeyedUnarchiver.unarchiveObject(with: data) as? ArrayOfCachedModule {
                var isFound = false
                for item in items.modules {
                    if item.tag.tagName! == tag.tagName! {
                        isFound = true
                    }
                }
                if !isFound {
                    var cachedModules = items.modules
                    let cacheModule = CachedModule()
                    cacheModule.tag = tag
                    cacheModule.items = meals
                    
                    cachedModules.append(cacheModule)
                    
                    let newArrayOfObjects = ArrayOfCachedModule()
                    newArrayOfObjects.modules = cachedModules
                    
                    
                    DataCache.instance.write(object: newArrayOfObjects, forKey: HomeConstant.Keys.cachedItems)
                }
                
            }
            
        } else {
            // FIRST TIME
            var cachedModules = [CachedModule]()
            let cacheModule = CachedModule()
            cacheModule.tag = tag
            cacheModule.items = meals
            
            let newArrayOfObjects = ArrayOfCachedModule()
            
            cachedModules.append(cacheModule)
            
            newArrayOfObjects.modules = cachedModules
            
            DataCache.instance.write(object: newArrayOfObjects, forKey: HomeConstant.Keys.cachedItems)
        }
    }
    
    static  func loadAllCachedData() -> ArrayOfCachedModule? {
        if let data = DataCache.instance.readData(forKey: HomeConstant.Keys.cachedItems)  {
            if let obj = NSKeyedUnarchiver.unarchiveObject(with: data) as? ArrayOfCachedModule {
                return obj
            } else {
                return nil
            }
            
        } else {
            return nil
        }
    }
    
    
}
