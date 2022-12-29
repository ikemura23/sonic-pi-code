# https://twitter.com/ikemura23/status/1583720321940869121

use_debug false
use_bpm 63

clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"
hat = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_hats"

kick_hat_frag = 0
clap_frag = 0

live_loop :met do
  sleep 1
end

with_fx :reverb, room: 0.2 do
  live_loop :kick, sync: :met do
    if kick_hat_frag < 1 then stop end
    a = 1.8
    28.times do
      
      ##| :bd_ada
      ##| :bd_tek
      sample :bd_ada, rate: 1, amp: a, cutoff: 130
      sleep 0.5
    end
    sleep 2
  end
  
  
  live_loop :hhc1, sync: :met do
    if kick_hat_frag < 1 then stop end
    sleep 0.25
    sample hat, 9, amp: 0.5, rate: 1.5
    sleep 0.25
    
  end
  
  live_loop :hhc2, sync: :met do
    if kick_hat_frag < 1 then stop end
    ##| sample hat, 8, amp: 0.5, rate: 1.5
    sleep 0.25
  end
  
  live_loop :hhc3, sync: :met do
    if kick_hat_frag < 1 then stop end
    ##| sample hat, 0, amp: 0.1, rate: 2
    sleep 0.125
  end
  
  live_loop :clap, sync: :met do
    if clap_frag < 1 then stop end
    
    sleep 0.5
    sample clap, 3, amp: 0.8, lpf: 120
    sleep 0.5
  end
end

live_loop :mero, sync: :met do
  use_synth :dsaw
  with_fx :lpf, cutoff: 100, amp: 1 do
    with_fx :wobble, phase: 4, mix: 0.4 do
      play chord(:gs3, :m7, invert: 0), release: 4, attack: 0.1
      ##| play chord(:gs3, :m7, invert: 3), release: 4, attack: 0.1
      sleep 4
      
      play chord(:gs3-7, :M7, invert: 0), release: 4, attack: 0.1
      ##| play chord(:gs3-7, :M7, invert: 3), release: 4, attack: 0.1
      sleep 4
    end
  end
end

with_fx :reverb, mix: 0.5, room: 0.5 do
  ##| stop
  live_loop :base, sync: :met do
    use_synth :fm
    sl = [0.25, 0.25, 0.5, 0.375, 0.375, 0.25]
    2.times do
      sl.size.times do
        ##| synth :fm, note: :gs2+3, sustain: 0.05, release: 0.2, amp: 1.5
        ##| synth :chiplead, note: :gs1+3, sustain: 0.05, release: 0.2, amp: 0.5
        sleep sl.tick
      end
    end
    2.times do
      sl.size.times do
        ##| synth :fm, note: :gs2, sustain: 0.05, release: 0.2, amp: 1.5
        ##| synth :chiplead, note: :gs1, sustain: 0.05, release: 0.2, amp: 0.5
        sleep sl.tick
      end
    end
  end
  
  live_loop :mero2, sync: :met do
    stop
    use_synth :prophet
    use_random_seed 200
    
    c = chord(:gs4+7, :m7)
    
    with_fx :reverb, mix: 0.7, room: 0.5 do
      with_fx :bpf, mix: 0.3 do
        8.times do
          play c.choose, release: 0.25, amp: 0.3
          sleep [0.125, 0.25, 0.25, 0.25, 0.5].choose
        end
      end
    end
  end
end
