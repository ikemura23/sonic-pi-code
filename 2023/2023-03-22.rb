use_debug false

kick_flag = 0
hat_flag = 1
cymbal_open_flag = 0

clap_flag = 0

synth1_flag = 1
synth2_flag = 0

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
      
      sleep 0.125
      sample :drum_cymbal_closed, amp: 1.2, rate: 1.7
      sleep 0.125
      sample :drum_cymbal_closed, amp: 1.5, rate: 1.1
      sleep 0.125
      sample :drum_cymbal_closed, amp: 1.2, rate: 1.7
      sleep 0.125
      
    end
    
    live_loop :cymbal_open, sync: :met do
      if cymbal_open_flag < 1 then stop end
      sleep 0.25
      sample :drum_cymbal_open, amp: 0.5, finish: 0.1, lpf: 120, rate: 1.2
      sleep 0.25
    end
    
    live_loop :snare, sync: :met do
      if clap_flag < 1 then stop end
      
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
  
  rel = 1
  sus = 3.5
  sl = 4
  
  with_fx :reverb, mix: 0.8, room: 0.7 do
    ##| with_fx :bpf, centre: 100, res: rrand(0.2, 0.5), amp: 1 do
    with_fx :lpf, cutoff: 80, amp: 1 do
      ##| with_fx :wobble, wave: 0, invert_wave: 1, phase: 10, mix: 0.2 do
      with_fx :slicer, phase: 0.5, mix: 0.3, invert_wave: 1 do
        synth :dsaw, note: chord(:g3, :m, invert: [0,-1].tick("1")), sustain: sus, release: rel, amp: 0.8, attack: 0.1
        synth :dsaw, note: chord(:g4-5, :m, invert: [-2,-4].look), sustain: sus,release: rel, amp: 0.8, attack: 0.1
        sleep sl
      end
      ##| sus = 7
      ##| with_fx :wobble, wave: 0, invert_wave: 0, phase: 10, mix: 0.2 do
      synth :dsaw, note: chord(:g3-2, :M, invert: 0), sustain: sus, release: rel, amp: 0.8, attack: 0.1
      synth :dsaw, note: chord(:g3-2-5, :M, invert: 1), sustain: sus, release: rel, amp: 0.8, attack: 0.1
      sleep sl
      ##| end
    end
  end
  ##| end
end

live_loop :synth2, sync: :met do
  ##| stop
  if synth2_flag < 1 then stop end
  rel = 0.2
  atk = 0.1
  sus = 3.5
  sl = sus
  
  with_fx :bpf, amp: 1.3 do
    with_fx :slicer, phase: 0.25, mix: 0.2, invert_wave: 1 do
      
      synth :hollow, note: chord(:g5+7, :m7, invert: 0).first, sustain: sus,release: rel, attack: atk, amp: 3
      sleep sl
      
      sus = 0.5
      synth :hollow, note: chord(:g5+7+[-5,5].tick, :m7, invert: 0).first, sustain: sus,release: rel, attack: atk, amp: 3
      sleep 0.5
    end
  end
end




## base ------------------------

live_loop :base, sync: :met do
  if base_flag < 1 then stop end
  
  use_random_seed 890 # 890 780 786 124
  sl = [0.375, 0.375, 0.375, 0.375, 0.125, 0.375,
        0.375, 0.25, 0.25, 0.25, 0.125, 0.25,0.25, 0.25]
  
  c = chord(:g1, :m, invert: 0)
  with_fx :reverb, mix: 0.5, room: 0.7, amp: 1.5 do
    with_fx :lpf, cutoff: 85 do
      sl.size.times do
        
        synth :tb303, note: c.choose, release: 0.2
        sleep sl.tick
      end
    end
  end
end

