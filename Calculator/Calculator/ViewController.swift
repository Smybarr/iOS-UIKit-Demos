//
//  ViewController.swift
//  Calculator
//
//  Created by Steven Ybarra on 7/5/17.
//  Copyright © 2017 StevenYbarra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var calculationSet:[Float] = [0.0];
    var currentValue:Float = 0.0;
    
    
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        
        outputLabel.text = "0";
    }
    
    @IBAction func ButtonPressed(_ sender: UIButton) {
        
        if (outputLabel.text?.characters.count == 1 && outputLabel.text == "0")
        {
            outputLabel.text = "1";
            
        }
        else {
            outputLabel.text?.characters.append("1");
            
        }
    }
    
    @IBAction func twoButtonPressed(_ sender: UIButton) {
        
        if (outputLabel.text?.characters.count == 1 && outputLabel.text == "0")
        {
            outputLabel.text = "2";
        }
        else {
            outputLabel.text?.characters.append("2");
        }
        
    }
    
    
    @IBOutlet weak var outputLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        outputLabel.text = "0";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

