//
//  PhotoVC.swift
//  HeadShapeMeasurement
//
//  Created by Jonathan Compton on 9/28/18.
//  Copyright © 2018 Jonathan Compton. All rights reserved.
//

import UIKit

class PhotoVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.contentScaleFactor = 1.1
        


    }

    @IBAction func cancelTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func keepTapped(_ sender: Any) {
    }
    
}
