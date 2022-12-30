# output https://twitter.com/ikemura23/status/1456202562546200577
use_bpm 85

live_loop :hi, sync: :kick do
  with_fx :reverb do
    sample :drum_splash_hard
  end
  sleep 16
end

live_loop :kick do
  with_fx :reverb do
    sample :drum_heavy_kick, amp: 3
    sleep 1
  end
end

live_loop :sn, sync: :kick do
  sleep 1
  with_fx :reverb do
    ##| sample :sn_dolf, amp:2, beat_stretch: 1, amp: 0.9
    sample :sn_zome, beat_stretch: 1, amp: 2
  end
  sleep 1
end

n = :ds1
live_loop :base1, sync: :kick do
  sleep 0.25
  
  ##| synth :chiplead, note: n+12, sustain: 0.25,release: 0
  ##| synth :fm, note: n+12, sustain: 0.25,release: 0
  ##| synth :dsaw, note: n+12+7, sustain: 0.25,release: 0, amp: 0.8
  ##| sleep 0.25
  ##| synth :chiplead, note: n+12, sustain: 0.5,release: 0
  ##| synth :fm, note: n+12, sustain: 0.5,release: 0
  ##| synth :dsaw, note: n+12+7, sustain: 0.5,release: 0, amp: 0.8
  sleep 0.5
end

live_loop :base2, sync: :kick do
  sleep 0.25
  3.times do
    synth :chiplead, note: n, sustain: 0.25,release:0, amp: 1
    synth :fm, note: n+12, sustain: 0.25,release:0
    synth :prophet, note: n, sustain: 0.25,release: 0, attack_level: 10 #  :prophet :dpulse :dsaw
    sleep 0.25
  end
  
end
