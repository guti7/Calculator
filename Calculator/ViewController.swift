//
//  ViewController.swift
//  Calculator
//
//  Created by Guti on 7/23/16.
//  Copyright © 2016 PielDeJaguar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayLabel: UILabel!
    
    var userIsInTheMiddleOfTyping = false
    
    // MARK: Actions
    
    @IBAction func touchDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = displayLabel.text!
            displayLabel.text = textCurrentlyInDisplay + digit
        } else {
            displayLabel.text = digit
        }
        userIsInTheMiddleOfTyping = true
        print("touched \(digit) digit.")
    }
    
    @IBAction func performOperation(sender: UIButton) {
        userIsInTheMiddleOfTyping = false
        if let mathematicalSymbol = sender.currentTitle {
            if mathematicalSymbol == "π" {
                displayLabel.text = String(M_PI) // construct a string version
            }
            
            print("current operation \(mathematicalSymbol)")
        }
    }
    
}

