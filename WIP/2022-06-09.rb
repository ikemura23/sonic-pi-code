live_loop :met do
  sleep 1
end

live_loop :s, sync: :met do
  ##| stop
  use_synth :tech_saws
  play :eb2, release: 0, note_slide: 0.1, sustain: 4 do |s|
    sleep 1
    control s, note: :eb2+7
    sleep 1
    control s, note: :eb2+10
    sleep 1
    control s, note: :eb2+5
  end
  sleep 4
end

live_loop :s2, sync: :met do
  ##| stop
  use_synth_defaults amp: 0.15
  use_synth :dpulse
  
  key = :eb2
  
  play key, release: 0, note_slide: 0.1, sustain: 4 do |s|
    sleep 1
    control s, note: key+7
    sleep 1
    control s, note: key+10
    sleep 1
    control s, note: key+5
  end
  ##| key = key+7
  ##| play key, release: 0, note_slide: 0.1, sustain: 4 do |s|
  ##|   sleep 1
  ##|   control s, note: key+7
  ##|   sleep 1
  ##|   control s, note: key+10
  ##|   sleep 1
  ##|   control s, note: key+5
  ##| end
  sleep 4
end

live_loop :s3, sync: :met do
  stop
  use_synth_defaults amp: 0.4, cutoff: 100
  with_fx :reverb, mix: 0 do
    
    use_synth :tech_saws
    
    key = :eb5
    
    play key, note_slide: 0.2, sustain: 6, release: 1 do |s|
      sleep 2
      control s, note: key
      sleep 1
      control s, note: key+10
      sleep 0.5
      control s, note: key+5
      sleep 0.25
      control s, note: key+7
      sleep 0.25
      sleep 2
      control s, note: key-12-5
    end
    sleep 6
    
    sleep 1
    play key-5, note_slide: 1, sustain: 1, release: 0 do |s|
      control s, note: key
    end
    sleep 1
    
    play key, note_slide: 0.2, sustain: 6, release: 2 do |s|
      sleep 2
      control s, note: key
      sleep 1
      control s, note: key+10
      sleep 0.5
      control s, note: key+5
      sleep 0.25
      control s, note: key+12
      sleep 0.25
      sleep 2
    end
    sleep 8
  end
end

live_loop :amen, sync: :met  do
  sample :loop_amen_full, beat_stretch: 8
  sleep 8
  
  sample :loop_amen_full, beat_stretch: 8, start: 0, finish: 0.75
  sleep 6
  sleep 2
end

live_loop :drum_splash, sync: :met do
  sample :drum_splash_soft
  sleep 16
end
