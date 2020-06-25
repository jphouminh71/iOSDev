//
//  main.swift
//  protocols.Demo
//
//  Created by Jonathan Phouminh on 6/12/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

import Foundation
import SwiftUI


protocol canFly{
    func fly()
}

class Bird{
    var isFemale: Bool = true
    func layEgg(){
        if (isFemale){
            print("The bird makes a new bird in a shell")
        }
    }
}
struct FlyingMuseum{
    func flyingDemo(flyingObject: canFly){
        flyingObject.fly()
    }
}

struct Airplane: canFly{
    func fly() {
        print("The airplane uses its engines to lift off into the air")
    }
}
class Eagle: Bird, canFly{
    
    func fly() {
        print("The eagle flaps its wings and lifts off into the sky.")
    }
    func soar(){
        print("The eagle glides in the air using air currents.")
    }
}

class Penguin: Bird{
    func swim(){
        print("The penguin paddles through the water")
    }
}

let myEagle = Eagle()
let myPenguin = Penguin()
let museum = FlyingMuseum()


/*  PROTOCOLS / DELAGATES */

/* so whoever adopts this protocol is able to perform CPR */
protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler{
    
    /* whatever object that is instantiated MUST conform to the ALS protocol */
    var delagate: AdvancedLifeSupport?
    
    func assessSituation(){
        print("Can you tell me what happened")
    }
    
    func medicalEmergency() {
        delagate?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSupport{
    init(_ handler: EmergencyCallHandler) {
        handler.delagate = self          /* I am the one working with the current call handler */
    }
    
    func performCPR() {
        print("The paramedic does chest compressions, 30 per second ")
    }
}

class Doctor: AdvancedLifeSupport{
    init(_ handler: EmergencyCallHandler) {
        handler.delagate = self          /* I am the one working with the current call handler */
    }
    
    func performCPR() {
        print("The doctor does chest compressions, 30 per second ")
    }
    
    func useStethescope(){
        print("Listening for heart sounds")
    }
}

class Surgeon: Doctor{
    override func performCPR() {
        super.performCPR()
        print("Sings staying alive  by the BeeGees")
    }
    
}

let emilio = EmergencyCallHandler()
let pete = Paramedic(emilio)   // so pete is on call for emelio
emilio.assessSituation()
emilio.medicalEmergency()



/* Extensions and Default Implementations */

extension Double{
    func round(to places: Int) -> Double{
        let precisionNumber = pow(10,Double(places))
        var n = self
        n = n * precisionNumber
        n.round()
        n = n / precisionNumber
        return n
    }
}

var myDouble = 3.14159
print(myDouble.round(to: 2))







