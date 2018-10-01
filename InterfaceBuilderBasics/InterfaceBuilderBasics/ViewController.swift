//
//  ViewController.swift
//  InterfaceBuilderBasics
//
//  Created by Steven Ybarra on 10/1/18.
//  Copyright © 2018 Smybarr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.viewMode = ViewMode.HomeMode

    }
    
    enum ViewMode {
        case RedMode
        case GreenMode
        case HomeMode

    }
    
    //default view mode is HomeMode
    var viewMode:ViewMode = ViewMode.HomeMode
    
    //pointer to label text on main view
    @IBOutlet weak var labelOutlet: UILabel!
    @IBOutlet weak var buttonLableOutlet: UIButton!
    
    //action that changes text of labelOutlet and mainViewOutlet when pressed/executed
    @IBAction func modLabelButton(_ sender: Any) {
        
        //change the view mode
        if self.viewMode == ViewMode.HomeMode
        {
            //home mode to red mode
            ChangeViewMode(newMode: ViewMode.RedMode)
            
        }
        else if self.viewMode == ViewMode.RedMode
        {
            //red mode to green mode
            ChangeViewMode(newMode: ViewMode.GreenMode)
            
        }
        else
        {
            //green mode back to home mode
            ChangeViewMode(newMode: ViewMode.HomeMode)
        }
    }
    
    
    func ChangeViewMode(newMode: ViewMode) {
        
        switch(newMode)
        {
            
        case ViewMode.HomeMode:
            //change the view mode
            self.viewMode = ViewMode.HomeMode
            //change the background color of the view
            setViewBackgroundColor(newColor: UIColor.white)
            //change the text
            labelOutlet.text = "Press the button labeled 'Press me' below to change the text!"
            //change the button label
            buttonLableOutlet.setTitle("Press me", for: .normal)
            
            break
            
        case ViewMode.RedMode:
            //change the view mode
            self.viewMode = ViewMode.RedMode
            //change the background color of the view
            setViewBackgroundColor(newColor: UIColor.red)
            //change the text
            labelOutlet.text = "View is now red! Press the button again to see what happens!"
            break
            
        case ViewMode.GreenMode:
            //change the view mode
            self.viewMode = ViewMode.GreenMode
            //change the background color of the view
            setViewBackgroundColor(newColor: UIColor.green)
            //change the text
            labelOutlet.text = "View is now green! Press the button labeled 'Home' to back to home screen."
            //change the button label
            buttonLableOutlet.setTitle("Home", for: .normal)
            break
        }
    }
    
    func setViewBackgroundColor(newColor: UIColor) {
        
        //set the color of the mainViewOutlet
        self.view.backgroundColor = newColor
    }
    

}

