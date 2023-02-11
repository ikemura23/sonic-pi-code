use_debug false

kick_flag = 1
hat_flag = 0
cymbal_open_flag = 0

clap_flag = 1

strings1_flag = 0
strings2_flag = 1

mero_flag = 0

base_flag = 1

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
      sample :drum_cymbal_open, amp: 0.5, finish: 0.25, lpf: 120, rate: 1.1
      sleep 0.25
    end
    
    live_loop :snare, sync: :met do
      if clap_flag < 1 then stop end
      
      ##| stop
      a = 0.75
      co = 110
      at = 0.00
      r = 3
      sleep 0.5
      sample :sn_generic, rate: r+1, cutoff: co, amp: a, attack: at
      sample :sn_generic, rate: r, start: 0.02, cutoff: co, pan: 0.2, amp: a, attack: at
      sleep 0.5
    end
  end
end

## mero ------------------------

live_loop :strings1, sync: :met do
  if strings1_flag < 1 then stop end
  
  r = 4
  s = 4
  
  with_fx :reverb, mix: 0.7, room: 0.7 do
    with_fx :lpf, cutoff: 80, amp: 1 do
      with_fx :slicer, phase: 1, mix: 0.2, invert_wave: 0 do
        
        synth :dsaw, note: chord(:fs3, :M7, invert: 0), sustain: r, release: 0.1, amp: 0.8
        ##| synth :sine, note: chord(:fs2, :M7, invert: -1), sustain: r,release: 0.1, amp: 1
        sleep s
        
        synth :dsaw, note: chord(:f3, :m7, invert: 0), sustain: r/2, release: 0.1, amp: 0.8
        ##| synth :sine, note: chord(:f2, :m7, invert: -1), release: r/2, release: 0.1, amp: 1
        sleep s/2
        
        
        synth :dsaw, note: chord(:f3, :m, invert: 0), sustain: r/2, release: 0.1, amp: 0.8
        ##| synth :sine, note: chord(:f2, :m, invert: -1), release: r/2, release: 0.1, amp: 1
        sleep s/2
        
      end
    end
  end
end

live_loop :strings2, sync: :met do
  ##| stop
  if strings2_flag < 1 then stop end
  sleeps = [4,2,2]
  keys = [:fs3, :f3, :f3]
  tonics = [:M7, :m7, :m]
  a = 2.5
  3.times do |i|
    synth :hollow, note: chord(keys[i], tonics[i], invert: 3), sustain: sleeps[i], release: 0.1, amp: a
    synth :hollow, note: chord(keys[i], tonics[i], invert: 0), sustain: sleeps[i], release: 0.1, amp: a
    sleep sleeps[i]
  end
end

live_loop :mero, sync: :met do
  if mero_flag < 1 then stop end
  
  use_random_seed [5333, 8000].tick("mero")
  
  rhythm = [
    1.5, 0.25, 1.5, 0.25, 0.25, 2,
    #0.5, 0.5, 0.25, 1
  ]
  
  with_fx :lpf, cutoff: 90, amp: 1.3 do
    use_synth :supersaw
    
    rhythm.each do |r|
      play chord(:bb4,:m7,invert: 2).choose, release: r+0.7
      sleep r
    end
  end
  sleep 8-rhythm.sum
end

## base ------------------------

live_loop :base, sync: :met do
  if base_flag < 1 then stop end
  
  key = [
    :fs2, :ds2, :as1, :cs2,
    :fs2, :ds2, :as1, :ab1,
  ]
  
  with_fx :lpf, cutoff: 80, amp: 1.2 do
    use_synth :dsaw
    with_fx :wobble, phase: 0.25, invert_wave: 0 do
      
      sleep 0.125
      play key.tick, release: 0.2, sustain: 0.1
      sleep 0.25
      play key.look, release: 0.2, sustain: 0.1
      sleep 0.125
      sleep 0.25
      
      play key.look, release: 0.2, sustain: 0.1
      sleep 0.25
      
      sleep 0.25
      play key.look, release: 0.2, sustain: 0.1
      sleep 0.25
      
      sleep 0.25
      play key.look, release: 0.2, sustain: 0.1
      sleep 0.25
      
    end
  end
end
