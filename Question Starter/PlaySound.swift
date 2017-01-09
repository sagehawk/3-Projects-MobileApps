//
//  PlaySound.swift
//  Question Starter
//
//  Created by Sage Hawk on 12/20/16.
//  Copyright © 2016 Sage Hawk. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySound: NSObject {
    
    //var playSoundClass = PlaySound()
    
    var player: AVAudioPlayer?
    
    //Functions
    func playSound() {
        let url = Bundle.main.url(forResource: "buttonSound", withExtension: "mp3")!
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            
            player.prepareToPlay()
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }

}
