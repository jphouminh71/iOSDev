//
//  customizedSlider.swift
//  Bullseye Game
//
//  Created by Jonathan Phouminh on 6/30/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

import UIKit

class customizedSlider: UISlider {
    
    // this increases the sliders height for the progress bar
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
       var newBounds = super.trackRect(forBounds: bounds)
       newBounds.size.height = 10
       return newBounds
    }

    // allowing us to actually implement an image
    @IBInspectable var thumbImage: UIImage? {
        didSet{
            self.setThumbImage(thumbImage, for: .normal)
        }
    }

}
