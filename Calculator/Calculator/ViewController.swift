//
//  ViewController.swift
//  Calculator
//
//  Created by Alice Gamarnik on 2/26/19.
//  Copyright © 2019 Alice Gamarnik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "0"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnNumberClicked(_ sender: UIButton) {
        resultLabel.text = sender.currentTitle
    }
    
    
    


}

