#output https://twitter.com/ikemura23/status/1534182232155230208

clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

live_loop :bd do
  sleep 0.5
  ##| sample :bd_tek, cutoff: 100, amp: 1.2
end

live_loop :clap, sync: :bd do
  sleep 0.5
  with_fx :reverb do
    sample clap, 2, amp: 1, lpf: 110
  end
  sleep 0.5
end

live_loop :hi, sync: :bd do
  with_fx :reverb do
    ##| sample :drum_splash_hard, cutoff: 110, amp: 0.8
  end
  sleep 16
end

live_loop :cymbal_open, sync: :bd do
  sleep 0.25
  ##| sample :drum_cymbal_open, amp: 0.2, beat_stretch: 2, finish: 0.1, hpf: 110
  sleep 0.25
end


live_loop :cymbal_close, sync: :bd do
  sleep 0.25
  ##| sample :drum_cymbal_closed, amp: [1, 0.3].tick, attack: 0.02, rate: 1.4
end

live_loop :cd1, sync: :bd do
  use_synth :rodeo
  key = :gb2
  cd = :m9
  
  effect=[0, 2, 3, 5 ]
  4.times do
    
    with_fx :slicer, phase: 0.5, wave: 3, mix: 0.5 do
      play chord(key+effect.tick, :m9), release: 0.25, sustain: 1.75
      sleep 2
    end
    
    ##| play chord(key+effect.tick, :m9), release: 2, sustain: 0
    ##| sleep 2
    ##| k = key+effect.tick
    ##| 2.times do
    ##|   play chord(k, cd), release: 0.5
    ##|   sleep 0.375
    ##|   play chord(k, cd), release: 1
    ##|   sleep 0.625
    ##| end
  end
end

live_loop :cd2, sync: :bd do
  use_synth :dsaw
  amp = 0
  
  sleep 0.75
  with_fx :slicer, phase: 0.5, wave: 3, mix: 0.4 do
    play chord(:gb4+[7, 10].tick, :m9), release: 2, sustain: 0, amp: amp
  end
  sleep 3.25
end

live_loop :base1, sync: :bd do
  _effect = [-12, -10, -9, -7]
  _release = [0.125, 0.25, 0.375, 0.25]
  cd = :gb1
  amp = 0
  
  with_fx :reverb, amp: amp do
    4.times do
      _effect.tick
      
      4.times do
        sleep 0.25
        synth :fm, note: cd+_effect.look+12, release: 0.25
        synth :chiplead, note: cd+_effect.look+12, release: 0.25
        sleep 0.25
      end
    end
  end
end

##| live_loop :pico, sync: :bd do
##|   use_synth :pulse

##|   amp = 0.5
##|   sc = [0,7,12,19]
##|   with_fx :reverb, amp: amp do
##|     4.times do
##|       play :gb4+sc.tick, release: 0.1 if spread(5, 16).tick
##|       sleep 0.125
##|     end
##|   end
##| end

live_loop :strings, sync: :bd do
  use_synth :hollow
  sl = [0, 2, 3, 5]
  key = [:m9]
  
  4.times do |i|
    ef = [0].choose
    with_fx :slicer, phase: 0.5, wave: 3, mix: 0.5 do
      play chord(:gb4+7+sl[i], :m9), sustain: 2, release: 0, amp: 2
      sleep 2
    end
  end
end
