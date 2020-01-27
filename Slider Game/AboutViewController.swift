//
//  AboutViewController.swift
//  Slider Game
//
//  Created by Emmanuel Mac on 27/01/2020.
//  Copyright © 2020 Emmanuel Mac. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func close() {
        dismiss(animated: true) {
            print("Closed")
        }
    }
}
