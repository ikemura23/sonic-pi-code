  live_loop :drum_bd do
    sample :bd_haus, cutoff: 130
    sleep 0.5
  end
  
  drum = "/Users/k_ikemura/Documents/sonic_pi/drum"
  live_loop :drum, sync: :drum_bd do
    sample drum, 8, beat_stretch: 4, lpf: 130, amp:1
    sleep 4
  end
  
  noise = "/Users/k_ikemura/Documents/sonic_pi/noise"
  live_loop :noise, sync: :drum_bd do
    ##| sample noise, 1, beat_stretch: 4
    sleep 4
  end
  
  bass_loops = "/Users/k_ikemura/Documents/sonic_pi/bass_loops"
  live_loop :bass, sync: :drum_bd do
    sample bass_loops, 5, beat_stretch: 4, amp: 1.5
    sleep 4
  end
  
  ##| rand beet========================
  cd = :d2
  
  live_loop :ef2, sync: :drum_bd do
    tick
    synth :zawa, wave: 1, phase: 0.25, release: 5, note:(knit cd,12, cd,4).look, cutoff: (line 60, 120, steps: 6).look, amp: 0.5
    sleep 4
  end
  
  live_loop :mero, sync: :drum_bd do
    with_fx :reverb, room: 0.3 do
      with_fx :echo do
        use_random_seed 87800
        with_fx :bitcrusher do
          with_fx :wobble, phase: 16, invert_wave: 1 do
            use_synth :dsaw
            ns = (scale cd, :major, num_octaves: 3)
            64.times do
              tick
              play ns.choose, detune: (ring 12, -24, -36).choose, release: rrand(0, 0.2), amp: rand + 0.5, cutoff: rrand(70, 120), amp: 0.7
              sleep 0.125
            end
          end
        end
      end
    end
  end