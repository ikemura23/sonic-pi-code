# Funny Cyber Sonic v2

use_debug false

cd = :c2

# 自動乱数設定
live_loop :temp do
  sleep 8
  use_random_seed Time.new.usec
end

# ランダムメロディ :pretty_bell -> :pluck -> :pulse
live_loop :mero do
  with_fx :reverb, room: 1 do
    ##| with_fx :echo do
    ##| use_random_seed 3000
    use_synth :pluck
    ns = (scale cd, :minor_pentatonic, num_octaves: 3)
    16.times do
      tick
      play ns.choose, detune: (ring 12,-24,-36).choose, release: rrand(0,0.2), amp: rand + 0.5, cutoff: rrand(70, 120),amp: 1.5
      sleep 0.125
      ##| end
    end
  end
end

live_loop :temp do
  tick
  synth :zawa, wave: 1, phase: 0.25, release: 5, note:(knit cd,12, cd,4).look, cutoff: (line 60, 120, steps: 6).look, amp: 1
  sleep 4
end

live_loop :base do
  base_amp = 2
  use_synth :fm
  3.times do
    play cd,  release: 0.5, amp: base_amp
    sleep 0.5
  end
  play cd,  release: 0.25, amp: base_amp
  sleep 0.25
  play cd ,  release: 0.25, amp: base_amp
  sleep 0.25
end

live_loop :industry do
  sample :loop_industrial, beat_stretch: 1, cutoff: 130
  sleep 1
end

live_loop :bd do
  sample :bd_haus, cutoff: 90, amp:3
  sleep 0.5
end
