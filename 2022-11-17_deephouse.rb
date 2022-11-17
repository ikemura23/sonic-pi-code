# output https://twitter.com/ikemura23/status/1593244790308884481

use_debug false
use_bpm 62

clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"
hat = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_hats"
hat_loops = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_drum\ loops/LCKK_hat\ loops"
kick_loops = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_kicks"


kick_hat_frag = 1
clap_frag = 1

ef = 0
code_name = :m9

live_loop :met do
  sleep 1
end

with_fx :reverb, room: 0.2 do
  live_loop :kick, sync: :met do
    if kick_hat_frag < 1 then stop end
    sample :bd_tek, amp: 1.1
    ##| sample kick_loops, 0, rate: 1, amp: 1.1, cutoff: 110
    sleep 0.5
  end
  
  live_loop :hat, sync: :met do
    if kick_hat_frag < 1 then stop end
    sample hat_loops, 3, beat_stretch: 4, cutoff: 120, amp: 0.9
    sleep 4
  end
  
  
  
  live_loop :clap, sync: :met do
    if clap_frag < 1 then stop end
    sleep 0.5
    sample clap, 5, amp: 1.1, lpf: 120
    sleep 0.5
  end
end

live_loop :base, sync: :met do
  stop
  use_random_seed 100 #10 100
  sl = [0.25, 0.25, 0.25, 0.25, 0.375].shuffle
  
  c = chord(:g1+ef, code_name, invert: -1)
  with_fx :reverb, mix: 0.5, room: 0.5, amp: 1.4 do
    with_fx :lpf, cutoff: 70 do
      sl.size.times do
        
        synth :dsaw, note: c.choose, sustain: 0.125, release: 0
        sleep sl.tick
      end
      
      sleep 2-sl.sum-0.25
      synth :dsaw, note: c.choose, sustain: 0.125, release: 0
      sleep 0.125
      synth :dsaw, note: c.choose, sustain: 0.125, release: 0
      sleep 0.125
    end
  end
end

live_loop :mero, sync: :met do
  ##| stop
  ##| sleep 3
  with_fx :reverb, room: 0.5, mix: 0.5 do
    with_fx :slicer, phase: 0.5, mix: 0.1 do
      ##| synth :hollow, note: chord(:g3, :m11, invert: 2), release: 2, sustain: 0, cutoff: 130, amp: 5, attack: 0.25
      synth :sine, note: chord(:g3+ef, code_name, invert: 1), release: 1.5, sustain: 0, cutoff: 130, amp: 1.4, attack: 0.25
    end
  end
  sleep 2
end

live_loop :mero2, sync: :met do
  ##| stop
  
  synth :hollow, note: chord(:g3+ef, code_name, invert: 0), release: 0.5, sustain: 8, amp: 2.5
  sleep 8
end

live_loop :mero3, sync: :met do
  stop
  with_fx :reverb, mix: 0.7, room: 0.7 do
    with_fx :wobble, phase: 0.375, wave: 0, mix: 0.4 do
      with_fx :echo, decay: 4, phase: 0.375 do
        sleep 1
        c = chord(:g4+ef, code_name, invert: [-1,0,0,1,2].choose)
        synth :dsaw, note: c, release: 0.125, amp: 1.2, cutoff: rrand(80, 110)
        ##| sleep 0.25
        ##| synth :prophet, note: c.choose, release: 0.125, amp: 0.8, cutoff: rrand(80, 110)
        sleep 3
        
      end
    end
  end
end

live_loop :ambient, sync: :met do
  stop
  sleep 0.5
  with_fx :reverb, mix: 0.5, room: 0.5 do
    with_fx :slicer, phase: 0.5 do
      sample :ambi_sauna, start: 0.125, finish: 0.9, attack: 0.125, beat_stretch: 8
      sleep 8-0.5
    end
  end
end
