//
//  ViewController.swift
//  Parallax
//
//  Created by David Casserly on 27/08/2015.
//  Copyright (c) 2015 DevedUpLtd. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet var collectionView: UICollectionView!
    
    // MARK: DataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 11;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell: ImageCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("ImageCollectionViewCell", forIndexPath: indexPath) as! ImageCollectionViewCell
        cell.label.text = "Cell \(indexPath.row)"
        cell.backgroundImageView.image = UIImage(named: "Parallax \(indexPath.row + 1)")
        
        // Parallax cell setup
        cell.parallaxTheImageViewScrollOffset(self.collectionView.contentOffset.x)
        return cell
    }
    
    
    // MARK: Delegate
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return collectionView.bounds.size;
    }
    
    // MARK: Scrolling
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // Parallax visible cells
        for cell: ImageCollectionViewCell in collectionView.visibleCells() as! [ImageCollectionViewCell] {
            cell.parallaxTheImageViewScrollOffset(self.collectionView.contentOffset.x)
        }
    }
}

