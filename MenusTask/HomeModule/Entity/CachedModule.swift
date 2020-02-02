//
//  CachedModule.swift
//  MenusTask
//
//  Created by Mena Gamal on 2/2/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

open class CachedModule:NSObject, NSCoding   {
    
    var tag:TagModel!
    var items = [MealModel]()
    
    override init() {
        super.init()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        self.tag = aDecoder.decodeObject(forKey: "tag") as? TagModel
        self.items = aDecoder.decodeObject(forKey: "meals") as! [MealModel]
        
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.items, forKey: "meals")
        aCoder.encode(self.tag, forKey: "tag")
    }
    
}

open class ArrayOfCachedModule:NSObject,NSCoding {
    var modules = [CachedModule]()
    
    public override init() {
        super.init()
    }
    public required init?(coder aDecoder: NSCoder) {
        
        self.modules = aDecoder.decodeObject(forKey: "CachedModule") as! [CachedModule]
        
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.modules, forKey: "CachedModule")
    }
}
