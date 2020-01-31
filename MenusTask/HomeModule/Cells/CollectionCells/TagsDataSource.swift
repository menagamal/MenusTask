//
//  TagsDataSource.swift
//  MenusTask
//
//  Created by Mena Gamal on 1/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//


import Foundation
import UIKit

class TagsDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout ,UICollectionViewDataSourcePrefetching{
    
    var tags: [TagModel] = [TagModel]()
    var collection:UICollectionView!
    var delegate:TagsDataSourceActions!
    
    override init() {
        super.init()
    }
    
    init(collection:UICollectionView,tags:[TagModel],delegate:TagsDataSourceActions) {
        super.init()
        
        self.collection = collection
        
        self.tags = tags
        
        self.collection.register(UINib(nibName: "TagCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TagCollectionViewCell")
        
        self.collection.prefetchDataSource = self
        
        self.collection.dataSource = self
        
        self.collection.delegate = self
        
        self.delegate = delegate
        
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
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == tags.count - 1 {
            self.delegate.loadTheNextPage()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = tags[indexPath.row]
        self.delegate.didSelectTag(tag: item)
    }
    
}


protocol TagsDataSourceActions {
    func loadTheNextPage()
    func didSelectTag(tag:TagModel)
}
