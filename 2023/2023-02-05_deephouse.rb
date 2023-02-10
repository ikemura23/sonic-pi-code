#output https://twitter.com/ikemura23/status/1622000214445002752
use_debug false
use_bpm 57

clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

kick_flag = 0
hat_flag = 1
cymbal_open_flag = 0

clap_flag = 1

strings1_flag = 1
strings2_flag = 0

mero_flag = 0

##| base_flag = 0

live_loop :met do
  sleep 1
end

with_fx :reverb, room: 0.4 do
  with_fx :lpf, cutoff: 100 do
    live_loop :kick, sync: :met do
      if kick_flag < 1 then stop end
      sample :bd_zum, amp: 1, cutoff: 100
      sleep 0.5
    end
    
    
    live_loop :hhc3, sync: :met do
      if hat_flag < 1 then stop end
      
      sleep 0.25
      sample :drum_cymbal_closed, amp: 2, lpf: 100
      sleep 0.25
    end
    
    live_loop :cymbal_open, sync: :met do
      if cymbal_open_flag < 1 then stop end
      sleep 0.25
      sample :drum_cymbal_open, amp: 0.3, finish: 0.125, lpf: 110, rate: 1.2
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
  live_loop :strings1, sync: :met do
    if strings1_flag < 1 then stop end
    ##| stop
    r = 8
    s = 8
    
    with_fx :lpf, cutoff: 70, amp: 1.3 do
      with_fx :slicer, phase: 1, mix: 0.1, invert_wave: 0 do
        
        synth :dsaw, note: chord(:e3, :m7, invert: 0), sustain: r, release: 0.1, amp: 0.8
        synth :sine, note: chord(:e4, :m7, invert: -1), sustain: r,release: 0.1, amp: 1
        sleep s
        
        synth :dsaw, note: chord(:d3, :M7, invert: 0), sustain: r/2, release: 0.1, amp: 0.8
        synth :sine, note: chord(:d4, :M7, invert: -1), release: r/2, release: 0.1, amp: 1
        sleep s/2
        
        
        synth :dsaw, note: chord(:d3, :M, invert: 0), sustain: r/2, release: 0.1, amp: 0.8
        synth :sine, note: chord(:d4, :M, invert: -1), release: r/2, release: 0.1, amp: 1
        sleep s/2
        
      end
    end
  end
end

live_loop :strings2, sync: :met do
  if strings2_flag < 1 then stop end
  sleeps = [8,4,4]
  keys = [:g3, :fs3, :fs3]
  tonics = [:M7, :m7, :m]
  
  3.times do |i|
    synth :hollow, note: chord(keys[i], tonics[i], invert: 3), sustain: sleeps[i], release: 0.1, amp: 3
    synth :hollow, note: chord(keys[i], tonics[i], invert: 0), sustain: sleeps[i], release: 0.1, amp: 3
    sleep sleeps[i]
  end
end

live_loop :mero, sync: :met do
  if mero_flag < 1 then stop end
  
  use_random_seed 6000 #6000 6001 6004 6005 6080
  
  rhythm = [1.5, 0.25, 1.5, 0.25, 0.25, 2, 0.5, 0.5, 0.25, 1]
  
  with_fx :lpf, cutoff: 90, amp: 1.6 do
    use_synth :blade
    
    rhythm.each do |r|
      play scale(:fs3, :minor_pentatonic, num_octaves: 2).choose, release: r+0.7
      sleep r
    end
    
    rhythm.each do |r|
      play scale(:fs4, :minor_pentatonic, num_octaves: 1).choose, release: r+0.7
      sleep r
    end
    
  end
end

## base ------------------------

##| live_loop :base, sync: :met do
##|   if base_flag < 1 then stop end

##|   key = [:g1, :fs1]

##|   with_fx :lpf, cutoff: 70, amp: 1 do
##|     use_synth :dsaw
##|     ##| with_fx :wobble, phase: 0.25, invert_wave: 0 do
##|     sleep 0.25
##|     play key, release: 0, sustain: 0.25
##|     sleep 0.25
##|     sleep 1.25
##|     play key, release: 0, sustain: 0.25
##|     sleep 0.25
##|   end
##|   ##| end
##| end
