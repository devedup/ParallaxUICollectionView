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
        
    func parallaxTheImageViewScrollOffset(offsetPoint:CGPoint, scrollDirection:UICollectionViewScrollDirection) {
        // Horizontal? If not, it's vertical
        let isHorizontal = .Horizontal == scrollDirection
        
        // Choose the amount of parallax, one might say the distance from the viewer
        // 1 would mean the image wont move at all ie. very far away, 0.1 it moves a little i.e. very close
        let factor: CGFloat = 0.5
        let parallaxFactorX: CGFloat = isHorizontal ? factor : 0.0
        let parallaxFactorY: CGFloat = isHorizontal ? 0.0 : factor
        
        // Calculate the image position and apply the parallax factor
        let finalX = (offsetPoint.x - self.frame.origin.x) * parallaxFactorX
        let finalY = (offsetPoint.y - self.frame.origin.y) * parallaxFactorY
        
        // Now we have final position, set the offset of the frame of the background iamge
        let frame = backgroundImageView.bounds
        let offsetFame = CGRectOffset(frame, CGFloat(finalX), CGFloat(finalY))
        backgroundImageView.frame = offsetFame
    }
    
}
