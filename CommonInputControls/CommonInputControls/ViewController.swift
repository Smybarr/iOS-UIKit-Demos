//
//  ViewController.swift
//  CommonInputControls
//
//  Created by Steven Ybarra on 7/4/17.
//  Copyright © 2017 StevenYbarra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //this function is an action that executes when 
    //the screen is tapped - set as a tap gesture recognizer;
    //prints coordinates according to where the screen was tapped;
    @IBAction func respondToTapGesture(_ sender: UITapGestureRecognizer) {
        
        let location = sender.location(in: view)
        print(location);
        outputLabel.text = "\(location)"
    }
    
    //this method was modified to be connected to 
    //button object programmatically;
    //button object created as an outlet, and the connection
    //is made within viewDidLoad() method below;
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        print("button pressed");
        outputLabel.text = "button Pressed"
        
        //this code affects the outlet object representing toggle 
        //toggle == var name for switch;
        //this does NOT turn the switch on and off by pressing
        //button - just returns the current state of toggle switch;
        if (toggle.isOn) {
            print("Toggle Switch on");
            outputLabel.text = "Toggle Switch on"
        }
        else {
            print("Toggle Switch off");
            outputLabel.text = "Toggle Switch off"
        }
        
        //this code affects the outlet object representing the 
        //slider; pressing buttong does NOT change the state
        //of the slider - just prints the current value;
        print("The slider is set to \(slider.value)");
        outputLabel.text = "The slider is set to \(slider.value)"
    }
    

    
    //for the switch, make sure that the sender is the UISwitch 
    //object;
    @IBAction func switchFlipped(_ sender: UISwitch) {
        
        if (sender.isOn) {
            print("Switch on");
            outputLabel.text = "Switch on"
        }
        else {
            print("Switch off");
            outputLabel.text = "Switch off"
        }
    }
    
    //make sure the sender is the UISlider object;
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        
        print(sender.value);
        outputLabel.text = "slider position = \(sender.value)"
    }
    
    
    @IBAction func keyboardReturnKeyTapped(_ sender: UITextField) {
        
        if let text = sender.text {
            print(text);
            outputLabel.text = "\(text)"
        }
    }
    
    
    @IBAction func textFieldChanged(_ sender: UITextField) {
        
        if let text = sender.text {
            print(text);
            outputLabel.text = "\(text)"
        }
    }
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var toggle: UISwitch!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var outputLabel: UILabel!
    
    
    //presets view properties (think didSet with properties);
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //programmatic connection of button object to action 
        // (buttonPressed method );
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

