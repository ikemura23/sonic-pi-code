use_debug false

kick_flag = 1
hat_flag = 1
cymbal_open_flag = 0

clap_flag = 1

synth1_flag = 1
synth2_flag = 1

mero_flag = 0

base_flag = 0

live_loop :met do
  sleep 1
end

with_fx :reverb, room: 0.2 do
  with_fx :lpf, cutoff: 100 do
    live_loop :kick, sync: :met do
      if kick_flag < 1 then stop end
      sample :bd_zum, amp: 1, lpf: 130
      sleep 0.5
    end
    
    
    live_loop :hhc, sync: :met do
      if hat_flag < 1 then stop end
      
      ##| sleep 0.125
      sample :drum_cymbal_closed, amp: 1.2, rate: 1.7
      sleep 0.125
      sleep 0.125
      sample :drum_cymbal_closed, amp: 1.2, rate: 1.7
      sleep 0.125
      sample :drum_cymbal_closed, amp: 1.2, rate: 1.7
      sleep 0.125
      
      ##| sleep 0.5
    end
    
    live_loop :cymbal_open, sync: :met do
      if cymbal_open_flag < 1 then stop end
      sleep 0.25
      sample :drum_cymbal_open, amp: 0.5, finish: 0.1, lpf: 120, rate: 1.2
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

live_loop :synth1, sync: :met do
  ##| stop
  if synth1_flag < 1 then stop end
  
  r = 4
  s = 4
  
  with_fx :reverb, mix: 0.7, room: 0.7 do
    with_fx :lpf, cutoff: 80, amp: 1 do
      with_fx :slicer, phase: 0.5, mix: 0.2, invert_wave: 1 do
        
        synth :saw, note: chord(:g3, :m7, invert: 0), sustain: r, release: 0.1, amp: 0.8, attack: 0.1
        synth :dsaw, note: chord(:d4, :m7, invert: 0), sustain: r,release: 0.1, amp: 0.8, attack: 0.1
        sleep s
        
        synth :saw, note: chord(:f3, :m7, invert: 0), sustain: r, release: 0.1, amp: 0.8, attack: 0.1
        synth :dsaw, note: chord(:c4, :m7, invert: 0), sustain: r, release: 0.1, amp: 0.8, attack: 0.1
        sleep s
        
      end
    end
  end
end

live_loop :synth2, sync: :met do
  ##| stop
  if synth2_flag < 1 then stop end
  rel = 1
  sus = 4
  sl = sus
  with_fx :slicer, phase: 0.5, mix: 0.2, invert_wave: 1 do
    
    synth :hollow, note: chord(:g3, :m7, invert: 0), sustain: sus,release: rel, amp: 3
    synth :hollow, note: chord(:d4, :m7, invert: 0), sustain: sus,release: rel, amp: 3
    sleep sl
    
    synth :hollow, note: chord(:f3, :m7, invert: 0), sustain: sus,release: rel, amp: 3
    synth :hollow, note: chord(:c4, :m7, invert: 0), sustain: sus,release: rel, amp: 3
    sleep sl
    
  end
end


live_loop :mero_random, sync: :met do
  if mero_flag < 1 then stop end
  
  use_random_seed [444, 912].tick("mero")
  
  rhythm = [
    1.5, 0.25, 1.5, 0.25, 0.25, 2,
    #0.5, 0.5, 0.25, 1
  ]
  
  with_fx :lpf, cutoff: 90, amp: 1.3 do
    use_synth :supersaw
    
    rhythm.each do |r|
      play chord(:bb4,:m7,invert: 1).choose, release: r+0.7
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
    ##| with_fx :wobble, phase: 0.25, invert_wave: 0 do
    
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
    
    ##| end
  end
end
