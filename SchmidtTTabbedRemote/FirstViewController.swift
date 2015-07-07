//
//  FirstViewController.swift
//  SchmidtTTabbedRemote
//
//  Created by terry schmidt on 5/15/15.
//  Copyright (c) 2015 terry schmidt. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var powerSwitch: UISwitch?
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var channelUp: UIButton!
    @IBOutlet weak var channelDown: UIButton!
    @IBOutlet weak var favChanSegControl: UISegmentedControl!
    @IBOutlet weak var speakerLabel: UILabel!
    @IBOutlet weak var currentChanLabel: UILabel!
    @IBOutlet weak var powerLabel: UILabel!
    var digitArray = [String]()
    
    override func viewWillAppear(animated: Bool) {
        for (var i = 0; i <= 3; i++) {
            favChanSegControl.setTitle(channelLabelArray[i], forSegmentAtIndex: i)
        }
    }
    
    @IBAction func numPressed(sender: UIButton) {
        var incomingDigit: String = sender.currentTitle!  // grab the digit coming
        if(digitArray.count == 0 || digitArray.count == 1) { //if its the first digit
            digitArray.append(incomingDigit) // just add it and dont do anything else
        }
        
        if(digitArray.count == 2) { // if we now have 2 digits...
            var newChan = digitArray[0] + digitArray[1] // put the new channel here
            
            if(newChan == "00") { // channel 00 not allowed!
                digitArray.removeAll() // just delete those values then
            } else { // otherwise its a good, valid channel
                currentChanLabel.text = newChan  // set the new channel
                digitArray.removeAll() // clear the array for the next
            }
        }
    }
    
    @IBAction func sliderValueChange(sender: UISlider) {
        speakerLabel.text = "\(Float(sender.value) * 100)" // set volume text
    }
    
    @IBAction func channelIncrement(sender: UIButton) {
        var currentChan = currentChanLabel.text!.toInt()
        
        if(currentChan! + 1 > 99) {  // bounds checking.  if its out of bounds, dont do anything
            
        } else {
            var newChan = currentChan! + 1
            currentChanLabel.text = "\(String(newChan))" // set the new channel
        }
    }
    
    @IBAction func channelDecrement(sender: UIButton) {
        var currentChan = currentChanLabel.text!.toInt()
        
        if(currentChan! - 1 < 1) { // bounds checking
            
        } else {
            var newChan = currentChan! - 1
            currentChanLabel.text = "\(String(newChan))" // set the new channel
        }
    }
    
    @IBAction func favChanSelected(sender: UISegmentedControl) {
        var index = favChanSegControl.selectedSegmentIndex
        currentChanLabel.text = channelNumArray[index]
    }
    
    @IBAction func switchToggled(sender: UISwitch) {
        powerLabel.text = (sender.on ? "On" : "Off")
        
        if (sender.on == true) { // if switch is on, everything works
            volumeSlider.userInteractionEnabled = true
            channelUp.userInteractionEnabled = true
            channelDown.userInteractionEnabled = true
            zeroButton.userInteractionEnabled = true
            oneButton.userInteractionEnabled = true
            twoButton.userInteractionEnabled = true
            threeButton.userInteractionEnabled = true
            fourButton.userInteractionEnabled = true
            fiveButton.userInteractionEnabled = true
            sixButton.userInteractionEnabled = true
            sevenButton.userInteractionEnabled = true
            eightButton.userInteractionEnabled = true
            nineButton.userInteractionEnabled = true
            favChanSegControl.userInteractionEnabled = true
        }
        
        if (sender.on == false) { // if power switch not on, everything is disabled
            volumeSlider.userInteractionEnabled = false
            channelUp.userInteractionEnabled = false
            channelDown.userInteractionEnabled = false
            zeroButton.userInteractionEnabled = false
            oneButton.userInteractionEnabled = false
            twoButton.userInteractionEnabled = false
            threeButton.userInteractionEnabled = false
            fourButton.userInteractionEnabled = false
            fiveButton.userInteractionEnabled = false
            sixButton.userInteractionEnabled = false
            sevenButton.userInteractionEnabled = false
            eightButton.userInteractionEnabled = false
            nineButton.userInteractionEnabled = false
            favChanSegControl.userInteractionEnabled = false
        }
    }
}