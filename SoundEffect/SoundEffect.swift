//
//  SoundEffect.swift
//  SoundEffect
//
//  Created by Daniel Kanaan on 3/7/16.
//  Copyright © 2016 Daniel Kanaan. All rights reserved.
//


import Foundation
import AVFoundation


public class SoundEffect {
    
    let  players:[AVAudioPlayer]
    let playersMaxIndex:UInt32
    /**
     Loads a series of sound effects with names "resourceName" and also resourceName_1, resourceName_2 etc...  
     
     returns nil if no such resources are found
     
     So for sound_effect.mp3, this will load sound_effect.mp3 and sound_effect_1.mp3, sound_effect_2.mp3 etc until no such resources exist.
     
     Parameter resourceName: sound_file.mp3 etc..
     Returns : a SoundEffect if any resources are found, otherwise nil.
    */
    public init? (resourceName:String) {
        var thePlayers = [AVAudioPlayer]()
        
        let nameOnly = (resourceName as NSString).stringByDeletingPathExtension
        let fileExt  = (resourceName as NSString).pathExtension
        
        if let url = NSBundle.mainBundle().URLForResource(nameOnly, withExtension: fileExt) {
            do {
                try thePlayers.append(AVAudioPlayer(contentsOfURL: url))
                thePlayers.last?.prepareToPlay()
            } catch {
                NSLog("Failed to initialize player with \(nameOnly).\(fileExt)")
            }
        }
        var count = 1
        repeat {
            if let url = NSBundle.mainBundle().URLForResource("\(nameOnly)_\(count)", withExtension: fileExt) {
                do {
                    try thePlayers.append(AVAudioPlayer(contentsOfURL: url))
                    thePlayers.last?.prepareToPlay()
                } catch {
                    NSLog("Failed to initialize player with \(nameOnly)_\(count).\(fileExt)")
                }
            } else {
                break
            }
            count += 1
        } while true
        if thePlayers.count < 1 {
            return nil
        }
        players = thePlayers
        playersMaxIndex = UInt32(players.count) - 1
    }
    
    /**
     Plays one of the sounds effects at random at the selected volume.
    */
    public func play(volume:Float) {
        players[Int(arc4random_uniform(playersMaxIndex))].volume = volume
        players[Int(arc4random_uniform(playersMaxIndex))].play()
    }
    
}