//
//  ViewController.swift
//  Slider Game
//
//  Created by Emmanuel Mac on 21/01/2020.
//  Copyright © 2020 Emmanuel Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var sliderValue: Int = 0
    var targetValue: Int = 0
    var total = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var totalScoreLebel: UILabel!
    @IBOutlet weak var totalRoundLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startNewRound()
        
        customiseSlider()
    
    }
    
    private func customiseSlider() {
        let sliderThumbImage = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(sliderThumbImage, for: .normal)
        
        let highlightedSlider = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(highlightedSlider, for: .highlighted)
        
        
        let inserts = UIEdgeInsets.init(top: 0, left: 14, bottom: 0, right: 14)
        
        let leftThumbImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let leftThumbResizableImage = leftThumbImage.resizableImage(withCapInsets: inserts)
        slider.setMinimumTrackImage(leftThumbResizableImage, for: .normal)
        
        
        let rightThumbImage = #imageLiteral(resourceName: "SliderTrackRight")
        let rightThumbResizableImage = rightThumbImage.resizableImage(withCapInsets: inserts)
        slider.setMaximumTrackImage(rightThumbResizableImage, for: .normal)
        
    }
    
    
    @IBAction func showAlert() {
        
        let difference = abs(sliderValue-targetValue)
        let points = 100 - difference
        
        total += points
        
        let sliderMessage = "Your score is \(points)"
        
        let aert = UIAlertController(title: "Slider value", message: sliderMessage, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Click", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        aert.addAction(action)
        
        present(aert
            , animated: true
            , completion: nil)
        
        //startNewRound()
    }
    
    
    @IBAction func showSliderPosition(_ slider: UISlider){
        let roundedValue = Int(slider.value)
        sliderValue = roundedValue
    }
    
    func startNewRound() {
        round += 1
        let roundedValue = Int(slider.value)
        sliderValue = roundedValue
        targetValue = Int.random(in: 1...100)
        slider.value = Float(50)
        updateUI()
    }
    
    
    func updateUI() {
        label.text = "\(targetValue)"
        totalScoreLebel.text = "\(total)"
        totalRoundLabel.text = "\(round)"
    }
    
    
    @IBAction func resetGame() {
        total = 0
        round = 0
        
        startNewRound()
    }
    
}

