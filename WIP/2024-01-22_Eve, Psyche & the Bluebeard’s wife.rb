# Eve, Psyche & the Bluebeard’s wife
# from https://www.youtube.com/watch?v=HxTT79biO5U
use_bpm 72

live_loop :met do
  sleep 0.5
end

live_loop :kick, sync: :met do
  use_sample_defaults amp: 1.2, lpf: 90
  
  sample :bd_tek # :bd_haus :bd_tek :bd_ada
  sleep 0.5
  sample :bd_tek
  sleep 0.5
  
  sample :bd_tek
  sleep 0.375
  sample :bd_tek
  sleep 0.375
  sample :bd_tek
  sleep 1-0.375*2
end


live_loop :synth_1, sync: :met do
  
  use_synth :sine
  use_synth_defaults release: 0, sustain: 0.25
  
  key = :g3
  inv = 0
  chords = [
    chord(key, :m7, invert: inv),
    chord(key+3, :m7, invert: inv),
    chord(key+5, :m7, invert: inv),
    chord(key+5, :m7, invert: inv)
  ]
  
  with_fx :reverb, mix: 0.5, room: 0.5, mix: 0 do
    4.times do
      c = chords.tick
      ##| c = cd.take_last(3)
      play c
      sleep 0.5
      play c
      sleep 0.5
      
      play c
      sleep 0.375
      play c
      sleep 0.375
      play c
      sleep 1-0.375*2
    end
  end
  
end

live_loop :vocal_melody, sync: :met do
  
  use_synth :dsaw
  use_synth_defaults release: 0.1, sustain: 0.25, amp: 0.7
  
  key = :g3
  
  with_fx :reverb, mix: 0.5, room: 0.5, mix: 0.8 do
    7.times do
      
      play key
      sleep 0.5
    end
    play key+1
    sleep 0.5
  end
  
end


live_loop :bass, sync: :met do
  
  use_synth :beep
  use_synth_defaults release: 0, sustain: 0.5
  
  key = :eb2
  inv = 0
  keys = [
    key,
    key+3,
    key+5,
    key+5,
  ]
  
  with_fx :reverb, mix: 0.5, room: 0.5, mix: 0 do
    4.times do
      c = keys.tick
      play c
      sleep 0.5
      play c
      sleep 0.5
      
      play c
      sleep 0.375
      play c
      sleep 0.375
      play c
      sleep 1-0.375*2
    end
  end
  
end

