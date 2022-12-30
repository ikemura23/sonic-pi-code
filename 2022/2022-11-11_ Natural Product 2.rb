# https://twitter.com/ikemura23/status/1591333093591646210

use_debug false
use_bpm 62

clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"
hat = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_hats"
percussion = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_drum\ loops/LCKK_percussion\ loops"


kick_hat_frag = 1
clap_frag = 1
percussion_flag = 0

live_loop :met do
  sleep 1
end

with_fx :reverb, room: 0.2 do
  live_loop :kick, sync: :met do
    if kick_hat_frag < 1 then stop end
    a = 1.8
    ##| 28.times do
    
    sample :bd_tek, rate: 1, amp: a
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
  
  live_loop :percussion1, sync: :met do
    if percussion_flag < 1 then stop end
    sample :loop_safari, beat_stretch: 8
    sleep 8
  end
  
  live_loop :percussion2, sync: :met do
    if percussion_flag < 1 then stop end
    sample percussion, 11, amp: 0.7, beat_stretch: 8
    sleep 3
  end
  
end


live_loop :base, sync: :met do
  stop
  use_random_seed 400 #300, 2000, 100
  ##| 0.25, 0.25, 0.5, 0.375, 0.375, 0.25
  sl = [0.25, 0.125, 0.125, 0.125, 0.375,0.25, 0.25, 0.25,0.25]
  2.times do
    ##| sc = (scale :a2, :rast, num_octaves: 2).ring
    sc = chord(:a1, :m7)
    sc.size.times do
      synth :fm, note: sc.choose+12, sustain: 0.05, release: 0.2, amp: 1
      ##| synth :tb303, note: sc.choose, sustain: 0.05, release: 0.2, amp: 0.2
      sleep sl.choose
    end
    4-sl.sum
  end
end

live_loop :mero, sync: :met do
  ##| stop
  sleep 3
  with_fx :reverb, room: 0.5, mix: 0.7 do
    with_fx :echo, phase: 0.375, decay: 5 do
      ##| synth :prophet, note: chord(:a3+[-5,0,5,7].tick, :m7), release: 0.25, cutoff: 120
    end
    sleep 1
  end
end

live_loop :mero2, sync: :met do
  use_synth :hollow
  ##| with_fx :bpf, cutoff: 130, amp: 5 do
  ##| with_fx :reverb, room: 0.9, mix: 0.8 do
  ##| with_fx :wobble, phase: 8, mix: 0.4, wave: 3 do
  ##| sleep 1.5
  ##| play chord(:a4+2, :m7, invert: 1), release: 0, sustain: 8, amp: 3
  sleep 8
  ##| end
end
##| end
##| end

live_loop :mero3, sync: :met do
  ##| stop
  ##| use_random_seed 100
  sl = [0.5, 0.375, 0.375, 0.375, 0.375, 0.375, 0.375, 0.375, 0.125]
  ef = [2,2,1,1,4,4,0,0,0]
  
  ##| sl = [0.375, 0.375, 0.375, 0.375]
  ##| ef = [0,4,5,-2]
  
  with_fx :reverb, mix: 0.5, room: 0.5 do
    with_fx :wobble, phase: 0.375, invert_wave: 0, mix: 0.5 do
      tick_reset
      sl.size.times do
        synth :dpulse, note: chord(:a2+ef.tick, :m9, invert: 3), release: 0.3, attack: 0.05, amp: 0.8
        ##| synth :dpulse, note: chord(:a1+ef.look, :m9, invert: 0), release: 0.3, attack: 0.05, amp: 0.5
        sleep sl.look
      end
      sleep 4-sl.sum
    end
  end
end
