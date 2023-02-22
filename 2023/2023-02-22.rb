use_debug false

kick_flag = 1
hat_flag = 1
cymbal_open_flag = 1

clap_flag = 1

synth1_flag = 1
synth2_flag = 1

mero_flag = 0

base_flag = 1

live_loop :met do
  sleep 1
end

with_fx :reverb, room: 0.2 do
  live_loop :kick, sync: :met do
    if kick_flag < 1 then stop end
    16.times do |i|
      if i < 15 then
        sample :bd_tek, amp: 1, lpf: 110
        sleep 0.5
      else
        sample :bd_tek, amp: 1, lpf: 110
        sleep 0.25
        sample :bd_tek, amp: 1, lpf: 110
        sleep 0.25
      end
    end
    
  end
  
  with_fx :lpf, cutoff: 100 do
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
      a = 0.85
      co = 95
      at = 0.00
      r = 2.5
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
  
  rel = 0.2
  sus = 8
  sl = sus
  
  with_fx :reverb, mix: 0.8, room: 0.7 do
    with_fx :bpf, centre: 90, res: rrand(0.2, 0.5), amp: 1 do
      ##| with_fx :lpf, cutoff: 75, amp: 1.2 do
      with_fx :wobble, wave: 0, invert_wave: 1, phase: 10, mix: 0.2 do
        with_fx :slicer, phase: 0.5, mix: 0.2, invert_wave: 1 do
          synth :saw, note: chord(:g3, :m7, invert: 0), sustain: sus, release: rel, amp: 0.8, attack: 0.1
          synth :dsaw, note: chord(:d4, :m7, invert: [-1,0,1,2].choose), sustain: sus,release: rel, amp: 0.8, attack: 0.1
          sleep sl
        end
        ##| sus = 7
        with_fx :wobble, wave: 0, invert_wave: 0, phase: 10, mix: 0.2 do
          synth :saw, note: chord(:f3, :m7, invert: 0), sustain: sus, release: rel, amp: 0.8, attack: 0.1
          synth :dsaw, note: chord(:c4, :m7, invert: [-1,0,1,2].choose), sustain: sus, release: rel, amp: 0.8, attack: 0.1
          sleep sl
        end
      end
    end
  end
end

live_loop :synth2, sync: :met do
  ##| stop
  if synth2_flag < 1 then stop end
  rel = 0.2
  sus = 8
  sl = sus
  ##| with_fx :slicer, phase: 0.5, mix: 0.2, invert_wave: 1 do
  
  synth :hollow, note: chord(:g3, :m7, invert: 0), sustain: sus,release: rel, amp: 3
  synth :hollow, note: chord(:d4, :m7, invert: 0), sustain: sus,release: rel, amp: 3
  sleep sl
  
  ##| sus = 7
  synth :hollow, note: chord(:f3, :m7, invert: 0), sustain: sus,release: rel, amp: 3
  synth :hollow, note: chord(:c4, :m7, invert: 0), sustain: sus,release: rel, amp: 3
  sleep sl
  
  ##| end
end


live_loop :mero_random, sync: :met do
  if mero_flag < 1 then stop end
  
  use_random_seed [1234, 789, 908, 7890].tick("mero")
  
  cd1 = chord(:g4,:m7,invert: 2).shuffle
  cd2 = chord(:c4,:m7,invert: 2).shuffle
  
  sl = 0.75
  
  with_fx :lpf, cutoff: 70, amp: 1 do
    use_synth :dpulse
    
    8.times do
      play cd1.tick, release: 2
      sleep sl
    end
    sleep 8-sl*8
    8.times do
      play cd2.tick, release: 2
      sleep sl
    end
    sleep 8-sl*8
  end
  
end

## base ------------------------

live_loop :base, sync: :met do
  if base_flag < 1 then stop end
  
  use_synth :beep
  key = :c2
  amp = 2.5
  
  3.times do
    sleep 0.25*3
    play key, release: 0.1, sustain: 0.25, amp: amp
    sleep 0.25
    sleep 1
  end
  
  sleep 0.25*3
  play key, release: 0.1, sustain: 0.25, amp: amp
  sleep 0.5
  play key+2, release: 0.1, sustain: 0.5, amp: amp
  sleep 0.25
  sleep 0.5
  
end
