//
//  ViewController.swift
//  Pomodoro
//
//  Created by Kunduz on 12.07.2022.
//

import UIKit

class ViewController: UIViewController {
   
    var timer = Timer()
    var isTimeStarted = false
    var time = 1500

    @IBOutlet var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func playButton(_ sender: UIButton) {
        sender.isSelected  = !sender.isSelected
        if (sender.isSelected) {
            sender.isSelected = true
            if !isTimeStarted {
                startTimer()
                isTimeStarted = true
                sender.setImage(UIImage(named: "pause"), for: .selected)
            } else {
                timer.invalidate()
                isTimeStarted = false
            }
          
        } else {
            sender.isSelected = false
            timer.invalidate()
            time = 1500
            isTimeStarted = false
            timeLabel.text = "25:00"
            sender.setImage(UIImage(named: "play"), for: .normal)
        }

        }
//        if !isTimeStarted {
//            startTimer()
//            isTimeStarted = true
//        }
//        else{
//            timer.invalidate()
//            isTimeStarted = false
        
        
    
    
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        time -= 1
        timeLabel.text = formatTime()
    }
    
    func formatTime()-> String{
        let minutes = Int (time) / 60 % 60
        let seconds = Int (time) % 60
        return String(format: "%02i:%02i", minutes,seconds   )
    }


}

