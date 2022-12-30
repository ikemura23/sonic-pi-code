# output https://twitter.com/ikemura23/status/1534550622980440066

clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"
percussion = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_drum\ loops/LCKK_percussion\ loops"

use_debug false

live_loop :bd do
  sleep 0.5
  ##| sample :bd_tek, cutoff: 100, amp: 1.2
end

live_loop :clap, sync: :bd do
  sleep 0.5
  with_fx :reverb do
    sample clap, 5, amp: 1, lpf: 110
  end
  sleep 0.5
end

live_loop :hi, sync: :bd do
  with_fx :reverb do
    ##| sample :drum_splash_hard, cutoff: 110, amp: 0.8
  end
  sleep 16
end

##| live_loop :cymbal_op, sync: :bd do
##|   3.times do
##|     cynbal_open 0.25
##|   end
##|   2.times do
##|     cynbal_open 0.125
##|   end
##| end

live_loop :percussion, sync: :bd do
  sample percussion, 15,amp: 0.5, beat_stretch: 4 #11 15 18
  sleep 4
end

live_loop :low_cutting, sync: :bd do
  key = :b2+[3,5,0,0].tick
  cutting_chord key, 0, :sine, 0.1
end

live_loop :strings, sync: :bd do
  use_synth :hollow
  sl = [3, 5, 0, 0]
  amp = [1,2].last
  key = :b3
  
  4.times do |i|
    ef = [0].choose
    with_fx :slicer, phase: 0.5, wave: 3, mix: 0.4 do
      play chord(key+sl[i], :m7), sustain: 2, release: 0, amp: amp
      sleep 2
    end
  end
end

############# define #############

define :cynbal_open do |beats|
  sleep beats
  sample :drum_cymbal_open, amp: 0.2, beat_stretch: 2, finish: 0.2
  sleep beats
end

define :cutting_chord do |tonic,  amp = 1, synth, release|
  use_synth synth #:sine
  
  sc = chord_invert(chord(tonic, :m7), 0)
  
  with_fx :reverb ,amp: amp do
    5.times do |i|
      play sc+[0,0,0,0,0,0,0,0].choose, release: release
      sl = if i<4 then 0.375 else 0.25 end
      sleep sl
    end
    play sc+[0,0,0,0,0,0,0,0,0].choose, release: release
    sleep 0.25
    sleep 2-0.375*4-0.5
  end
end