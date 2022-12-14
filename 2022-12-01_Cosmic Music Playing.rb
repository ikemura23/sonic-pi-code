# 元 https://youtu.be/3pK2ygVcfPU?t=1077

use_bpm 62

clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"
hat_loops = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/drum_loops/LCC_hat\ loops"

kick_hat_flag = 1
hat_loops_flag = 0
safali_loops_flag = 0
clap_flag = 0

live_loop :met do
  sleep 1
end

with_fx :reverb, room: 0.2 do
  live_loop :kick, sync: :met do
    if kick_hat_flag < 1 then stop end
    sample :bd_tek, rate: 1, amp: 1.4
    sleep 0.5
  end
  
  live_loop :hat, sync: :met do
    if kick_hat_flag < 1 then stop end
    sleep 0.25
    sample :drum_cymbal_closed, amp: 0.5, cutoff: 120
    sleep 0.125
    sample :drum_cymbal_closed, amp: 0.5, cutoff: 120
    sleep 0.125
    ##| sample :drum_cymbal_closed, amp: 0.5, cutoff: 120
    ##| sleep 0.125
  end
  
  live_loop :hat_loop, sync: :met do
    if hat_loops_flag < 1 then stop end
    sample hat_loops, 7, beat_stretch: 8, cutoff: 120, start: 0, finish: 0.5, amp: 1.4
    sleep 4
  end
  
  live_loop :safali, sync: :met do
    if safali_loops_flag < 1 then stop end
    sample :loop_safari , beat_stretch: 8, amp: 3
    sleep 8
  end
  
  live_loop :clap, sync: :met do
    if clap_flag < 1 then stop end
    a = 1.3
    
    sleep 0.5
    sample clap, 1, amp: a, lpf: 120
    sleep 0.5
    
  end
end

### chorus

live_loop :chorus_1, sync: :met do
  ##| stop
  use_synth :hollow
  a = 5
  
  ##| key1 = :a5
  ##| c1 = chord(key1, :M, invert: 0)
  ##| key2 = :gb5
  ##| c2 = chord(key2, :sus2, invert: 0)
  
  sounds = [
    [:a5,:M], [:gb5,:sus2],
    [:a5,:M], [:gb5,:sus2],
    [:a5+2,:M], [:gb5,:sus2],
    [:a5+2,:M], [:gb5-2,:m9],
    [:a5+2,:M], [:gb5-5,:m9],
    [:a5+2,:M], [:gb5-2,:M],
  ]
  
  ##| key1 = :a5+2
  ##| c1 = chord(key1, :M, invert: 0)
  ##| key2 = :gb5-5
  ##| c2 = chord(key2, :m7, invert: 0)
  
  ##| with_fx :lpf, cutoff: 90 do
  ##| play c1, release: 0.5,sustain: 4, amp: a
  ##| play key1+12, release: 0.5,sustain: 4, amp: a-2
  ##| sleep 4
  
  
  sounds.size.times do |i|
    key = sounds[i].first
    tonic = sounds[i].last
    cd = chord(key, tonic, invert: 0)
    
    play cd, release: 0.5,sustain: 4, amp: a
    play key+12, release: 0.5,sustain: 4, amp: a-2
    sleep 4
    
  end
  ##| end
end

live_loop :chorus_2, sync: :met do
  ##| stop
  a = 0.9
  use_synth :saw
  
  c1 = chord(:d3, :M, invert: 1)
  c2 = chord(:e3, :sus2, invert: 1)
  
  _attack = 0.1
  with_fx :slicer, phase: 0.5, mix: 0.2, wave: 3 do
    with_fx :lpf, cutoff: 90 do
      with_fx :reverb, mix: 0.9, room: 0.7 do
        
        play chord(:d3, :M, invert: 1), release: 0.5,sustain: 4, amp: a, attack: _attack
        sleep 4
        play chord(:e3, :sus2, invert: 1), release: 0.5,sustain: 4, amp: a, attack: _attack
        sleep 4
        
      end
    end
  end
end


live_loop :mero1, sync: :met do
  stop
  a = 1.5
  use_synth :tech_saws
  
  ##| with_fx :slicer, phase: 0.5, mix: 0.2, wave: 3 do
  with_fx :lpf, cutoff: 130 do
    with_fx :reverb, mix: 0.5, room: 0.5 do
      sleep 0.5
      sleep 0.25
      play chord(:d3+7, :M, invert: 0), release: 0,sustain: 0.3, amp: a
      sleep 2-0.75
      
    end
  end
  ##| end
end


### base ###

live_loop :base, sync: :met do
  ##| stop
  use_synth :dsaw
  
  keys = [:d1, :e1]
  ##| key = :eb1
  
  sl = [0.375, 0.375, 0.375, 0.375, 0.25, 0.25,
        0.375, 0.375, 0.375, 0.375, 0.25, 0.25]
  
  
  with_fx :reverb, mix: 0.5, room: 0.5, amp: 1.7 do
    with_fx :lpf, cutoff: 100 do
      keys.size.times do |i|
        key = keys[i]
        
        sl.size.times do
          play key, release: 0.4
          sleep sl.tick
        end
        
      end
    end
  end
  
end


live_loop :mero1, sync: :met do
  ##| stop
  a = 1.5
  use_synth :tech_saws
  
  ##| with_fx :slicer, phase: 0.5, mix: 0.2, wave: 3 do
  with_fx :lpf, cutoff: 130 do
    with_fx :reverb, mix: 0.5, room: 0.5 do
      sleep 0.5
      sleep 0.25
      play chord(:d3+7, :M, invert: 0), release: 0,sustain: 0.3, amp: a
      sleep 2-0.75
      
    end
  end
  ##| end
end

live_loop :pico, sync: :met do
  stop
  a = 0.9
  with_fx :reverb, mix: 0.7, room: 0.7 do
    with_fx :wobble, phase: 0.375, wave: 0, mix: 0.4 do
      with_fx :echo, decay: 4, phase: 0.25 do
        
        c = chord(:as4, :m7, invert: [-1,0,1,2].choose)
        6.times do
          synth :piano, note: c.tick, release: 0.125, amp: a, cutoff: rrand(80, 110)
          sleep [0.375, 0.625].choose
        end
        sleep 2
        
      end
    end
  end
end