#output https://twitter.com/ikemura23/status/1509795448759930882

hat_loop="/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/drum_loops/LCC_hat\ loops"
clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

use_bpm 65

live_loop :kick do
  sample :bd_tek, amp: 1.1, lpf: 130, rate: 0.8
  sleep 0.5
end

live_loop :clap, sync: :kick do
  sleep 0.5
  with_fx :reverb do
    sample clap, 6 , amp: 1
  end
  sleep 0.5
end

live_loop :drum, sync: :kick do
  sample hat_loop, 0, beat_stretch: 8
  sleep 8
end

live_loop :base, sync: :kick do
  use_random_seed  [5, 200].tick
  use_synth :fm
  base_note = (scale :fs2, :minor_pentatonic, num_octaves: 1).shuffle
  
  base_note.size.times do
    n = base_note.tick
    with_fx :distortion do
      play n , release: 0.4, amp: 0.9
      sleep 0.25
    end
  end
end

eff=[0,5,2,7].shuffle.ring
live_loop :low, sync: :kick do
  use_synth :hollow
  play chord(:fs3+eff.tick, :m7), release: 1, sustain: 8, amp: 7
  sleep 8
end

live_loop :midle, sync: :kick do
  use_synth :saw
  ##| use_random_seed [1070, 2704, 3708, 4600].choose
  
  sl = [0.375, 0.25, 0.25, 0.125].shuffle
  c = chord_invert(chord(:fs3+eff.look, :m7), [-1,0,1].choose)
  
  4.times do
    
    with_fx :lpf , cutoff: 100, amp: 1.5 do
      with_fx :reverb, room: 0.95, mix: 0.8 do
        with_fx :wobble, cutoff_max: rrand(90, 110), wave: [1,2,3].choose do
          play c, release: 0.125, attack: rrand(0.02, 0.1)
          sleep sl.tick
        end
      end
    end
  end
  sleep 8-sl.sum
end

live_loop :pico, sync: :kick do
  use_random_seed 3000 #4000, 4500, 600
  use_synth :dpulse
  _amp = 0 #0.5
  c = (scale :fs5, :minor_pentatonic, num_octaves: 1).shuffle
  c = chord_invert(chord(:fs5, :m7), [-1,0,1].choose).shuffle
  with_fx :reverb, room: 0.9 do
    with_fx :lpf, cutoff: 100 do
      4.times do
        play c.tick, release: 0.125 ,amp: _amp
        sleep 0.25
      end
      2.times do
        play c.tick, release: 0.125 ,amp: _amp
        sleep 0.125
      end
      3.times do
        play c.tick, release: 0.125 ,amp: _amp
        sleep 0.25
      end
    end
  end
end
