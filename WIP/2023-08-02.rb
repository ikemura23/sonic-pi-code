# https://music.youtube.com/watch?v=74xfpObex9k&feature=share

use_bpm 60

live_loop :back_chord do
  ##| stop
  use_synth :dsaw
  use_synth_defaults release: 3, amp: 1, cutoff: 70
  
  play chord(:d3, :M7)
  sleep 4
  play chord(:cs3, :m7)
  sleep 2
  play chord(:fs3, :m7)
  sleep 2
end

live_loop :bass do
  use_synth :beep
  use_synth_defaults release: 0
  
  play chord(:d2, :M7)[1], sustain: 0.5, release: 0.2
  sleep 1.5
  play chord(:d2, :M7)[2], sustain: 0.25
  sleep 0.25
  play chord(:d2, :M7)[3], sustain: 0.25
  sleep 0.25
  
  sleep 2
  
  play chord(:cs2, :m7)[1], sustain: 0.5
  sleep 2
  play chord(:fs2, :m7)[1], sustain: 0.5
  sleep 2
end


live_loop :sample_amen do
  sample :loop_amen_full, beat_stretch: 8*2, amp: 0.7
  sleep 8*2
end