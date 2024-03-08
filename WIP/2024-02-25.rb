  # 2024-02-21 hybrids

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
    sleep 2
  end

  live_loop :glitch_perc, sync: :met do
    use_sample_defaults lpf: 70, amp: 1, finish: 0.12
    with_fx :reverb, mix: 0.7 do
      ##| if glitch_perc_play > 0 then
      sample :glitch_perc1, rate: 0.7
      sample :glitch_perc1, rate: 0.5
    end
    sleep 2
  end

  # Synth ################################################

  live_loop :synth1_tech_saws, sync: :met do
    ##| stop
    use_synth :tech_saws
    use_synth_defaults release: 0, note_slide: 0.1, sustain: 2
    
    key = :d2+5
    
    play key
    sleep 2
    play key+3
    sleep 2
    play key-2
    sleep 2
    play key-7
    sleep 2
  end


  live_loop :synth2, sync: :met do
    stop
    use_synth_defaults release: 0.05, sustain: 0.1, amp: 0.2
    use_synth :dsaw #:pluck
    
    key = :d4+5
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

  # ####################

  live_loop :synth3, sync: :met do
    ##| stop
    use_synth_defaults amp: 0.7, cutoff: 100, sustain: 0.5, release: 0.2
    use_synth :prophet #:supersaw
    
    with_fx :reverb, mix: 0.7 do
      
      key = :d4
      sleep 0.5
      
      play key-7, note_slide: 0.025, sustain: 1.5 do |s|
        sleep 0.5
        control s, note: key
        sleep 0.5
        control s, note: key+3
        sleep 0.5
      end
      sleep 1.5
      
      play key+3, note_slide: 0.025, sustain: 2 do |s|
        control s, note: key+3
        sleep 0.5
        control s, note: key+2
        sleep 0.5
        control s, note: key
        sleep 0.5
        control s, note: key-2
        sleep 0.5
      end
      sleep 2
      
      play key-2, note_slide: 0.025, sustain: 4 do |s|
        sleep 0.5
        control s, note: key
        sleep 0.5
        control s, note: key-2
        sleep 0.5
        control s, note: key-9
        sleep 0.5
        control s, note: key-7 #+5
        sleep 2
      end
      sleep 4
      
    end
  end

  live_loop :synth4, sync: :met do
    ##| stop
    use_synth_defaults amp: 1.5, cutoff: 100, sustain: 0.5, release: 0.2
    use_synth :hollow
    
    key = :d6
    
    with_fx :reverb, mix: 0.7 do
      with_fx :hpf, mix: 0.3 do
        
        sleep 0.5
        
        play key-7, note_slide: 0.025, sustain: 1.5 do |s|
          sleep 0.5
          control s, note: key
          sleep 0.5
          control s, note: key+3
          sleep 0.5
        end
        sleep 1.5
        
        play key+3, note_slide: 0.025, sustain: 2 do |s|
          control s, note: key+3
          sleep 0.5
          control s, note: key+2
          sleep 0.5
          control s, note: key
          sleep 0.5
          control s, note: key-2
          sleep 0.5
        end
        sleep 2
        
        play key-2, note_slide: 0.025, sustain: 4 do |s|
          sleep 0.5
          control s, note: key
          sleep 0.5
          control s, note: key-2
          sleep 0.5
          control s, note: key-9
          sleep 0.5
          control s, note: key-7 #+5
          sleep 2
        end
        sleep 4
      end
    end
  end


  # Base ################################################

  live_loop :base, sync: :met do
    ##| stop
    
    use_synth :fm
    use_synth_defaults release: 0, note_slide: 0.1, sustain: 2
    
    key = :d2+5
    
    play key
    sleep 2
    play key+3
    sleep 2
    play key-2
    sleep 2
    play key-7
    sleep 2
  end