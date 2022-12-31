# https://twitter.com/ikemura23/status/1609192963220930560

use_debug false
use_bpm 62

clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"
hat = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_hats"

kick_flag = 1
hat_flag = 0

clap_flag = 0
clap2_flag = 0

mero1_flag = 0
mero2_flag = 0

live_loop :met do
  sleep 1
end

with_fx :reverb, room: 0.3 do
  live_loop :kick, sync: :met do
    if kick_flag < 1 then stop end
    sample :bd_tek, amp: 1.2, cutoff: 90
    sleep 0.5
  end
  
  live_loop :hhc1, sync: :met do
    if hat_flag < 1 then stop end
    sleep 0.25
    sample hat, 15, amp: 0.5#, rate: 1.5
    sleep 0.25
    
  end
  
  live_loop :hhc2, sync: :met do
    if hat_flag < 1 then stop end
    sleep 0.125
    
    3.times do
      sample hat, 14, amp: 0.5, rate: 1.5
      sleep 0.125
    end
    
  end
  
  
  live_loop :clap, sync: :met do
    if clap_flag < 1 then stop end
    
    sleep 0.5
    sample clap, 1, amp: 0.8, lpf: 120, rate: 0.8
    sleep 0.5
  end
  
  
  live_loop :clap2, sync: :met do
    if clap2_flag < 1 then stop end
    
    sleep 0.125
    3.times do
      sample clap, 2, amp: 0.8, cutoff: 120, rate: 1.5
      sleep 0.125
    end
    
  end
end


live_loop :mero1, sync: :met do
  if mero1_flag < 1 then stop end
  use_synth :tri #:subpulse
  cd = chord(:gb4, :m7).shuffle
  sleep 0.25
  with_fx :reverb, room: 0.5, mix: 0.7 do
    
    cd.size.times do
      play cd.tick, release: 2, cutoff: 130, amp: 0.7
      sleep 0.25
    end
    ##| end
  end
  
  sleep 4-0.25*cd.size-0.25
end

live_loop :mero2, sync: :met do
  if mero2_flag < 1 then stop end
  
  use_synth :chiplead
  cd = chord(:gb4-5, :m7).shuffle
  sleep 2
  with_fx :reverb, room: 0.5, mix: 0.7 do
    tick_reset
    
    with_fx :bpf, centre: 110 do
      3.times do
        play cd.tick, release: 2, cutoff: 130, amp: 1.2
        sleep 0.25
      end
    end
  end
  sleep  4-0.25*3-2
end


live_loop :mero3, sync: :met do
  sl = [0.5,0.375,0.375,0.375, 0.25, 0.375, 0.375, 0.375, 0.375, 0.25, 0.375]
  
  ef = [2,2,4,0,0,7,7,7,5,7,
        9,9,9,7,5,5,2,7,2,2,0].ring
  
  with_fx :reverb, mix: 0.6, room: 0.6 do
    
    sl.size.times do
      n = :gb3
      c = chord(n+ef.look, :m7, invert: 2)
      
      synth :square, note: chord(n+ef.look, :m7, invert: 0), sustain: 0.26, release: 0.2, attack: 0.04, amp: 0.5
      
      ##| synth :fm, note: c.first-24, sustain: 0.26, release: 0.2, attack: 0.04, amp: 1
      
      with_fx :bitcrusher do
        chord(n+ef.look+7, :m7, invert: 1)
        synth :beep, note: c, release: 0.4, attack: 0.02, amp: 1
      end
      sleep sl.tick
      
    end
  end
end
