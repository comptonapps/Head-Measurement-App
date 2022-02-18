//
//  MenuVC.swift
//  HeadShapeMeasurement
//
//  Created by Jonathan Compton on 9/28/18.
//  Copyright © 2018 Jonathan Compton. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func plagiocephalyTapped(_ sender: Any) {
        StateManager.shared.plagiocephaly = true
        performSegue(withIdentifier: "toCameraVC", sender: nil)
    }
    @IBAction func brachycephalyTapped(_ sender: Any) {
        StateManager.shared.plagiocephaly = false
        performSegue(withIdentifier: "toCameraVC", sender: nil)
    }
    
}

