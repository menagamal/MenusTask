//
//  TagsDataSource.swift
//  MenusTask
//
//  Created by Mena Gamal on 1/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//


import Foundation
import UIKit

class TagsDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout {
    
    var tags: [TagModel] = [TagModel]()
    var collection:UICollectionView!
    
    override init() {
        super.init()
    }
    
    init(collection:UICollectionView,tags:[TagModel]) {
        super.init()
        
        self.collection = collection
        
        self.tags = tags
        
        self.collection.register(UINib(nibName: "TagCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TagCollectionViewCell")
        
        self.collection.dataSource = self
        
        self.collection.delegate = self
        
        self.collection.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCollectionViewCell",for: indexPath) as! TagCollectionViewCell
        cell.setDetails(tag: tags[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
//    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
//        
//        let padding: CGFloat = 5
//        let width = collectionView.frame.size.width/4 - padding
//        let height = collectionView.frame.size.height - padding
//        return CGSize(width: width, height: height)
//        
//    }
    
}
