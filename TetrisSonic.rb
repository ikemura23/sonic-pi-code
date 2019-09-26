## Tetris Sonic
## Switchのタイトル曲をコピー

use_bpm 65

cd = :g4
note = :M7

live_loop :cd do
  ##| cd = [:g4,:d5].ring.tick
  cd = [:f4,:ab4,:c5,:f5].ring.tick
  sleep 8
  
end

live_loop :back1 do
  use_synth :pluck
  with_fx :wobble, phase:4, invert_wave:1 do
    32.times do
      play chord(cd, note),release: 0.125, amp: 2, cutoff: 80
      sleep 0.125
    end
  end
end


live_loop :b2 do
  use_synth :growl
  
  sleep 0.25
  play cd, release: 0.5, amp:2
  sleep 0.25
end

live_loop :bass do
  use_synth :fm
  ##| with_fx :distortion do
  
  sleep 0.25
  play cd-24, release: 0.5, amp:2
  sleep 0.25
  ##| end
end

live_loop :arpeggios do
  use_synth :dtri
  ##| with_fx :reverb
  play_pattern_timed chord(cd, note), 0.125, release: 0.125,cutoff: 80, amp: 1
  ##| play choose(chord(cd, note)), release: 0.125, amp: 1
  ##| sleep 0.125
end
##| end

live_loop :hihat1 do
  sample :drum_cymbal_pedal, lpf: 100, amp: (ring 0.5, 1).tick, sustain: 0.2
  sleep 0.25
end

live_loop :sn do
  sleep 0.5
  sample :sn_generic, lpf: 110, sustain: 0.2
  sleep 0.5
end

live_loop :bd do
  sample :bd_haus, cutoff: 80, amp:2
  sleep 0.5
end
