//
//  ViewController.swift
//  TwoButtons
//
//  Created by Steven Ybarra on 7/5/17.
//  Copyright © 2017 StevenYbarra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func setTextButton(_ sender: UIButton) {
        
        print("set text button pressed");
        print("outputTextLabel set to = textField\n");
        
        outputTextLabel.isHidden = false;
        outputTextLabel.text = textField.text;
        
    }
    
    
    @IBAction func clearTextButton(_ sender: UIButton) {
        
        print("clear text button pressed");
        print("outputTextLabel reset\n");
        
        
        outputTextLabel.text = "";

        
    }
    
    
    @IBOutlet weak var textField: UITextField!

    @IBOutlet weak var outputTextLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        outputTextLabel.isHidden = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

