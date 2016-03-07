//
//  SoundEffect.swift
//  SoundEffect
//
//  Created by Daniel Kanaan on 3/7/16.
//  Copyright © 2016 Daniel Kanaan. All rights reserved.
//


import Foundation
import AVFoundation


class SoundEffect {
    
    var players:[AVAudioPlayer]
    
    init? (resourceName:String) {
        let nameOnly = resourceName.stringByDeletingPathExtension
        let fileExt  = resourceName.pathExtension
        
        if
    }
}