//
//  SliderValue.swift
//  iOSFinal
//
//  Created by Vivian Li on 5/5/18.
//  Copyright © 2018 Vivian Mengxue Li. All rights reserved.
//

import Foundation
import UIKit

func setNoiseTolerance(sender: UISlider) -> String{
    let noiseToleranceSlider = sender.value
    var noiseToleranceValue: String
    if noiseToleranceSlider < 0.3 {
        noiseToleranceValue = "Low"
    }
    else if noiseToleranceSlider > 0.7 {
        noiseToleranceValue = "High"
    }
    else {
        noiseToleranceValue = "Alright"
    }
    return noiseToleranceValue
}

func setCleanliness(sender: UISlider) -> String{
    let cleanlinessSlider = sender.value
    var cleanlinessValue: String
    if cleanlinessSlider < 0.3 {
        cleanlinessValue = "Messy"
    }
    else if cleanlinessSlider > 0.7 {
        cleanlinessValue = "Clean"
    }
    else {
        cleanlinessValue = "Alright"
    }
    return cleanlinessValue
}

func setSleeping(sender: UISlider) -> String{
    let sleepingSlider = sender.value
    var sleepingValue: String
    if sleepingSlider < 0.3 {
        sleepingValue = "Before 11 PM"
    }
    else if sleepingSlider > 0.7 {
        sleepingValue = "After 1 AM"
    }
    else {
        sleepingValue = "11 PM - 1 AM"
    }
    return sleepingValue
}

func setWaking(sender: UISlider) -> String{
    let wakingSlider = sender.value
    var wakingValue: String
    if wakingSlider < 0.3 {
        wakingValue = "Before 8 AM"
    }
    else if wakingSlider > 0.7 {
        wakingValue = "After 10 AM"
    }
    else {
        wakingValue = "8 AM - 10 AM"
    }
    return wakingValue
}
