# 2024-02-21 CyberPunk song

use_bpm 40

live_loop :met do
  sleep 1
end
# Drum ########################

live_loop :amen, sync: :met  do
  sample :loop_amen_full, beat_stretch: 8
  sleep 8
  
  sample :loop_amen_full, beat_stretch: 8, start: 0, finish: 0.75+0.125
  sleep 8
end

live_loop :drum_splash, sync: :met do
  sample :drum_splash_soft
  sleep 8
end

# Synth ################################################

live_loop :synth1, sync: :met do
  ##| stop
  use_synth :tech_saws
  use_synth_defaults release: 0, note_slide: 0.1, sustain: 4
  
  key = :as2
  
  play key-4 do |s|
    sleep 1.5
    control s, note: key-2
    sleep 0.5
    control s, note: key
    sleep 2
  end
  sleep 4
  
  play key+3 do |s|
    sleep 1.5
    control s, note: key+5
    sleep 0.5
    control s, note: key-2
    sleep 2
  end
  sleep 4
  
end

live_loop :synth2, sync: :met do
  ##| stop
  use_synth_defaults release: 0.05, sustain: 0.1, amp: 0.2
  use_synth :dsaw #:pluck
  
  key = :as4
  keys = [
    key,
    key-5,
    key-2,
    key-7,
  ]
  
  with_fx :reverb, mix: 0.7 do
    with_fx :echo, mix: 0.3 do
      keys.size.times do
        play keys.tick
        sleep 0.125
      end
    end
  end
end


live_loop :synth3, sync: :met do
  stop
  use_synth_defaults amp: 0.4, cutoff: 100
  use_synth :prophet #:supersaw
  
  with_fx :reverb, mix: 0.5 do
    
    key = :as4
    
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
    play key-5, note_slide: 1, sustain: 3, release: 0 do |s|
      control s, note: key
    end
    sleep 3
    
    play key, note_slide: 0.2, sustain: 5, release: 2 do |s|
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
  sleep 16
end

# Base ################################################

live_loop :base, sync: :met do
  ##| stop
  use_synth :fm
  use_synth_defaults release: 0.01, sustain: 0.1, amp: 0.7
  
  key = :as2
  
  2.times do |i|
    12.times do
      play key-4
      sleep 0.125
    end
    4.times do
      play key-2
      sleep 0.125
    end
    16.times do
      play key
      sleep 0.125
    end
    
    12.times do
      play key+3
      sleep 0.125
    end
    4.times do
      play key+5
      sleep 0.125
    end
    if i == 0 then
      16.times do
        play key-2
        sleep 0.125
      end
    else
      8.times do
        play key-2
        sleep 0.125
      end
      sleep 0.125*8
    end
  end
end