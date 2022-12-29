# output https://twitter.com/ikemura23/status/1595195334321655808

use_bpm 60

clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"
hat_loops = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/drum_loops/LCC_hat\ loops"

kick_hat_flag = 0
hat_loops_flag = 1
safali_loops_flag = 1
clap_flag = 0

live_loop :met do
  sleep 1
end

with_fx :reverb, room: 0.2 do
  live_loop :kick, sync: :met do
    if kick_hat_flag < 1 then stop end
    sample :bd_tek, rate: 1, amp: 1.3
    sleep 0.5
  end
  
  live_loop :hat, sync: :met do
    if kick_hat_flag < 1 then stop end
    sample :drum_cymbal_closed, amp: 0.5, cutoff: 120
    sleep 0.25
  end
  
  live_loop :hat_loop, sync: :met do
    if hat_loops_flag < 1 then stop end
    sample hat_loops, 7, beat_stretch: 8, cutoff: 130, amp: 1.4
    sleep 4
  end
  
  live_loop :safali, sync: :met do
    if safali_loops_flag < 1 then stop end
    sample :loop_safari , beat_stretch: 8, amp: 3
    sleep 8
  end
  
  live_loop :clap, sync: :met do
    if clap_flag < 1 then stop end
    a = 1.2
    
    sleep 0.5
    sample clap, 1, amp: a, lpf: 120
    sleep 0.5
    
    ##| sleep 0.125
    ##| sample clap, 1, amp: a, lpf: 120
    ##| sleep 0.375
    ##| sample clap, 1, amp: a, lpf: 120
    ##| sleep 1-0.375-0.125
    
    ##| sleep 0.5
    ##| sample clap, 1, amp: a, lpf: 120
    ##| sleep 0.5
    
    ##| sleep 0.125
    ##| sample clap, 1, amp: a, lpf: 120
    ##| sleep 0.375
    
    ##| sample clap, 1, amp: a, lpf: 120
    ##| sleep 0.25
    ##| sample clap, 1, amp: a, lpf: 120
    ##| sleep 0.125
    ##| sample clap, 1, amp: a, lpf: 120
    ##| sleep 0.125
    
    sleep 1-0.375-0.25-0.125*3
  end
end

live_loop :mero, sync: :met do
  stop
  use_synth :rodeo
  
  key = :as3
  keys = [
    key, key+2, key+5, key+7, key+5, key+2,
    key+5, key+2, key, key+2, key, key-5
  ]
  
  sl = [0.75, 0.75, 0.5].ring
  
  keys.size.times do
    play chord(keys.tick, :m7), release: 0, sustain: sl.look, amp: 1.5
    sleep sl.look
  end
end

live_loop :mero2, sync: :met do
  stop
  a = 2
  use_synth :dsaw
  key = :as3
  with_fx :lpf, cutoff: 100 do
    
    sl = [0.75, 0.75, 0.5].ring
    keys = [
      key, key+2, key+5, key+7, key+5, key+2,
      key+5, key+2, key, key+2, key, key-5
    ]
    
    keys.size.times do
      key = keys.tick
      play chord(key, :m7), release: 0.75, amp: a
      play chord(key-12, :m7, invert: -1), release: 0.75, amp: a
      sleep sl.look
    end
    
  end
end

live_loop :base, sync: :met do
  ##| stop
  use_synth :dsaw
  
  key = :as1-7
  keys = [
    key, key+7, key+12, key+7, key+10, key+7,
    key, key+7, key+14, key+7, key+12, key+7
  ]
  
  sl = [0.375, 0.375, 0.375, 0.375, 0.25, 0.25].ring
  
  with_fx :reverb, mix: 0.5, room: 0.5, amp: 1.7 do
    with_fx :lpf, cutoff: 80 do
      keys.size.times do
        play keys.tick, sustain: sl.look, release: 0
        sleep sl.look
      end
    end
  end
end

live_loop :pico, sync: :met do
  stop
  a = 0.9
  with_fx :reverb, mix: 0.7, room: 0.7 do
    with_fx :wobble, phase: 0.375, wave: 0, mix: 0.4 do
      with_fx :echo, decay: 4, phase: 0.25 do
        
        c = chord(:as4, :m7, invert: [-1,0,1,2,3].choose)
        4.times do
          synth :dpulse, note: c.tick, release: 0.125, amp: a, cutoff: rrand(80, 110)
          sleep 0.375
        end
        sleep 3
        
      end
    end
  end
end
