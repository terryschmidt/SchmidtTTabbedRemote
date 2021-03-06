//
//  ThirdViewController.swift
//  SchmidtTTabbedRemote
//
//  Created by terry schmidt on 5/15/15.
//  Copyright (c) 2015 terry schmidt. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var channelNum: UILabel!
    @IBOutlet weak var textBox: UITextField!
    @IBOutlet weak var favSegment: UISegmentedControl!

    @IBAction func stepperPressed(sender: UIStepper) {
        let val = Int(sender.value)
     
        if val <= 99 && val >= 1 {
            channelNum.text = Int(sender.value).description
        }
    }
    
    @IBAction func cancelPressed(sender: UIButton) {
        textBox.text = ""
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func savePressed(sender: UIButton) {
        if (textBox.text!.characters.count <= 4 && textBox.text!.characters.count >= 1) {
            let index = favSegment.selectedSegmentIndex
            channelLabelArray[index] = textBox.text!
            
            if let num = channelNum.text {
                channelNumArray[index] = num
            }
            
            //channelNumArray[index] = channelNum.text!
        } else {
            let alertController = UIAlertController(title: "Sorry, your label is either too long or too short.", message:"Label must be 1 to 4 characters.", preferredStyle: UIAlertControllerStyle.Alert);
            
            alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil));
            
            self.presentViewController(alertController, animated: true, completion: nil);
        }
    }
}