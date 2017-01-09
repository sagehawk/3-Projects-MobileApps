//
//  SecondViewController.swift
//  Question Starter
//
//  Created by Sage Hawk on 12/20/16.
//  Copyright © 2016 Sage Hawk. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation

extension Array
{
    // Randomizes the order of an array's elements.
    mutating func shuffle2()
    {
        for _ in 0..<10
        {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}
class SecondViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var passage: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set imageView as an unpressed button on load
        imageView.image = UIImage(named: "Unpressed")
    }
    
    var playSoundClass = PlaySound()
    
    // Array with advanced questions
    var questionArray = ["How did………feel about………?",
                         "What caused ………to………?",
                         "When………happened, why did………?",
                         "In this story, what does………mean?",
                         "From the story, how might………be described?",
                         "Why did the author………?",
                         "How might the story have ended differently if ………?",
                         "Would it be better if………?",
                         "What do you think will happen next?",
                         "How would you have felt if you were………?",
                         "Why do you think that………did………?",
                         "Was it fair when………?",
                         "Have you ever………?",
                         "If you were………, how would you………?",
                         "How many ways can you think of to………?",
                         "Based on what you read about ……… and ………, what can you say about………?"]
    

    // Tap Gesture Recognizer to use image as a button
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        if imageView.frame.contains(sender.location(in: self.view))
        {
            
            //Shuffle Array's elements
            questionArray.shuffle2()
            playSoundClass.playSound()
            imageView.image = UIImage(named: "Pressed")
            let delayInSeconds = 0.1
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                
                self.imageView.image = UIImage(named: "Unpressed")
                self.passage.text = self.questionArray.first
                
            }
            
        }
    }
        
        
    }
