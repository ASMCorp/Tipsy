//
//  ViewController.swift
//  Tipsy
//
//  Created by Asaduzzaman Anik on 5/7/20.
//  Copyright © 2020 Asaduzzaman Anik. All rights reserved.
//

import UIKit

class TipsyVC: UIViewController {
    @IBOutlet weak var totalAmount: UITextField!
    @IBOutlet weak var splitAmount: UILabel!
    @IBOutlet weak var stepperAmount: UIStepper!
    @IBOutlet weak var buttonFive: UIButton!
    @IBOutlet weak var buttonTen: UIButton!
    @IBOutlet weak var buttonfifteen: UIButton!
    @IBOutlet weak var buttontwenty: UIButton!
    @IBOutlet weak var calculate: UIButton!
    
    var totalBill: Double = 0.0
    var tip: Double = 0.0
    var split: Int = 0
    var finalResult = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculate.layer.cornerRadius = 20.0
        splitAmount.text = String(0)
        stepperAmount.wraps = true
        stepperAmount.autorepeat = true
        stepperAmount.maximumValue = 50
    }

    @IBAction func splitChanger(_ sender: UIStepper) {
        splitAmount.text = Int(sender.value).description
        split = Int(splitAmount.text!) ?? 1
    }
    
    @IBAction func amount(_ sender: UIButton){
        totalAmount.endEditing(true)
        buttonFive.isSelected = false
        buttonTen.isSelected = false
        buttontwenty.isSelected = false
        buttonfifteen.isSelected = false
        sender.isSelected = true
        tip = Double(sender.tag)
    }
    
    
    
    @IBAction func calculate(_ sender: UIButton) {
        let bill = totalAmount.text!
        if bill != ""{
            totalBill = Double(bill)!
            let result = (totalBill * (1 + tip/100)) / Double(split)
            
            finalResult = String(format: "%.2f", result)
        }
        self.performSegue(withIdentifier: "result", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "result"{
            let resultVersionController = segue.destination as! FinalViewController
            resultVersionController.result = finalResult
            resultVersionController.split = split
        }
    }
}

