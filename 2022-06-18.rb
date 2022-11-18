# output https://twitter.com/ikemura23/status/1538179652082372610

clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"
percussion = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_drum\ loops/LCKK_percussion\ loops"

##| reset_mixer!
set_mixer_control! lpf: 70, lpf_slide: 8


use_debug false


live_loop :bd do
  sleep 0.5
  ##| sample :bd_tek, cutoff: 110, amp: 1
end

live_loop :clap, sync: :bd do
  with_fx :reverb do
    
    sleep 0.375
    ##| sample clap, 5, amp: 1, lpf: 100, rate: 1
    sleep 1-0.375
    
    ##| sleep 0.5
    ##| sample clap, 1, amp: 1, lpf: 110
    ##| sleep 0.5
    
  end
  
end

live_loop :cymbal , sync: :bd do
  sleep 0.125
  sample :drum_cymbal_closed, amp: [0.1, 1.5, 0.1,0.1].tick, cutoff: 120
end

live_loop :percussion, sync: :bd do
  ##| sample percussion, 11, amp: 0.5, beat_stretch: 4 #8, 10, 11, 17, 19
  sleep 4
end

#######################

live_loop :melo_loop, sync: :bd do
  s = :tri #:tri #:saw
  c = 100
  
  melo1 :d3, :d3, s, c
  ##| melo2 :d3, :d3+2, :d3+4, s, c
end

live_loop :base_loop, sync: :bd do
  base :d2, 2, 4
end

with_fx :reverb do
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

live_loop :strings, sync: :bd do
  use_synth :hollow
  4.times do
    with_fx :slicer, phase: 0.5, wave: 1, mix: 0.4 do
      play chord(:d5+7, :m11), sustain: 4, release: 0, amp: 2
      sleep 4
    end
  end
end


############# define #############

define :melo1 do | tonic1, tonic2, synth, cutoff=130 |
  use_synth synth
  
  rls = 0.2
  with_fx :reverb, room: 0.9, mix: 0.5 do
    with_fx :lpf, cutoff: cutoff do
      play chord(tonic1, :m11), decay: 0.2, release: rls, attack_level: 1.5
      sleep 1.75
      play chord(tonic2, :m11), decay: 0.2, release: rls, attack_level: 1.5
      sleep 1.75
      sleep 4-1.75*2
    end
  end
  
end

define :melo2 do | tonic1, tonic2, tonic3, synth, cutoff=130|
  use_synth synth
  
  rls = 0.2
  with_fx :reverb, room: 0.9, mix: 0.5 do
    with_fx :lpf, cutoff: cutoff do
      play chord(tonic1, :m11), decay: 0.2, release: rls, attack_level: 1.5
      sleep 1.75
      play chord(tonic2, :m11), decay: 0.2, release: rls, attack_level: 1.5
      sleep 1
      play chord(tonic3, :m11), decay: 0.2, release: rls, attack_level: 1.5
      sleep 1
      sleep 4-1.75-2
    end
  end
end


define :base do | note, ef1=0, ef2=0 |
  with_fx :reverb do
    use_synth :fm
    _amp = 1.2
    
    play note, release: 0.3, amp: _amp, attack_level: 2
    sleep 0.375
    play note, release: 0.3, amp: _amp, attack_level: 2
    sleep 1-0.375
    
    play note, release: 0.3, amp: _amp, attack_level: 2
    sleep 0.375
    play note, release: 0.3, amp: _amp, attack_level: 2
    sleep 1-0.375
    
    play note+ef1, release: 0.3, amp: _amp, attack_level: 2
    sleep 0.375
    play note+ef1, release: 0.3, amp: _amp, attack_level: 2
    sleep 1-0.375
    
    play note+ef2, release: 0.3, amp: _amp, attack_level: 2
    sleep 0.375
    play note+ef2, release: 0.3, amp: _amp, attack_level: 2
    sleep 1-0.375
  end
end
