#output https://twitter.com/ikemura23/status/1504640089153949697

hat_loop="/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/drum_loops/LCC_hat\ loops"
clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

use_bpm 65

live_loop :kick do
  ##| sample :bd_tek, lpf: 90
  sleep 0.5
end


live_loop :bd, sync: :kick do
  ##| stop
  _lpf = 80
  with_fx :reverb do
    sample :bd_ada, lpf: _lpf
    sleep 0.375
    sample :bd_ada, lpf: _lpf
    sleep 0.375
    sample :bd_ada, lpf: _lpf
    sleep 0.25
    sample :bd_ada, lpf: _lpf
    sleep 0.5
    sleep 2-(0.375*2)-0.25-0.5
  end
end

live_loop :cymbal_close, sync: :kick do
  with_fx :reverb, room: 0.5 do
    4.times do
      sample :drum_cymbal_closed, amp: [0,0,2,0].tick, attack: 0.02, rate: 4
      sleep 0.125
    end
  end
end


live_loop :drum, sync: :kick do
  ##| sample hat_loop, 3, beat_stretch: 8 , amp: 1
  sleep 8
end

live_loop :clap, sync: :kick do
  stop
  sleep 0.5
  with_fx :reverb do
    sample clap, 1, amp: 1
  end
  sleep 0.5
end

live_loop :long_clap, sync: :kick do
  sleep 3
  with_fx :reverb, mix: 0.9,room: 0.9 do
    ##| sample clap, 0, amp: 1.2, beat_stretch: rrand(1, 2), rate: rrand(1, 2)
  end
  sleep 1
end


live_loop :code, sync: :kick do
  use_synth :sine #:sine
  _attack = 0
  _amp=1
  
  code_effect = [
    [0,:m7],[2,:m7],[3,:M7],[2,:m7],
    [0,:m7],[2,:m7],[3,:M7],[7,:m],
  ].ring
  
  code_effect.size.times do |i|
    code_effect.tick
    
    eff = code_effect[i][0]
    cd = code_effect[i][1]
    n = chord(:ds4+eff, cd)
    
    with_fx :reverb, room: 1 do
      with_fx :lpf, cutoff: 80, amp: 1 do
        play n, sustain: 0, release: 2.5
        play n-12, sustain: 0, release: 2.5
        sleep 2
      end
    end
  end
end

live_loop :pico, sync: :kick do
  use_random_seed 1000
  use_synth :dpulse
  notes = [ -2,0,5,7 ].shuffle
  with_fx :reverb, room: 1, mix: 0.9 do
    sleep 1
    ##| play :ds6+notes.tick, release: 0.125, amp: 0.5
    sleep 1
  end
end


live_loop :base, sync: :kick do
  _synth = :fm
  ##| base_effect = [-7,-5,-3].ring
  base_key = :ds2
  
  synth _synth, note: base_key, sustain: 0, release: 0.5
  sleep 0.375
  synth _synth, note: base_key, release: 0.5
  sleep 0.375
  synth _synth, note: base_key, sustain: 0, release: 0.5
  sleep 0.25
  synth _synth, note: base_key, sustain: 0, release: 0.5
  sleep 0.5
  synth _synth, note: base_key, sustain: 0, release: 0.5
  sleep 0.5
  sleep 2-(0.375*2)-0.25-1
end
