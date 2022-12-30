#output https://twitter.com/ikemura23/status/1586189663823273984

use_debug false
use_bpm 65

clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"
hat = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_hats"

kick_hat_frag = 1
clap_frag = 1

live_loop :met do
  sleep 1
end

with_fx :reverb, room: 0.2 do
  live_loop :kick, sync: :met do
    if kick_hat_frag < 1 then stop end
    a = 1.8
    ##| 28.times do
    
    
    ##| sample :bd_tek, rate: 1, amp: a, cutoff: 130
    sleep 0.5
    ##| end
    ##| sleep 2
  end
  
  
  live_loop :hhc1, sync: :met do
    if kick_hat_frag < 1 then stop end
    ##| 28.times do
    sleep 0.25
    sample hat, 9, amp: 0.5, rate: 1.5
    sleep 0.25
    ##| end
    ##| sleep 2
  end
  
  live_loop :hhc2, sync: :met do
    if kick_hat_frag < 1 then stop end
    ##| 56.times do
    sample hat, 8, amp: 0.5, rate: 1.5
    sleep 0.25
    ##| end
    ##| sleep 2
  end
  
  live_loop :hhc3, sync: :met do
    if kick_hat_frag < 1 then stop end
    ##| 116.times do
    sample hat, 0, amp: 0.1, rate: 2
    sleep 0.125
    ##| end
    ##| sleep 2
  end
  
  live_loop :clap, sync: :met do
    if clap_frag < 1 then stop end
    14.times do
      sleep 0.5
      sample clap, 3, amp: 0.8, lpf: 120
      sleep 0.5
    end
  end
end

live_loop :kick, sync: :met do
  ##| if kick_hat_frag < 1 then stop end
  a = 1.8
  ##| 28.times do
  
  sample :bd_tek, rate: 1, amp: a, cutoff: 130
  sleep 0.5
  ##| end
  ##| sleep 2
end

live_loop :base, sync: :met do
  
  use_random_seed 300 #200, 2000, 100
  ##| 0.25, 0.25, 0.5, 0.375, 0.375, 0.25
  sl = [0.25, 0.125, 0.125, 0.125, 0.375,0.25]
  ##| 2.times do
  sc = (scale :gs1, :minor_pentatonic, num_octaves: 2).ring
  ##| sc = chord(:gs2, :M7)
  sc.size.times do
    synth :dpulse, note: sc.choose, sustain: 0.05, release: 0.2, amp: 1
    synth :chiplead, note: :gs1+3, sustain: 0.05, release: 0.2, amp: 0.5
    sleep sl.choose
  end
  ##| 4-sl.sum
end


live_loop :mero, sync: :met do
  ##| stop
  sleep 2.5
  with_fx :reverb, room: 0.5, mix: 0.7 do
    with_fx :echo, phase: 0.375, decay: 4 do
      synth :prophet, note: chord(:gs4+[-5,0,5,7].choose, :m7), release: 0.25, cutoff: 110
    end
    sleep 4-2.5
  end
end

live_loop :mero2, sync: :met do
  use_synth :dsaw
  with_fx :lpf, cutoff: 70, amp: 1.2 do
    with_fx :wobble, phase: 10, mix: 0.4, wave: 2 do
      sleep 2
      play chord(:gs3+[0,5,7].choose, :m7, invert: 0), release: 8, attack: 2
      sleep 10
    end
  end
end

live_loop :mero3, sync: :met do
  ##| stop
  sl = [0.5,0.375,0.375,0.375, 0.375, 0.375, 0.375, 0.375, 0.375, 0.375, 0.125]
  
  with_fx :reverb, mix: 0.5, room: 0.5 do
    ##| with_fx :wobble, phase: 0.375 do
    sl.size.times do
      c = chord(:gs3, :m7)
      synth :sine, note: c, release: 0.3, attack: 0.05
      sleep sl.tick
    end
    ##| end
  end
end
