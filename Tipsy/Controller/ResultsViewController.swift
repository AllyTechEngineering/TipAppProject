//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Bobby Taylor on 2/15/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var SettingsLabel: UILabel!
    var result = "0.0"
    var tip = 10
    var split = 2
    var totalTip: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = "$\(result)"
        let totalTipValue = String(format: "%0.1f", totalTip)
        SettingsLabel.text = "Split between \(split) people, with \(tip)% tip. Total tip amt: $\(totalTipValue)"
    } //viewDidLoad
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    } //recalculatePressed
} // ResultsViewController
