//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Rachel Saunders on 15/10/2019.
//  Copyright © 2019 Rachel Saunders. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    // CalculatorBrain is the swift file made for personal changes dependant on bmivalue e.g. underweight
    var calculatorBrain = CalculatorBrain()
    
   // var bmiValue = "0.0"

    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func heightSliderChanged(_ sender: UISlider) {
       let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
    }
    
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
       let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight)Kg"
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        // goes to the next view controller (connected by Segue)
        performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
        
    }
}

