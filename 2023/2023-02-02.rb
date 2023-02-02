# from https://youtu.be/RRYjhJHauno

use_debug false
use_bpm 55

clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

kick_flag = 1
hat_flag = 1
hat3_flag = 1
cymbal_open_flag = 0

clap_flag = 1

mero2_flag = 0

base_flag = 1

live_loop :met do
  sleep 1
end

with_fx :reverb, room: 0.3 do
  with_fx :lpf, cutoff: 110 do
    live_loop :kick, sync: :met do
      if kick_flag < 1 then stop end
      sample :bd_tek, amp: 1.4, cutoff: 120 # :bd_fat :bd_tek
      sleep 0.5
    end
    
    live_loop :hhc2, sync: :met do
      if hat_flag < 1 then stop end
      
      sleep 0.125
      sample :drum_cymbal_closed, amp: 0.8, rate: 1
      sleep 1-0.125
    end
    
    live_loop :hhc3, sync: :met do
      if hat3_flag < 1 then stop end
      
      sleep 0.25
      sample :drum_cymbal_closed, amp: 1.5, lpf: 110
      sleep 0.25
    end
    
    live_loop :cymbal_open, sync: :met do
      if cymbal_open_flag < 1 then stop end
      sleep 0.25
      sample :drum_cymbal_open, amp: 0.25, beat_stretch: 2, finish: 0.125, hpf: 100, rate: 1.1
      sleep 0.25
    end
    
    live_loop :clap, sync: :met do
      if clap_flag < 1 then stop end
      
      4.times do |i|
        if i < 3 then
          sleep 0.5
          sample clap, 0, amp: 1, lpf: 120, rate: 1.1
          sleep 0.5
        else
          sleep 0.5
          sample clap, 0, amp: 1, lpf: 120, rate: 1.1
          sleep 0.375
          sample clap, 0, amp: 1, lpf: 120, rate: 1.1
          sleep 0.125
        end
      end
    end
  end
end

## mero ------------------------

with_fx :reverb, mix: 0.7, room: 0.7 do
  
  live_loop :mero1, sync: :met do
    r = 4
    s = 4
    
    sleep 0.25
    with_fx :lpf, cutoff: 80, amp: 1.5 do
      with_fx :slicer, phase: 0.5, mix: 0.25, invert_wave: 0 do
        synth :dsaw, note: chord(:eb3, :M7, invert: 0), release: r, amp: 0.8
        synth :sine, note: chord(:eb4, :M7, invert: -1), release: r, amp: 1
        sleep s-0.25
        
        sleep 0.25
        synth :dsaw, note: chord(:fs3, :M7, invert: 0), release: 3, amp: 0.8
        synth :sine, note: chord(:fs4, :M7, invert: -1), release: 3, amp: 1
        sleep 3-0.25
        
        sleep 0.25
        synth :dsaw, note: chord(:e3, :M7, invert: 0), release: 1, amp: 0.8
        synth :sine, note: chord(:e4, :M7, invert: -1), release: 1, amp: 1
        sleep 1-0.25
        
      end
    end
  end
end

live_loop :mero, sync: :met do
  if mero2_flag < 1 then stop end
  use_synth :beep
  
  use_random_seed 123456789 #23451 #9879
  
  with_fx :lpf, cutoff: 100, amp: 1 do
    4.times do
      
      play scale(:bb4, :major, num_octaves: 2).choose, release: 2
      sleep 0.75
    end
    sleep 5-0.75*4
    
    use_synth :blade # beep :blade
    4.times do
      play scale(:bb3+3, :major, num_octaves: 2).choose, release: 1.5
      sleep 0.25
    end
    
    sleep 2
  end
end

## base ------------------------

live_loop :base, sync: :met do
  if base_flag < 1 then stop end
  
  key = :bb1+[0,0,3,3].tick
  
  with_fx :lpf, cutoff: 70, amp: 1 do
    use_synth :dsaw
    ##| with_fx :wobble, phase: 0.25, invert_wave: 0 do
    sleep 0.25
    play key, release: 0, sustain: 0.25
    sleep 0.25
    sleep 1.25
    play key, release: 0, sustain: 0.25
    sleep 0.25
  end
  ##| end
end
