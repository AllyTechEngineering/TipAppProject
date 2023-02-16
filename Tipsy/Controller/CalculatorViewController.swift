//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
// Refactored by Bob Taylor 02/15/2023
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    var tipAmountTemp: Double = 0.0
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    var tip = 0.10
    var numberOfPeople = 1
    var billTotal = 0.0
    var finalResult = "0.0"
    
    
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        // The following code removes the highlight
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        // The following code adds the highlight to any button that was pressed - all others are off
        sender.isSelected = true
        // The following code captures the number with %, removed the % sign, changes to a double and then is used
        // to divide the tip by X percent (0, 10 or 20)
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100
    } //tipChanged
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        // The following code captures the UIStepper value in String format and sets the decimal place
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        // The following code updates the global variable to the number of people
        numberOfPeople = Int(sender.value)
        print("numberOfPeople value = \(numberOfPeople)")
    } //stepperValueChanged
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text ?? "None"
        if bill != ""{
            billTotal = Double(bill) ?? 0.0
            let result = billTotal*(1+tip) / Double(numberOfPeople)
            finalResult = String(format: "%0.2f", result)
        } //if
        self.performSegue(withIdentifier: "goToResults", sender: self)
    } //calculatePressed
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = finalResult
            destinationVC.tip = Int(tip*100)
            destinationVC.split = numberOfPeople
            destinationVC.totalTip = Double(billTotal * tip)
        } //if
    } //func
} //ViewController

