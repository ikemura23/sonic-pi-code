#output https://twitter.com/ikemura23/status/1506933294075572232

hat_loop="/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/drum_loops/LCC_hat\ loops"
clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

use_bpm 65

live_loop :kick do
  ##| sample :bd_tek, amp: 1.1, lpf: 110, rate: 0.8
  sleep 0.5
end

live_loop :clap, sync: :kick do
  sleep 0.5
  with_fx :reverb do
    sample clap, 6, amp: 1
  end
  sleep 0.5
end

base_effect = [0,7,5].ring
live_loop :base, sync: :kick do
  use_synth :fm
  _amp = 1.2
  n = :db2+base_effect.tick
  
  play n, sustain: 0.4, release: 0.1, amp:_amp
  sleep 0.5
  play n, sustain: 0.275, release: 0.1, amp:_amp
  sleep 0.375
  play n, sustain: 0, release: 0.25, amp:_amp
  sleep 0.125
  
  n=n+base_effect.tick
  play n, sustain: 0, release: 0.25, amp:_amp
  sleep 0.25
  play n, sustain: 0, release: 0.25, amp:_amp
  sleep 0.5
  n=:db2+base_effect.tick
  play n, sustain: 0, release: 0.25, amp:_amp
  sleep 0.25
end


live_loop :midle, sync: :kick do
  use_synth :saw

  sl = [0.375, 0.25, 0.25, 0.125].shuffle
  
  c = chord_invert(chord(:db3+7, :m9), [-1,0,1].choose)
  4.times do
    ##| use_random_seed [100, 204, 308, 480].choose
    with_fx :lpf , cutoff: 110, amp: 1.5 do
      with_fx :reverb, room: 0.95, mix: 0.8 do
        with_fx :wobble, cutoff_max: rrand(60, 80), wave: [1,2,3].choose do
          ##| with_fx :echo do
          play c, release: 0.125, attack: rrand(0.02, 0.1)
          sleep sl.tick
        end
      end
      ##| end
    end
  end
  
  sleep 4-sl.sum
end

live_loop :hight, sync: :kick do
  use_synth :dpulse
  
  sl = [0.25, 0.125].shuffle
  
  c = chord_invert(chord(:db5, :m9), [-1,0,1].choose)
  sleep 2.5
  use_random_seed [100, 204, 308, 480].choose
  
  2.times do
    with_fx :lpf , cutoff: [120, 100].choose, amp: 0.8 do
      with_fx :reverb, room: 0.5, mix: 0.2 do
        ##| with_fx :wobble, cutoff_max: rrand(60, 80), wave: [1,2,3].choose do
        with_fx :echo do
          s = sl.tick
          ##| play c+[7,9].choose, release: s , attack: rrand(0, 0.2)
          sleep s
        end
      end
      ##| end
    end
  end
  
  sleep 1.5-sl.sum
end

live_loop :low, sync: :kick do
  use_synth :hollow
  ##| play chord(:db4+7, :m9), release: 0, sustain: 4, amp: 2
  sleep 4
end
