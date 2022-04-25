# output https://twitter.com/ikemura23/status/1517526982057070592

hatLoop="/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/drum_loops/LCC_hat\ loops"
clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

use_bpm 64

live_loop :kick do
  sample :bd_tek, amp: 1.1, lpf: 110, rate: 0.8
  sleep 0.5
end

live_loop :hatLoop, sync: :kick do
  
  sample hatLoop, 6, beat_stretch: 8, amp: 1, lpf: 110
  sleep 8
end

live_loop :clap, sync: :kick do
  sleep 0.5
  with_fx :reverb do
    sample clap, 5, amp: 1, lpf: 110
  end
  sleep 0.5
end

live_loop :base, sync: :kick do
  base_effect = [5, 7, 7, 0].ring
  use_synth :dpulse
  _amp = 0.8
  n = :es1
  
  sleep 2.25
  play n, release: 0.3, amp:_amp
  sleep 0.25
  play n, release: 0.3, amp:_amp
  sleep 0.25
  play n+base_effect.tick, release: 0.3, amp:_amp
  sleep 0.125
  play n+base_effect.tick, release: 0.3, amp:_amp
  sleep 0.125
  
  sleep 1
end

live_loop :midle, sync: :kick do
  use_synth :saw
  
  use_random_seed [1021, 20160, 30408, 48020].choose
  
  c = chord_invert(chord(:es3+5, [:sus2, :sus4].choose), [-1,0,1].choose)
  
  with_fx :echo,decay: 8, phase: 0.375 do
    with_fx :reverb, room: 0.95, mix: 0.6 do
      with_fx :wobble, cutoff_max: rrand(100, 130), wave: [1,2,3].choose do
        play c, release: 0.125 #, attack: rrand(0.05, 0.1)
        sleep 0.125
        play c, release: 0.125 #, attack: rrand(0.05, 0.1)
        sleep 0.125
      end
    end
  end
  
  sleep 4-0.25
end

live_loop :midle2, sync: :kick do
  use_synth :pluck
  
  c = chord_invert(chord(:es2, :sus4), [0,1].choose)
  sleep 2
  with_fx :echo,decay: 8, phase: 0.375 do
    with_fx :reverb, room: 1, mix: 0.4 do
      play c, release: 0.125
      sleep 0.125
      play c, release: 0.125
      sleep 0.125
    end
  end
  
  sleep 3-0.25
end

live_loop :midle3, sync: :kick do
  use_synth :pnoise
  
  c = chord_invert(chord(:es2, :sus4), [0,1].choose)
  sleep 2
  with_fx :echo,decay: 8, phase: 0.375 do
    with_fx :reverb, room: 0.8, mix: 0.6 do
      play c, release: 0.125
      sleep 0.125
      ##| play c, release: 0.125
      sleep 0.125
    end
  end
  
  sleep 2-0.25
end

live_loop :low, sync: :kick do
  use_synth :hollow
  c = chord_invert(chord(:es3+7, [:m9,:sus2,:sus4].ring.tick), [-1,0,1].choose)
  play c, release: 2, sustain: 7, amp: 1.7, attack: 0.5
  sleep 8
end
