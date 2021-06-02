# Arch Echo / MEASURE OF A LIFE の 3:50のフレーズのコピー

## ドラム
live_loop :bd do
    sample :drum_cymbal_soft, amp: 0.4
    sleep 1
  end
  
  live_loop :loop_amen, sync: :bd do
    sample :loop_amen, beat_stretch: 4
    sleep 4
  end
  
  ## コード和音
  chords = [
    (chord :F3, :M), (chord :G3, :M), (chord :E3, :m), (chord :F3, :M),
    (chord :F3, :M), (chord :G3, :M),
    (chord :C3, :sus4), (chord :C3, :M)
  ].ring
  
  live_loop :chord ,sync: :bd do
    tick
    
    synth :fm, note: chords.look[0]-12, release: 2
    use_synth :dsaw
    play chords.look, release: 2, cutoff: 70, amp: 1.2
    sleep 2
  end
  
  notes = [72, 76, 74,
           71, 74, 72,
           72, 76, 74,
           72, 74, 72].ring
  
  ##| メロディ ピアノ
  live_loop :melody, sync: :bd do
    use_synth :piano
    ##| use_random_seed 100
    
    with_fx :reverb, room: 1 do
      with_fx :reverb, room: 1 do
        
        3.times do
          play notes.tick ,amp:2
          sleep 1.5
          play notes.tick ,amp:2
          sleep 0.5
          play notes.tick ,amp:2
          sleep 2
        end
      end
    end
  end
  
  