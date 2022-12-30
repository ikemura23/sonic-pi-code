# output https://twitter.com/ikemura23/status/1587477412279091200

use_debug false
use_bpm 64

clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"
hat = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_hats"

clap_flag = 1
splash_flag = 0

mero1_flag = 1

hard_flag = false
mero5_flag = 0

live_loop :met do
  sleep 1
end

# drum ------------------------

with_fx :reverb, room: 0.2 do
  live_loop :kick, sync: :met do
    a = 1.8
    32.times do |i|
      if i >= 28 then
        sample :bd_ada, rate: 1, amp: a, cutoff: 130
      else
        sample :bd_tek, rate: 1, amp: a, cutoff: 130
      end
      sleep 0.5
    end
  end
  
  live_loop :hhc1, sync: :met do
    
    sleep 0.25
    sample hat, 9, amp: 0.5, rate: 1.5
    sleep 0.25
    
  end
  
  ##| live_loop :hhc2, sync: :met do
  ##|   sample hat, 8, amp: 0.5, rate: 1.5
  ##|   sleep 0.25
  ##| end
  
  live_loop :hhc3, sync: :met do
    
    sample hat, 0, amp: 0.5, rate: 2
    sleep 0.125
  end
  
  
  live_loop :hh2, sync: :met do
    with_fx :hpf, cutoff: 100 do
      sleep 0.25
      sample :drum_cymbal_open, cutoff: 130, start: 0.01, finish: 0.2, amp: 0.8 if hard_flag
      sleep 0.25
    end
  end
  
  live_loop :clap, sync: :met do
    if clap_flag < 1 then stop end
    
    sleep 0.5
    sample clap, 0, amp: 0.8, lpf: 120
    sleep 0.5
  end
  
  live_loop :splash, sync: :met do
    if splash_flag < 1 then stop end
    sample :drum_splash_soft ,amp: 1, cutoff: 120
    sleep 16
  end
end

# base -------------------

with_fx :reverb, mix: 0.5, room: 0.5 do
  live_loop :base, sync: :met do
    
    ##| 0.25, 0.25, 0.5, 0.375, 0.375, 0.25
    sl = [0.25, 0.25, 0.5, 0.125, 0.25, 0.625]
    
    ##| 2.times do
    sl.size.times do |i|
      ef = 0
      if i > 2 then ef=-2 end
      synth :fm, note: :f2+ef,  release: 0.4, amp: 1.5, cutoff: 100, attack_level: 1
      sleep sl.tick
    end
    sleep 2-sl.sum
  end
  
  # mero -----------------
  
  live_loop :mero1, sync: :met do
    if mero1_flag < 1 then stop end
    use_synth :sine
    
    with_fx :wobble, phase: 4, mix: 0.4 do
      sleep 2.75
      play chord(:f3+[0,7].choose, :m9, invert: [-1,0,1,2,3].choose), release: 6,  amp: 0.6
      sleep 10-2.75
    end
  end
  
  live_loop :mero2, sync: :met do
    if hard_flag then stop end
    use_synth :prophet
    use_random_seed 200
    
    c = chord(:f4+7, :m7)
    
    with_fx :echo, phase: 0.5, decay: 4 do
      with_fx :bpf, mix: 0.8 do
        4.times do
          play c.choose, release: 0.25, amp: 0.3
          sleep 0.125
        end
        sleep 3.5
      end
    end
  end
  
  live_loop :mero3, sync: :met do
    if hard_flag then stop end
    ##| stop
    use_synth :pulse
    
    with_fx :wobble, phase: 1 do
      sl = [0.5, 0.25, 0.25, 0.5] #0.5, 0.625, 0.125, 0.5
      sl.size.times do |i|
        ef = 0
        if i > 2 then ef=2 end
        play :f3+5+ef,  release: 0.1, amp: 0.5, cutoff: 100
        sleep sl.tick
      end
      sleep 2-sl.sum
    end
    
    with_fx :wobble, phase: 1 do
      sl = [0.375, 0.375, 0.25, 0.25] #0.5, 0.625, 0.125, 0.5
      sl.size.times do |i|
        ef = 0
        if i > 2 then ef=2 end
        play :f3+5+ef,  release: 0.1, amp: 0.5, cutoff: 100
        sleep sl.tick
      end
      sleep 2-sl.sum
    end
  end
  
  live_loop :mero4, sync: :met do
    if !hard_flag then stop end
    use_synth :dsaw
    a = 0.5
    sl = [0.5, 0.25, 0.125, 0.375, 0.5]
    ef = [3, 0, 5, 8, 11, 14, 17]
    
    sl.size.times do |i|
      ##| ef = 0
      ##| if i > 2 then ef=2 end
      play chord(:f3+ef[i], :m9), sustain: 0.2, release: 0.05, amp: a
      play chord(:f3+ef[i], :m9, invert: -3), sustain: 0.2, release: 0.05, amp: a
      sleep sl.tick
    end
    
    sleep 2-sl.sum
  end
  
  live_loop :mero5 , sync: :met do
    if mero5_flag < 1 then stop end
    
    use_synth :supersaw
    slide = 16
    
    with_fx :echo, mix: 0.2 do
      ##| with_fx :slicer, phase: 0.25, wave: 3, mix: 0.5 do
      play :fs3, sustain: slide, release: 0.05, note_slide: slide, amp: 0.3 do |s|
        control s, note: :fs5
      end
    end
    ##| end
    sleep slide
  end
end