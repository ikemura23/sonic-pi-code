#output https://twitter.com/ikemura23/status/1519314616169353216

hatLoop="/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/drum_loops/LCC_hat\ loops"
clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

use_bpm 62

live_loop :kick do
  sleep 0.5
  sample :bd_tek, amp: 1, lpf: 130, rate: 0.8
end

live_loop :hatLoop, sync: :kick do
  sample hatLoop, 2, beat_stretch: 8, amp: 1, lpf: 110, start: 0, finish: 0.5
  sleep 4
end

live_loop :clap, sync: :kick do
  sleep 0.5
  with_fx :reverb do
    sample clap, 0, amp: 1, lpf: 110
  end
  sleep 0.5
end

base_effect = [7,5,0,5].ring
live_loop :base, sync: :kick do
  use_synth :fm
  key = :g2
  amp = 0.6 # 0.6
  
  with_fx :reverb, amp: amp do
    n = key+base_effect.tick
    play n, sustain: 0.125, release: 0.1
    sleep 0.5
    
    play n, sustain: 0.375, release: 0.1
    sleep 0.375
    play n, sustain: 0.125, release: 0
    sleep 0.125
    
    n = key+base_effect.tick
    play n, sustain: 0.125, release: 0.125
    sleep 0.25
    
    
    n=key+base_effect.tick
    play n, sustain: 0.125, release: 0.125
    sleep 0.25
    play n, sustain: 0.125, release: 0.125
    sleep 0.25
    
    n=key+base_effect.tick
    play n, sustain: 0.125, release: 0.125
    sleep 0.25
  end
end

live_loop :midle, sync: :kick do
  use_synth :saw
  
  c = chord_invert(chord(:g2+7, :m7), 0)
  sleep 0.125
  
  with_fx :reverb, room: 0.95, mix: 0.6 do
    with_fx :wobble, cutoff_max: rrand(70, 90), wave: 1, invert_wave: 0 do
      play c, release: 0.25
      sleep 0.75
    end
    
    with_fx :wobble, cutoff_max: rrand(100, 130), wave: [1,2,3].choose,
    phase: 0.75, invert_wave: [0,0,0].choose do
      play c, release: 0.5
      sleep 0.25
      
    end
  end
  
  sleep 2-0.125-0.75-0.25
end

live_loop :midle2, sync: :kick do
  use_synth :blade
  
  c = chord_invert(chord(:g3, :sus2), 1)
  a = 1.5
  
  with_fx :echo, decay: 8, phase: 0.375, amp: 1.5 do
    with_fx :reverb, room: 0.95, mix: 0.6 do
      
      play c, release: 0.125, amp: a
      sleep 0.125
      play c, release: 0.125, amp: a
      sleep 0.125
    end
  end
  sleep 8-0.25
end

live_loop :low, sync: :kick do
  use_synth :hollow
  c = chord(:g4+7, :sus2)
  with_fx :wobble, wave: 2, phase: 8 do
    ##| play c, release: 0, sustain: 8, amp: 2
  end
  sleep 8
  
end
