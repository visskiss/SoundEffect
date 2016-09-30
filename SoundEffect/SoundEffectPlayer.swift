//
//  SoundEffectPlayer.swift
//  SoundEffect
//
//  Created by Daniel Kanaan on 9/30/16.
//  Copyright © 2016 Daniel Kanaan. All rights reserved.
//

import Foundation
import AVFoundation

public let soundEffectPlayer = SoundEffectPlayer()

open class SoundEffectPlayer:NSObject {
    
    open var userDefaultsKey:String = "SoundEffect Master Volume"
    open var userDefaultsSetKey:String = "Master Volume Set"
    
    open var masterVolume:Float = 0.9 {
        didSet {
            UserDefaults.standard.set(masterVolume, forKey: userDefaultsKey)
            UserDefaults.standard.set(true, forKey: userDefaultsSetKey)
        }
    }
    
    override init () {
        super.init()
        if UserDefaults.standard.bool(forKey: userDefaultsSetKey) {
            masterVolume = UserDefaults.standard.float(forKey: userDefaultsKey)
        }
    }
    
    func play(player:AVAudioPlayer, volume:Float) {
        player.volume = volume * masterVolume
        player.play()
    }
    
}
