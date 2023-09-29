# YUMEMI.apkのオープニング用
# しばらく再生させて、終了の意味で sleep 8 する
cd = :e3

live_loop :chord do
  use_synth :sine
  
  4.times do
    with_fx :slicer, phase: 0.375 do
      play chord(cd+12, :M7), sustain: 4, release: 0, amp: 0.5
      play chord(cd, :M7), sustain: 4, release: 0, amp: 0.5
      sleep 4
    end
  end
  sleep 8 ## 停止
end

live_loop :industry do
  sleep 4
  12.times do
    sample :loop_industrial, beat_stretch: 1, cutoff: 120, amp: 0.3
    sleep 1
  end
  sleep 8 ## 停止
end

live_loop :drum_bd do
  32.times do
    sample :bd_haus, lpf: 100
    sleep 0.5
  end
  sleep 8 ## 停止
end

live_loop :mero do
  sleep 8
  with_fx :reverb, room: 0.8 do
    with_fx :wobble, phase: 16, wave: 2, invert_wave: 1, amp: 1.5 do
      with_fx :bitcrusher, amp: 0.5 do
        
        use_synth :dsaw
        ns = (scale cd-24, :minor_pentatonic, num_octaves: 2)
        
        64.times do
          tick
          play ns.choose, detune: (ring 0,-12).choose, release: rrand(0.1, 0.2), amp: rand + 0.5, cutoff: rrand(70, 120)
          sleep 0.125
        end
      end
    end
  end
  sleep 8 ## 停止
end