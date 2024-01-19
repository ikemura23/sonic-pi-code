live_loop :met do
  sleep 1
end

live_loop :s, sync: :met do
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
