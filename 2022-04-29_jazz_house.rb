#output https://twitter.com/ikemura23/status/1519839270629896192

hatLoop="/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_drum\ loops/LCKK_hat\ loops"
clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

use_bpm 64

live_loop :kick do
  sleep 0.5
  sample :bd_tek, amp: 1.1, lpf: 110, rate: 0.8
end

live_loop :hatLoop, sync: :kick do
  sample hatLoop, 0, beat_stretch: 4, amp: 1.2, lpf: 110
  sleep 4
end

live_loop :clap, sync: :kick do
  sleep 0.5
  with_fx :reverb do
    sample clap, 0, amp: 1, lpf: 110
  end
  sleep 0.5
end

base_effect = [7,0,3,5].ring
live_loop :base, sync: :kick do
  use_synth :fm
  key = :g2
  amp = 0 # 0.6
  
  with_fx :reverb, amp: amp do
    n = key+base_effect.tick
    play n, sustain: 0.125, release: 0
    sleep 0.25
    play n, sustain: 0.125, release: 0
    sleep 0.25
    
    n = key+base_effect.tick
    play n, sustain: 0.125, release: 0
    sleep 0.25
    play n, sustain: 0.125, release: 0
    sleep 0.25
    
    n=key+base_effect.tick
    play n, sustain: 0.1, release: 0
    sleep 0.125
    play n, sustain: 0.1, release: 0
    sleep 0.25
    
    n=key+base_effect.tick
    play n, sustain: 0.1, release: 0
    sleep 0.25
    play n, sustain: 0.1, release: 0
    sleep 0.125
    play n, sustain: 0.1, release: 0
    sleep 0.25
  end
end

live_loop :midle, sync: :kick do
  use_synth :sine
  
  c = chord_invert(chord(:g3+7, :m7), 0)
  sleep 2
  with_fx :echo,decay: 8, phase: 0.375 do
    ##| play c, release: 0.125#, attack: rrand(0.01, 0.05)
    sleep 0.125
    ##| play c, release: 0.125#, attack: rrand(0.01, 0.05)
    sleep 0.125
  end
  
  sleep 6-0.25
end

live_loop :midle2, sync: :kick do
  use_synth :saw
  
  c = chord_invert(chord(:g2+7, :m7), [0,1,2].choose)
  
  sleep 3.25
  with_fx :reverb, room: 0.95, mix: 0.6 do
    with_fx :wobble, cutoff_max: rrand(100, 110), wave: [1,2,3].choose,phase: 0.75 do
      play c, release: 0.5
      sleep 0.75
      
      ##| play c, release: 0.25
      ##| sleep 0.25
      ##| play c, release: 0.5
      ##| sleep 0.5
    end
  end
  
end

live_loop :low, sync: :kick do
  use_synth :rodeo
  
  a = 1.3
  with_fx :lpf, cutoff: 80 do
    play (chord :g3, :m9), release: 0, sustain: 1, amp: a
    sleep 2
    play (chord :g3+3, :m9), release: 0, sustain: 0.1, amp: a
    sleep 1
    play (chord :g3-5, :m9), release: 0, sustain: 0.1, amp: a
    sleep 1
  end
end
