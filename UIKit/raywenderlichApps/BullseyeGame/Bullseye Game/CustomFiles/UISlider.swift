//
//  UISlider.swift
//  Bullseye Game
//
//  Created by Jonathan Phouminh on 6/30/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//
import UIKit
import Foundation



///* Created this custom class so that we could make the bar a bigger for the user to see
class CustomSlider: UISlider {
    var sliderSize: CGSize?
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.trackRect(forBounds: bounds)
        sliderSize = rect.size
        rect.size.height = 10
        return rect
    }
    
    func getSize() -> CGSize{
        self.sliderSize!
    }
}
