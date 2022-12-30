# output https://twitter.com/ikemura23/status/1532272949948219393
# 参考 Souvenir - Love Deluxe
use_bpm 62

live_loop :bd do
  sleep 0.5
  ##| sample :bd_tek, cutoff: 120, amp: 1.1
end

live_loop :cymbal_open, sync: :bd do
  sleep 0.25
  sample :drum_cymbal_open, amp: 1, beat_stretch: 0.4, cutoff: 120
  sleep 0.25
end

live_loop :sn , sync: :bd do
  sleep 0.5
  with_fx :reverb do
    sample :sn_generic, rate: 1.8, amp: 0.8, lpf: 100
  end
  sleep 0.5
end

live_loop :cd, sync: :bd do
  use_synth :prophet
  keys = [:a3, :a3-2, :a3, :a3]
  cds = [:m, :M, :M, :madd2]
  amp = 1.5
  
  with_fx :reverb, amp: amp do
    4.times do
      key = keys.tick
      cd = cds.look
      play chord(key, cd), release: 0.75
      sleep 0.75
      
      play chord(key, cd), release: 1
      sleep 0.5
      
      sleep 2-0.5-0.75
    end
  end
end

live_loop :base1, sync: :bd do
  _effect = [8, 7, 5, 0]
  _release = [0.125, 0.25, 0.375, 0.25]
  cd = :a1
  amp = 0
  
  with_fx :reverb, amp: amp do
    4.times do
      _effect.tick
      4.times do
        sleep 0.25
        synth :fm, note: cd+_effect.look, release: 0.25
        synth :chiplead, note: cd+_effect.look, release: 0.25
        sleep 0.25
      end
    end
  end
end

live_loop :pico, sync: :bd do
  
  use_synth :blade
  amp = 0  #0.8
  
  use_random_seed 700
  sc = (scale :a3+7, :minor_pentatonic).shuffle
  with_fx :reverb ,room: 0.5, mix: 0.5 do
    8.times do
      play sc.tick, release: 0.3, amp: amp
      sleep 0.125
    end
  end
end

##| live_loop :mero1, sync: :bd do

##|   use_synth :pretty_bell #:tech_saws
##|   use_random_seed 300
##|   sc = (scale :a, :minor_pentatonic).shuffle
##|   with_fx :reverb, room: 1 do
##|     4.times do
##|       play sc.tick, release: 0.5
##|       sleep 0.375
##|     end
##|   end

##|   sleep 2-0.375*4
##| end

live_loop :mero2, sync: :bd do
  
  use_random_seed 200
  use_synth :chiplead #:tech_saws :blade :chiplead :dtri :prophet
  
  amp = 0
  target = :a4+7
  sc = (scale :a4, :minor_pentatonic).filter{ |num| num!=target }.shuffle
  
  with_fx :reverb, room: 1,mix: 0.6, amp: amp do
    with_fx :lpf, cutoff: 90 do
      2.times do
        p = play sc.tick, release: 0.5, note_slide: 0.05, sustain: 1.5
        sleep 0.5
        control p, note: sc.tick
        sleep 0.25
        control p, note: target
        sleep 1.25
      end
      
      p = play sc.tick, release: 1, note_slide: 0.05, sustain: 3
      sleep 0.5
      control p, note: sc.tick
      sleep 0.25
      control p, note: target
      sleep 2.25
    end
  end
  
  sleep 1
end

live_loop :mero3, sync: :bd do
  
  use_random_seed 300 #200
  use_synth :prophet #:tech_saws
  amp = 0 #0.6
  
  sc = (scale :a4, :minor_pentatonic).shuffle
  sleep 1
  with_fx :reverb, room: 1, amp: amp do
    p = play sc.tick, release: 3, note_slide: 0.05, sustain: 4
    sleep 1
    control p, note: sc.tick
    sleep 1
    control p, note: sc.tick
    sleep 1
    control p, note: sc.tick
  end
  sleep 4
end

##| live_loop :mero4, sync: :bd do
##|   _release = [0.125, 0.25, 0.375, 0.25]
##|   cd = :a3
##|   use_synth :saw
##|   amp = 1

##|   with_fx :reverb, room: 0.7, mix: 0.7 do
##|     4.times do
##|       play chord(cd+7,:m).tick, release: 0.2, amp: amp
##|       sleep _release.look
##|     end
##|   end
##| end
