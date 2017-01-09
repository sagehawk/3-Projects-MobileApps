//
//  FirstViewController.swift
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
    mutating func shuffle()
    {
        for _ in 0..<10
        {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}

class FirstViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var firstWord: UILabel!
    @IBOutlet weak var secondWord: UILabel!
    
    // Arrays that will be shuffled to randomize a question
    var firstArray = ["Who", "What", "How", "Why", "Where", "When"]
    var secondArray = ["would?", "will?", "might?", "did?", "is?", "can?"]
    var playSoundClass = PlaySound()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set imageView as an unpressed button on load
        imageView.image = UIImage(named: "Unpressed")
    }
    // Tap Gesture Recognizer to use image as a button
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        // If tap gesture is found within imageView frame
        if imageView.frame.contains(sender.location(in: self.view))
        {
            //Shuffle both Array's elements
            firstArray.shuffle()
            secondArray.shuffle()
            
            //Function to play sound
            playSoundClass.playSound()
            
            //Set the imageView image as a pressed button
            imageView.image = UIImage(named: "Pressed")
            
            // Delay code within brackets to delay image reverting back to an unpressed button image
            let delayInSeconds = 0.1
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                
                self.imageView.image = UIImage(named: "Unpressed")
                
                //Set the labels as the first element found in arrays after they've been shuffled
                self.firstWord.text = self.firstArray.first
                self.secondWord.text = self.secondArray.first
                
            }
        }
        
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     let dvc = segue.destination as! ViewController
     dvc.passage = self.passage
     }*/
    }
}
