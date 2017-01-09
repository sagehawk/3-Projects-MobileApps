//
//  PassageClass.swift
//  Question Starter
//
//  Created by Sage Hawk on 12/19/16.
//  Copyright © 2016 Sage Hawk. All rights reserved.
//

import UIKit

class PassageClass: UIViewController {
    
    @IBOutlet weak var questionPassage: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
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
    
    var simple = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "Unpressed")
    }
    
    @IBAction func tapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        if imageView.frame.contains(sender.location(in: self.view))
        {
        
            //questionArray.simple.shuffle()
            simple.playSound()
            imageView.image = UIImage(named: "Pressed")
            let delayInSeconds = 0.1
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                
                self.imageView.image = UIImage(named: "Unpressed")
                self.questionPassage.text = self.questionArray.first
                
            }
            
        }
        
    }
}
