# Arch Echo の My Heart Sometimes の4:20くらいのフレーズをコピった

## ドラム
live_loop :bd do
    ##| sample :bd_haus, amp: 1, lpf: 80
    sleep 0.5
  end
  
  live_loop :cymbal_close, sync: :bd  do
    sleep 0.25
    ##| sample :drum_cymbal_closed, amp: 0.4,  hpf: 118, attack: 0.02, rate: 1.4
    sleep 0.25
  end
  
  # cymbal ride
  live_loop :cymbal_soft, sync: :bd do
    sample :drum_cymbal_soft, amp: 0.4
    sleep 1
  end
  
  # sample drum
  live_loop :loop_amen, sync: :bd do
    sample :loop_amen, beat_stretch: 4
    sleep 4
  end
  
  ## コード和音
  chords = [(chord :E3, :M), (chord :Eb3, :m), (chord :Ab3, :m), (chord :Gb3, :M)].ring
  ##| chords = [(chord :Ab3, :maj9)].ring
  live_loop :chord ,sync: :bd do
    tick
    
    use_synth :dsaw
    # code
    play chords.look, release: 4, cutoff: 70, amp: 1.2
    # base
    synth :fm, note: chords.look[0]-12, release: 4
    sleep 4
  end
  
  
  p_ns1 = [59, 58, 47, 54, 61]
  p_ns2 = [59, 58, 54, 47, 59, 58, 54, 61].ring
  
  
  ##| メロディ ピアノ
  live_loop :melody, sync: :bd do
    use_synth :piano
    
    use_random_seed 100
    
    with_fx :reverb, room: 0.5 do
      with_fx :reverb, room: 1 do
        
        ns = (scale :D5, :marva, num_octaves: 1)
        4.times do
          play p_ns2.tick + 24
          sleep [0.5, 0.25].choose
        end
      end
    end
  end
  
  ##| ピコピコ
  live_loop :pico, sync: :bd do
    use_random_seed 7000 # 3000 4000 7000
    use_synth :dpulse #:dpulse :pulse :dsaw
    r = 0.125 # 0.125, 0.2 ~ 0.4
    with_fx :reverb, room:1 do
      16.times do
        ##| play p_ns1.choose+12 , release: r, amp: rrand(0.3, 0.5)
        sleep 0.125
      end
    end
  end