//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Rachel Saunders on 15/10/2019.
//  Copyright © 2019 Rachel Saunders. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var bmiValue = "0.0"

    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        
        // the pow is telling height to be raised to the power of the number displayed (in this case 2)
        let bmi = weight / pow(height, 2)
        bmiValue = String(format: "%.1f", bmi)
        
        // goes to the next view controller (connected by Segue)
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = bmiValue
        }
        
    }
}

