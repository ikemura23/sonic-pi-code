use_debug false
use_bpm 60

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
    sample :bd_ada, rate: 1, amp: 1.5
    sleep 0.5
  end
  
  
  live_loop :hhc1, sync: :met do
    if kick_hat_frag < 1 then stop end
    
    sleep 0.25
    sample hat, 14, amp: 0.5, rate: 1.5
    sleep 0.25
  end
  
  
  live_loop :hhc2, sync: :met do
    if kick_hat_frag < 1 then stop end
    ##| 116.times do
    sample hat, 1, amp: 0.3, rate: 2
    sleep 0.125
    ##| end
    ##| sleep 2
  end
  
  live_loop :clap, sync: :met do
    if clap_frag < 1 then stop end
    
    sleep 0.5
    sample clap, 1, amp: 0.8, lpf: 120
    sleep 0.5
  end
  
  live_loop :splash, sync: :met do
    ##| if splash_flag < 1 then stop end
    sample :drum_splash_soft ,amp: 1
    sleep 16
  end
end

live_loop :base, sync: :met do
  ##| stop
  
  with_fx :reverb, room: 0.5, mix: 0.5 do
    with_fx :lpf, cutoff: 80 do
      ##| with_fx :wobble, wave: 0, invert_wave: [1,0].tick, phase: 8 do
      8.times do
        use_random_seed 4000
        sc = (scale :e1, :rast, num_octaves: 2).ring
        4.times do
          s = sc.choose
          synth :dsaw, note: s, sustain: 0.05, release: 0.2, amp: 1
          synth :tb303, note: s, sustain: 0.05, release: 0.2, amp: 0.2
          sleep 0.125
        end
        use_random_seed 600
        4.times do
          s = sc.choose
          synth :dsaw, note: s, sustain: 0.05, release: 0.2, amp: 1
          synth :tb303, note: s, sustain: 0.05, release: 0.2, amp: 0.2
          sleep 0.125
        end
      end
    end
  end
end

live_loop :mero, sync: :met do
  stop
  sleep 3
  with_fx :reverb, room: 0.6, mix: 0.7 do
    with_fx :echo, phase: 0.375, decay: 5 do
      synth :prophet, note: chord(:e4+[0,5,7].tick, :sus4), release: 0.25, cutoff: 120, amp: 3
    end
    sleep 1
  end
end

live_loop :mero2, sync: :met do
  stop
  use_synth :hollow
  ##| with_fx :bpf, cutoff: 0 do
  ##| with_fx :reverb, room: 0.5, mix: 0.8 do
  ##| sleep 3
  play chord(:e4, :sus4, invert: [0,1,-2].choose), sustain: 10, release: 2, attack: 0, amp: 4
  sleep 10
end
##| end

