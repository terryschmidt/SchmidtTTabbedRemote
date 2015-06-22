//
//  SecondViewController.swift
//  SchmidtTTabbedRemote
//
//  Created by terry schmidt on 5/15/15.
//  Copyright (c) 2015 terry schmidt. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var powerSwitch: UISwitch!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var fastForwardButton: UIButton!
    @IBOutlet weak var fastRewindButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    var isInPlayMode = false
    
    @IBAction func switchToggled(sender: UISwitch) {
        powerLabel.text = (sender.on ? "On" : "Off")
        
        if(sender.on == true) {
            playButton.userInteractionEnabled = true
            stopButton.userInteractionEnabled = true
            pauseButton.userInteractionEnabled = true
            fastForwardButton.userInteractionEnabled = true
            fastRewindButton.userInteractionEnabled = true
            recordButton.userInteractionEnabled = true
        }
        
        if(sender.on == false) {
            playButton.userInteractionEnabled = false
            stopButton.userInteractionEnabled = false
            pauseButton.userInteractionEnabled = false
            fastForwardButton.userInteractionEnabled = false
            fastRewindButton.userInteractionEnabled = false
            recordButton.userInteractionEnabled = false
            stateLabel.text = "Stopped"
            isInPlayMode = false
        }
    }
    
    @IBAction func playPressed(sender: UIButton) {
        if(stateLabel.text == "Recording") {
            impossibleRequest("Playing")
        } else {
            stateLabel.text = "Playing"
            isInPlayMode = true
        }
    }
    
    @IBAction func stopPressed(sender: UIButton) {
        isInPlayMode = false
        stateLabel.text = "Stopped"
    }
    
    @IBAction func pausePressed(sender: UIButton) {
        if (isInPlayMode == true && stateLabel.text != "Recording") {
            stateLabel.text = "Paused"
        } else {
            impossibleRequest("Paused")
        }
    }
    
    @IBAction func fastForwardPressed(sender: UIButton) {
        if (isInPlayMode == true && stateLabel.text != "Recording") {
            stateLabel.text = "Fast forwarding"
        } else {
            impossibleRequest("Fast forwarding")
        }
    }
    
    @IBAction func fastRewindPressed(sender: UIButton) {
        if (isInPlayMode == true && stateLabel.text != "Recording") {
            stateLabel.text = "Fast rewinding"
        } else {
            impossibleRequest("Fast rewinding")
        }
    }
    
    @IBAction func recordPressed(sender: UIButton) {
        if (stateLabel.text == "Stopped" && isInPlayMode == false) {
            stateLabel.text = "Recording"
        } else {
            impossibleRequest("Recording")
        }
    }
    
    internal func impossibleRequest(stateRequested: String) {
        let title = "You've selected an impossible request."
        let alertController = UIAlertController(title: title, message: "", preferredStyle: .ActionSheet)
        
        // Create the action.
        let cancelAction = UIAlertAction(title: "Cancel", style: .Destructive) { action in
            let cancelController = UIAlertController(title: "Request cancelled.", message: "", preferredStyle: .Alert)
            let okayAction = UIAlertAction(title: "Okay", style: .Default, handler: nil)
            cancelController.addAction(okayAction)
            self.presentViewController(cancelController, animated: true, completion: nil)
        }
        
        let confirmAction = UIAlertAction(title: "Force", style: .Default) { action in
            let okayController = UIAlertController(title: "Current operation stopped.", message: "Requested operation proceeding.", preferredStyle: .Alert)
            
            self.stateLabel.text = "Stopped"
            if (stateRequested == "Playing" || stateRequested == "Paused" || stateRequested == "Fast forwarding" || stateRequested == "Fast rewinding") {
                self.isInPlayMode = true
            } else {
                self.isInPlayMode = false
            }
            self.stateLabel.text = stateRequested
            
            let okayAction = UIAlertAction(title: "Okay", style: .Default, handler: nil)
            okayController.addAction(okayAction)
            self.presentViewController(okayController, animated: true, completion: nil)
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
        presentViewController(alertController, animated: true, completion: nil)
    }

}

