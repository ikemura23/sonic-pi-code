clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"
percussion = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_drum\ loops/LCKK_percussion\ loops"

##| reset_mixer!
set_mixer_control! lpf: 70, lpf_slide: 4

use_debug false
use_bpm 63


live_loop :bd do
  sleep 0.5
  ##| sample :bd_tek, cutoff: 110, amp: 1
end

live_loop :clap, sync: :bd do
  with_fx :reverb do
    
    sleep 0.5
    ##| sample clap, 6, amp: 1, lpf: 100
    sleep 0.5
    
  end
end

live_loop :cymbal , sync: :bd do
  stop
  sleep 0.125
  sample :drum_cymbal_closed, amp: [0.1, 1.5, 0.1,0.1].tick, cutoff: 120
end

live_loop :percussion, sync: :bd do
  sample percussion, 7, amp: 0.5, beat_stretch: 4, start: 0, finish: 0.5 #8, 10, 11,  19
  sleep 2
end

#######################

live_loop :melo_loop, sync: :bd do
  s = :sine #:tri #:saw
  c = 90
  
  melo3 s, :c3
  ##| melo4 s, :c3
  
  ##| melo1 :f3, :g3, s, c
  ##| melo2 :c3, :d3, :e3, s, c
end

live_loop :base_loop, sync: :bd do
  base :c3-7
  ##| base :c3-7, 7
  
  ##| base :f2
  ##| base :f2+2
  ##| base :c3
  ##| base :c3, -7
end


############# define #############

define :melo1 do | tonic1, tonic2, synth, cutoff=130 |
  use_synth synth
  use_synth_defaults decay: 0.2, release: 1.8, attack_level: 1.5, cutoff: cutoff
  
  with_fx :reverb, room: 0.9, mix: 0.3 do
    with_fx :slicer, phase: 0.5, wave: 3, mix: 0.7 do
      
      play chord(tonic1, :m7)
      sleep 1.75
      play chord(tonic2, :m7)
      sleep 1.75
      sleep 4-1.75*2
    end
  end
  
end

define :melo2 do | tonic1, tonic2, tonic3, synth, cutoff=130|
  use_synth synth
  use_synth_defaults decay: 0.2, release: 1.5, attack_level: 1.5, cutoff: cutoff
  
  rls = 0.7
  with_fx :reverb, room: 0.9, mix: 0.3 do
    with_fx :slicer, phase: 0.5, wave: 3, mix: 0.7 do
      play chord(tonic1, :m11)
      sleep 1.75
      play chord(tonic2, :m7)
      sleep 1
      play chord(tonic3, :m7)
      sleep 1
      sleep 4-1.75-2
    end
  end
end

define :melo3 do | synth=:sine, tonic |
  use_synth synth
  with_fx :slicer, phase: 0.5, wave: 3, mix: 0.6 do
    play chord(tonic, :m11), release: 3.5, amp: 1.2
    sleep 4
  end
end

define :melo4 do | synth=:sine, tonic |
  use_synth synth
  
  with_fx :slicer, phase: 0.5, wave: 3, mix: 0.6 do
    play chord(tonic, :m11), release: 3.5, amp: 1.2
    sleep 3.5
  end
  play chord(tonic+7, :m11).last, release: 0.2, amp: 0.3
  sleep 0.25
  play chord(tonic+5, :m11).last, release: 0.2, amp: 0.3
  sleep 0.25
end

## base
define :base do | note, ef=0|
  with_fx :reverb do
    use_synth :fm
    use_synth_defaults release: 0.3, amp: 1.2, attack_level: 2
    
    play note
    sleep 0.5
    play note
    sleep 0.375
    play note+ef
    sleep 1-0.5-0.375
    
    sleep 0.25
    play note+ef
    sleep 0.5
    play note+ef
    sleep 0.25
  end
end
