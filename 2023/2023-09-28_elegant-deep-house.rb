# original music: https://music.youtube.com/watch?v=NleZrgAlSvI&si=Bj1kR6Oq_VROLD_b
# output twitter: https://twitter.com/ikemura23/status/1707406452703576078
# background movie: https://www.youtube.com/watch?v=355zf663QUg


use_debug false
use_bpm 60

kick_play = 0

hat_close_play = 1
hat_open_play = 0
snare_play = 0

bass_play = 0

synth1_play = 1
synth2_play = 1
synth3_play = 0
synth4_play = 0


# metronome #####################

live_loop :met do
  sleep 1
end

## drum ######################

with_fx :reverb, room: 0.5 do
  live_loop :kick, sync: :met do
    if kick_play < 1 then stop end
    use_sample_defaults rate: 1, amp: 1.2, lpf: 100
    
    15.times do
      sample :bd_tek
      sleep 0.5
    end
    
    sample :bd_tek
    sleep 0.25
    
    sample :bd_tek
    sleep 0.25
  end
  
  live_loop :hat1, sync: :met do
    if hat_close_play < 1 then stop end
    
    a = 0.2
    use_sample_defaults rate: 1.8, lpf: 130, attack: 0.01, amp: a
    
    2.times do
      sample :drum_cymbal_closed, amp: a
      sleep 0.125
    end
    sample :drum_cymbal_closed, amp: 1
    sleep 0.125
    sample :drum_cymbal_closed, amp: a
    sleep 0.125
  end
  
  live_loop :cymbal_open, sync: :met do
    if hat_open_play < 1 then stop end
    sleep 0.25
    sample :drum_cymbal_open, amp: 0.3, beat_stretch: 1.7, finish: 0.16, rate: 1.2
    sleep 0.25
  end
  
  live_loop :snare_loop, sync: :met do
    
    if snare_play < 1 then stop end
    
    use_sample_defaults amp: 0.7, cutoff: 100, beat_stretch: 0.18
    
    sleep 0.5
    
    sample :sn_generic, rate: 3.5
    sample :sn_generic, start: 0.02, pan: 0.2
    
    sleep 0.5
  end
  
  
end

# bass ##################

live_loop :bass, sync: :met do
  if bass_play < 1 then stop end
  use_synth_defaults release: 0.1, sustain: 0.125, amp: 1.5
  n = :g1
  s = :beep
  
  synth s, note: n
  sleep 0.375
  synth s, note: n
  sleep 0.125
  synth s, note: n
  sleep 0.25
  synth s, note: n
  sleep 0.25
  synth s, note: n
  sleep 0.25
  synth s, note: n
  sleep 0.25
  synth s, note: n
  sleep 0.25
  synth s, note: n if [false, true].tick
  sleep 0.25
end

# synth ###################

live_loop :synth1, sync: :met do
  ##| stop
  if synth1_play < 1 then stop end
  use_synth_defaults amp: 0.3, cutoff: 80, attack: 0.1
  _synth = :dsaw # :sine :dsaw
  
  wobble_mix = 0 # 0 or 1
  
  with_fx :reverb, mix: 0.7, room: 0.7 do
    with_fx :hpf, cutoff: 60 do
      with_fx :wobble, phase: 2, mix: wobble_mix do
        3.times do
          synth _synth, note: chord(:c3, :M7), release: 2
          sleep 4
        end
        synth _synth, note:  chord(:c3, :M7), release: 2
        sleep 3.5
        synth _synth, note:  chord(:c3+1, :M7), release: 0.1, sustain: 0.5
        sleep 0.5
      end
    end
  end
end


live_loop :synth2, sync: :met do
  ##| stop
  if synth2_play < 1 then stop end
  use_synth_defaults amp: 7#, cutoff: 80, attack: 0.1
  _synth = :hollow
  
  r= 0.3
  ##| with_fx :reverb, mix: r, room: r do
  with_fx :hpf, cutoff: 60 do
    3.times do
      synth _synth, note: chord(:c3, :M7), release: 4
      sleep 4
    end
    synth _synth, note:  chord(:c3, :M7), release: 3.5
    sleep 3.5
    synth _synth, note:  chord(:c3+1, :M7), release: 0.1, sustain: 0.5
    sleep 0.5
  end
  ##| end
end

live_loop :synth3, sync: :met do
  ##| stop
  if synth3_play < 1 then stop end
  use_synth_defaults release: 0.125, amp: 0.5
  use_synth :dpulse
  
  sleep 2
  
  with_fx :reverb, room: 0.8, mix: 0.7 do
    with_fx :echo, decay: 4, phase: 0.375 do
      play chord(:c4+[0,7].choose, :M7, invert: [0,1,2].choose)
    end
    sleep 2
  end
end

live_loop :synth4, sync: :met do
  if synth4_play < 1 then stop end
  
  use_synth_defaults release: 0, amp: 1, sustain: 8, attack: 0.1
  use_synth :hollow
  
  with_fx :hpf, cutoff: 100 do
    play :g7
  end
  
  sleep 8
end
