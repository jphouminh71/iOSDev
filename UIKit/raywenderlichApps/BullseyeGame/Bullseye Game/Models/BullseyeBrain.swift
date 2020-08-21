//
//  BullseyeBrain.swift
//  Bullseye Game
//
//  Created by Jonathan Phouminh on 6/30/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

import Foundation
import UIKit

struct BullsEyeBrain{
    
    // function to generate the target value
    func generateTargetValue() -> Float {
        return Float.random(in: 0.0...100.0)
    }

    // function to calculate distance from target , abs(target - actual)
    func calculateDistance(_ target: Float, _ actual: Float) -> Int{
        print(target)
        print(actual)
        print(abs(Int(target - actual)))
        return abs(Int(target - actual))
    }
    
}
