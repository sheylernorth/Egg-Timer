//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTime = ["Soft": 5, "Medium": 4, "Hard": 7]
    
    var timer = Timer()
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var barProgressView: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        var secondsPassed = 0
        self.barProgressView.progress = 0
        self.titleLabel.text = "How do you like your eggs?"
        let hardness = sender.currentTitle!
        let totalTime = (eggTime[hardness]!)
            
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if secondsPassed < totalTime {
                let percentageProgress = Float(secondsPassed) / Float(totalTime)
                self.barProgressView.progress = Float(percentageProgress)
                secondsPassed += 1
            }else {
                self.barProgressView.progress = 1
                self.titleLabel.text = "Done!"
                self.playSound()
                
                }
        }
        
    }
    func playSound() {
    let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
    player = try! AVAudioPlayer(contentsOf: url!)
    player.play()
    }


    
}

