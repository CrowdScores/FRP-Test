//
//  ViewController2.swift
//  FRP-Test
//
//  Created by Ryan King on 13/01/2017.
//  Copyright © 2017 Ryan King. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift

class PictureViewController: UIViewController {
    
    @IBOutlet var alphaPercentageLabel : UILabel!
    @IBOutlet var radiusPercentageLabel : UILabel!
    @IBOutlet var kittenImage : UIImageView!
    @IBOutlet var alphaSlider : UISlider!
    @IBOutlet var radiusStepper : UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Setup the image initially
        self.kittenImage.alpha = 0.0
        self.kittenImage.layer.cornerRadius = 0.0
        
        self.alphaSlider.reactive.values.observeValues { (float) in
            self.kittenImage.alpha = CGFloat(float)
            self.alphaPercentageLabel.text = String(format: "%.00f", float * 100)
        }
        
        self.radiusStepper.reactive.values.observeValues { (double) in
            self.kittenImage.layer.cornerRadius = CGFloat(double)
            self.radiusPercentageLabel.text = String(format: "%.00f", double)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
