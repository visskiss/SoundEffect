# SoundEffect
This is a sound effect framework that can load a series of sounds for each "effect" and playback a random sound at a requested volume.

When provided with a string "identifier" such as "sound.m4a" it will search for all the resources with a name like "sound.m4a", "sound_1.m4a", "sound_2.m4a" until it reaches a resource that doesn't exist.  It will use those sounds at random when the sound effect is played. This is useful for non-repetitive sounding effects.

It uses the AVAudioPlayer which has known issues with latency.  HOWEVER, I have attempted to remove this issue by using the "prepare for playing" method, and also using the delegate to prepare the sound again upon completion.  This works most but not all of the time.
