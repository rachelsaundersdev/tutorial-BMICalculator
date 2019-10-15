//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Rachel Saunders on 15/10/2019.
//  Copyright © 2019 Rachel Saunders. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    
    var bmi: BMI?
    
    func getBMIValue() -> String {
        
        let bmiToOneDecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiToOneDecimalPlace
        
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice to give"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.white 
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        
        if bmiValue < 19.5 {
            bmi = BMI(value: bmiValue, advice: "You need to eat more!", color: UIColor.blue)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "You are healthy! :)", color: UIColor.green)
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less, move more!", color: UIColor.red)
        }
        
       
    }
    
}
