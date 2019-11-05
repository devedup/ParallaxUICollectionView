//
//  ViewController.swift
//  Parallax
//
//  Created by David Casserly on 27/08/2015.
//  Copyright (c) 2015 DevedUpLtd. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var collectionViewLayout: UICollectionViewFlowLayout!
    
    // MARK: DataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 11;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell: ImageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        cell.label.text = "Cell \(indexPath.row)"
        cell.backgroundImageView.image = UIImage(named: "Parallax \(indexPath.row + 1)")
        
        // Parallax cell setup
        cell.parallaxTheImageViewScrollOffset(offsetPoint: self.collectionView.contentOffset, scrollDirection: self.collectionViewLayout.scrollDirection)
        return cell
    }
    
    
    // MARK: Delegate
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return collectionView.bounds.size;
    }
    
    // MARK: Scrolling
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Parallax visible cells
        for cell: ImageCollectionViewCell in collectionView.visibleCells as! [ImageCollectionViewCell] {
            cell.parallaxTheImageViewScrollOffset(offsetPoint: self.collectionView.contentOffset, scrollDirection: self.collectionViewLayout.scrollDirection)
        }
    }
}
