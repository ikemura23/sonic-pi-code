# output https://twitter.com/ikemura23/status/1503737741674450946

hat_loop="/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/drum_loops/LCC_hat\ loops"
clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

use_bpm 65

live_loop :kick do
  with_fx :reverb do
    sample :bd_tek, lpf: 130
    sleep 0.5
  end
end

live_loop :cymbal_close, sync: :kick do
  sleep 0.25
  ##| sample :drum_cymbal_closed, amp: 2, attack: 0.01, rate: 4
  sleep 0.25
end

live_loop :splash, sync: :kick do
  with_fx :reverb do
    sample :drum_splash_hard, amp: 0.7
  end
  sleep 32
end

live_loop :drum, sync: :kick do
  sample hat_loop, 2, beat_stretch: 8 , amp: 1 #,start: 0, finish: [1, 0.75].ring.tick
  sleep 8
end

live_loop :clap, sync: :kick do
  sleep 0.5
  with_fx :reverb do
    sample clap, 1, amp: 1
  end
  sleep 0.5
end

live_loop :code, sync: :kick do
  use_synth :sine
  _attack = 0.07
  _amp=1
  
  code_effect = [0,2,4,6,8,10].ring
  
  6.times do |i|
    n = chord_invert(chord(:b4+code_effect.tick, :m7), 0)
    with_fx :flanger,depth: 2 do
      
      s = case i
      when 3 then 4
      when 4,5 then 2
      else 8
      end
      
      puts(s)
      with_fx :lpf, cutoff: 70, amp: 1 do
        play n, sustain: s, release: 0, attack: _attack, amp: _amp
        play n-7, sustain: s, release: 0, attack: _attack, amp: _amp
        play n-12, sustain: s, release: 0, attack: _attack, amp: _amp-0.3
        sleep s
      end
    end
  end
end


live_loop :base, sync: :kick do
  use_synth :dsaw
  base_effect = [-7,-5,-3].ring
  3.times do
    n = :b1+base_effect.tick
    4.times do
      play n, sustain: 0, release: 0.25
      sleep 0.25
      sleep 0.5
      play n, sustain: 0, release: 0.25
      sleep 0.25
      sleep 0.375
      play n, sustain: 0, release: 0.25
      sleep 0.375
      play n, sustain: 0, release: 0.25
      sleep 0.25
    end
  end
  2.times do
    n = :b1-1
    play n, sustain: 0, release: 0.25
    sleep 0.25
    sleep 0.5
    play n, sustain: 0, release: 0.25
    sleep 0.25
    sleep 0.375
    play n, sustain: 0, release: 0.25
    sleep 0.375
    play n, sustain: 0, release: 0.25
    sleep 0.25
  end
  n = :b1+1
  play n, sustain: 0, release: 0.25
  sleep 0.25
  sleep 0.5
  play n, sustain: 0, release: 0.25
  sleep 0.25
  sleep 0.375
  play n, sustain: 0, release: 0.25
  sleep 0.375
  play n, sustain: 0, release: 0.25
  sleep 0.25
  
  n = :b1+3
  play n, sustain: 0, release: 0.25
  sleep 0.25
  sleep 0.5
  play n, sustain: 0, release: 0.25
  sleep 0.25
  sleep 0.375
  play n, sustain: 0, release: 0.25
  sleep 0.375
  play n, sustain: 0, release: 0.25
  sleep 0.25
end
