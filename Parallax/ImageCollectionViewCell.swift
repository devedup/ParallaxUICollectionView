//
//  ImageCollectionViewCell.swift
//  Parallax
//
//  Created by David Casserly on 27/08/2015.
//  Copyright (c) 2015 DevedUpLtd. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var label: UILabel!
        
    func parallaxTheImageViewScrollOffset(scrollOffset:CGFloat) {
        
        // Find the xPosition of the cell within the collection view
        let xPosition: CGFloat = self.frame.origin.x
        
        // Choose the amount of parallax, one might say the distance from the viewer
        // 1 would mean the image wont move at all ie. very far away, 0.1 it moves a little i.e. very close
        let parallaxFactor: CGFloat = 0.5
        
        // Calculate the image position and apply the parallax factor
        let final = (scrollOffset - xPosition) * parallaxFactor

        // Now we have final x position, set the offset of the frame of the background iamge
        let frame = backgroundImageView.bounds
        let offsetFame = CGRectOffset(frame, CGFloat(final), CGFloat(0.0))
        backgroundImageView.frame = offsetFame
    }
    
}
