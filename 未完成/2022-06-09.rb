live_loop :s do
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
  
  live_loop :amen do
    sample :loop_amen_full, beat_stretch: 8
    sleep 8
  end