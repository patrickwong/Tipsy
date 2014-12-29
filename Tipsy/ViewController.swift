//
//  ViewController.swift
//  Tipsy
//
//  Created by Patrick Wong on 12/26/14.
//  Copyright (c) 2014 Patrick Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var peopleStepper: UIStepper!
    @IBOutlet weak var peopleImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.text = "$"
        tipLabel.text = "$"
        totalLabel.text = "$0.00"
        peopleLabel.text = "1"
        
        // Initial value for animation when no bill amount input
        tipLabel.alpha = 0
        tipControl.alpha = 0
        peopleImage.alpha = 0
        peopleLabel.alpha = 0
        peopleStepper.alpha = 0
        totalLabel.alpha = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onEditingChange(sender: AnyObject) {
        var billAmount = NSString(string: billField.text).doubleValue
        var tipPercentages = [0.15, 0.18, 0.20]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var tip = billAmount * tipPercentage
        var people = peopleStepper.value
        var total = (billAmount + tip)/people
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        // Fade in when bill amount input
        UIView.animateWithDuration(0.2, animations: {
            self.tipLabel.alpha = 1
            self.tipControl.alpha = 1
        })
        
        UIView.animateWithDuration(0.8, animations: {
            self.peopleImage.alpha = 1
            self.peopleLabel.alpha = 1
            self.peopleStepper.alpha = 1
            self.totalLabel.alpha = 1
        })
        
        // Fade out when no bill amount
        if(billField.text.isEmpty){
            UIView.animateWithDuration(0.2, animations: {
                self.tipLabel.alpha = 0
                self.totalLabel.alpha = 0
            })
        }
    }

    @IBAction func valueChanged(sender: AnyObject) {
        var billAmount = NSString(string: billField.text).doubleValue
        var tipPercentages = [0.15, 0.18, 0.20]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var tip = billAmount * tipPercentage
        var people = peopleStepper.value
        var total = (billAmount + tip)/people
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        peopleLabel.text = "\(Int(peopleStepper.value))"
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}


