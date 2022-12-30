# output https://twitter.com/ikemura23/status/1466756177073963008
##| use_bpm 65
use_random_seed 70000

clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"


live_loop :bd do
  sleep 0.5
  sample :bd_haus, amp: 2, cutoff: 100
end

live_loop :clap, sync: :bd do
  sleep 0.5
  sample clap, 2, amp: 2, cutoff: 120
  sleep 0.5
end

live_loop :cymbal_close, sync: :bd do
  sleep 0.25
  sample :drum_cymbal_closed, amp: [1, 0.3].tick, attack: 0.02, rate: 1.4
  ##| sleep 0.25
  ##| 2.times do
  ##|   sample :drum_cymbal_closed, amp: 1, attack: 0.02, rate: 1.4, cutoff: 120
  ##|   sleep 0.125
  ##| end
end

# :b3
live_loop :bass, sync: :bd do
  use_synth :dpulse
  
  cd = :gb1
  
  with_fx :reverb do
    3.times do
      play cd, release: 0.2, sustain: 0
      sleep 0.25
    end
    sleep 0.125
    
    3.times do
      play cd+5, release: 0.2, sustain: 0
      sleep 0.25
    end
    sleep 0.25 + 0.125
  end
end

live_loop :back_code, sync: :bd do
  
  cd = :gb3 + [0, 5, 7].choose
  with_fx :reverb do
    invert = [0,1].choose
    synth :hollow, note: chord_invert(chord(cd, :m), invert), release: 3,  amp: 1
    synth :sine, note: chord_invert(chord(cd, :m), invert), release: 3, attack: 0.1, amp: 1
    sleep 4
  end
end