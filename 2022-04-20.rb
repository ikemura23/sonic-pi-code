#output https://twitter.com/ikemura23/status/1516788168053641216

hatLoop="/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/drum_loops/LCC_hat\ loops"
clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

use_bpm 64

live_loop :kick do
  sample :bd_tek, amp: 1.1, lpf: 110, rate: 0.8
  sleep 0.5
end

live_loop :hatLoop, sync: :kick do
  
  sample hatLoop, 3, beat_stretch: 8, amp: 1, lpf: 130
  sleep 8
end

live_loop :clap, sync: :kick do
  sleep 0.5
  with_fx :reverb do
    sample clap, 0, amp: 1
  end
  sleep 0.5
end

base_effect = [0,7,5].ring
live_loop :base, sync: :kick do
  use_synth :dpulse
  _amp = 0.9
  n = :es1
  
  sleep 0.375
  play n, release: 0.3, amp:_amp
  sleep 0.375
  play n+[0,7].tick, release: 0.3, amp:_amp
  sleep 0.25 #0.25, 1.25
  
end

##| use_random_seed [101, 2010, 3008, 4800].choose

live_loop :midle, sync: :kick do
  use_synth :saw
  
  sl = [0.375, 0.25]
  c = chord_invert(chord(:es3+5, [:sus2,:sus4].choose), [-1,0,1].choose)
  2.times do
    
    with_fx :reverb, room: 0.95, mix: 0.8 do
      with_fx :wobble, cutoff_max: rrand(100, 130), wave: [1,2,3].choose do
        play c, release: 0.125, attack: rrand(0.05, 0.1)
        sleep sl.tick
      end
    end
  end
  
  sleep 4-sl.sum
end

live_loop :pico, sync: :kick do
  use_synth :dpulse
  
  sl = 0.125
  sleep 1
  
  2.times do
    sleep 0.25
    2.times do
      ##| with_fx :lpf , cutoff: 110, amp: 0.3 do
      with_fx :reverb, room: 0.2, mix: 0.5 do
        
        play :es5, release: sl, amp: 0.4
        sleep sl
        
      end
    end
  end
  ##| end
end

live_loop :low, sync: :kick do
  use_synth :hollow
  play chord(:es3+7, :sus2), release: 0, sustain: 4, amp: 1.5
  sleep 4
end
