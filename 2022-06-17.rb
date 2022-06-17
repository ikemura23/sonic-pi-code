clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"
percussion = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_drum\ loops/LCKK_percussion\ loops"

use_debug false
##| use_bpm 63

live_loop :bd do
  sleep 0.5
  sample :bd_tek, cutoff: 110, amp: 1.2
end

live_loop :clap, sync: :bd do
  ##| sleep 0.5
  ##| with_fx :reverb do
  ##|   sample clap, 5, amp: 1, lpf: 110
  ##| end
  ##| sleep 0.5
  
  sleep 0.375
  with_fx :reverb do
    ##| sample clap, 0, amp: 1, lpf: 110
  end
  sleep 2-0.375
end

live_loop :cymbal , sync: :bd do
  sleep 0.125
  sample :drum_cymbal_closed, amp: [0.1, 1.5, 0.1,0.1].tick, cutoff: 120
end

live_loop :percussion, sync: :bd do
  ##| sample percussion, 19, amp: 0.5, beat_stretch: 4 #8, 10, 11, 17, 19
  sleep 4
end

#######################

live_loop :melo_loop, sync: :bd do
  s = :sine
  c = 90
  
  longMelo1 :b3, :b3, s
  shortMelo :b3, :b3, s
  longMelo1 :b3, :b3, s
  ##| longMelo2 :b3+2, :b3+4, s
  shortMelo :b3+2, :b3+2, s
end

with_fx :reverb do
  
  live_loop :base, sync: :bd do
    use_synth :fm
    _amp = 1.2
    
    play :d2+[0, -2].tick, release: 0.3, amp: _amp
    sleep 0.375
    play :d2, release: 0.3, amp: _amp
    sleep 2-0.375
  end
  
  live_loop :pico, sync: :bd do
    use_synth :sine
    use_random_seed 1000
    
    with_fx :lpf, cutoff: 70 do
      sleep 0.25
      ##| play :d6, release: 0.125, amp: 1
      sleep 0.25
      
    end
  end
end

############# define #############

with_fx :reverb, room: 0.7, mix: 0.3 do
  define :longMelo1 do | tonic1, tonic2, synth, cutoff=130 |
    use_synth synth
    
    with_fx :lpf, cutoff: cutoff do
      play chord(tonic1, :m7), decay: 0.2, release: 2, attack_level: 1.5
      sleep 2
      sleep 0.25
      play chord(tonic2, :m7), decay: 0.2, release: 2, attack_level: 1.5
      sleep 1.75
      sleep 4-1.75-2-0.25
    end
  end
  
  define :longMelo2 do | tonic1, tonic2, synth, cutoff=130 |
    use_synth synth
    
    with_fx :lpf, cutoff: cutoff do
      play chord(tonic1, :m7), decay: 0.2, release: 2, attack_level: 1.5
      sleep 1.75
      play chord(tonic2, :m7), decay: 0.2, release: 2, attack_level: 1.5
      sleep 1.75
      sleep 4-1.75*2
    end
  end
  
  define :shortMelo do | tonic1, tonic2, synth, cutoff=130|
    use_synth synth
    
    rls = 0.1
    with_fx :lpf, cutoff: cutoff do
      play chord(tonic1, :m7), decay: 0.2, release: rls, attack_level: 1.5
      sleep 1.75
      play chord(tonic2, :m7), decay: 0.2, release: rls, attack_level: 1.5
      sleep 1.75
      sleep 4-1.75*2
    end
  end
end

