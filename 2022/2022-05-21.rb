# output https://twitter.com/ikemura23/status/1528029842242842629

live_loop :bd do
  sleep 0.5
  sample :bd_tek, cutoff: 100, amp: 1.2
end

live_loop :amen, sync: :bd  do
  7.times do
    sample :loop_amen, beat_stretch: 2, amp: 0.7, lpf: 110
    sleep 2
  end
  sleep 2
end

live_loop :hi, sync: :bd do
  with_fx :reverb do
    ##| sample :drum_splash_hard, cutoff: 100, amp: 0.8
  end
  sleep 16
end

live_loop :cymbal_close, sync: :bd do
  sleep 0.25
  ##| sample :drum_cymbal_closed, amp: [1, 0.3].tick, attack: 0.02, rate: 1.4
end

live_loop :cd1, sync: :bd do
  use_synth :rodeo
  key = :gb3
  
  # パターン1
  with_fx :slicer, phase: 0.5, wave: 3, mix: 0.8 do
  play chord(key, :m9), release: 3.25, sustain: 0
  sleep 3.25
  end
  
  play chord(key+2, :m9), release: 0, sustain: 0.75
  sleep 0.75
  
  # パターン2
  with_fx :slicer, phase: 0.5, wave: 3, mix: 0.8 do
    play chord(key, :m9), release: 2, sustain: 0
    sleep 2
  end
  play chord(key, :m9), release: 0.75, sustain: 0
  sleep 0.5
  play chord(key+3, :m9), release: 0.75, sustain: 0
  sleep 0.5
  play chord(key-5, :m9), release: 1.25, sustain: 0
  sleep 1
  
  # パターン3
  effect=[0, 3, -5, -3, -2, 1, -7, -5]
  8.times do
    play chord(key+effect.tick, :m9), release: 0.75, sustain: 0
    sleep 0.5
  end

end

live_loop :cd2, sync: :bd do
  use_synth :sine
  sleep 0.75
  with_fx :slicer, phase: 0.5, wave: 3, mix: 0.8 do
    play chord(:gb4+7, :m9), release: 2, sustain: 0, amp: 0.7
  end
  sleep 3.25
  
  ##| sleep 0.75
  ##| with_fx :slicer, phase: 0.5, wave: 3, mix: 0.8 do
  ##|   play chord(:gb4+10, :m9), release: 2, sustain: 0, amp: 0.7
  ##| end
  ##| sleep 1.25
end

live_loop :cd3, sync: :bd do
  use_synth :dpulse
  effect=[0,3, -5,-3, -2, 1, -7, -5]
  key = :gb4
  8.times do
    c = chord(key+effect.tick, :m9)
    ##| with_fx :octaver do
    ##| play c.tick, release: 0.125,amp: 0.6
    ##| play c.look+7, release: 0.125,amp: 0.4
    ##| end
    
    sleep 0.125
  end
end

live_loop :bass, sync: :bd do
  use_synth :fm
  
  play :gb2, release: 0.25
  sleep 0.25
  cd = chord_invert(chord(:gb2, :m), -1)
  
  with_fx :level, amp: 0.8 do
    3.times do
      play cd.tick, release: 0.25
      sleep 0.25
    end
    
    play :gb2, release: 0.25
    sleep 0.25
    
    play :gb2, release: 0.25
    sleep 0.25
    sleep 0.25
    3.times do
      play cd.tick, release: 0.25
      sleep 0.25
    end
    play :gb2, release: 0.25
    sleep 0.25
    sleep 4-0.25*11
  end
end
