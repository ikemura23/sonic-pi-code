## Inspire https://music.youtube.com/watch?v=At6454ey7Pc&si=vD3r9TAB__CVtHpP
drum_loops = "/Users/k_ikemura/Music/sonic_pi/96 JUNGLE - VOL.2/E1_96JV2_Drum_Breaks"
percussion_loops = "/Users/k_ikemura/Music/sonic_pi/96 JUNGLE - VOL.2/E1_96JV2_Percussion_Loops"

use_bpm 80

live_loop :met do
  sleep 0.5
end

live_loop :kick, sync: :met do
  a = 1
  use_sample_defaults lpf: 100, amp: 1
  s = :bd_tek
  sample s
  sleep 0.5
  sleep 0.25
  sample s
  sleep 2-0.5-0.25
  
  sample s
  sleep 1
  sample s
  sleep 1
end

live_loop :drum_loops, sync: :met do
  ##| stop
  
  loops = [16, 17] # 16, 17
  sample drum_loops, loops.tick, beat_stretch: 16, amp: 1.2
  sleep 16
end

live_loop :percussion_loops, sync: :met do
  ##| stop
  # 11 12
  sample percussion_loops, 12, beat_stretch: 8, amp: 0.4
  sleep 8
end

live_loop :percussion_loops2, sync: :met do
  stop
  sample :drum_cymbal_soft, amp: 0.5
  sleep 0.25
  sample :drum_cymbal_soft, amp: 0.2
  sleep 0.25
end


live_loop :synth1, sync: :met do
  ##| stop
  use_synth_defaults release: 2, amp: 0.8, attack: 0.05
  use_synth :saw
  
  with_fx :lpf, cutoff: 85 do
    
    play chord(:f3, :M7), release: 6
    sleep 7
    
    play chord(:g3, :M7), release: 1.25
    sleep 0.75
    
    play chord(:a3, :M), release: 7
    sleep 8+0.25
  end
end

live_loop :synth2, sync: :met do
  ##| stop
  use_synth_defaults amp: 0.4
  use_synth :dsaw
  
  with_fx :lpf, cutoff: 80 do
    with_fx :wobble, phase: 7, invert_wave: 0 do
      play chord(:f3, :M7), release: 7, attack: 1
      sleep 7
    end
    
    play chord(:g3, :M7), release: 1.25
    sleep 0.75
    
    with_fx :wobble, phase: 8, invert_wave: 0 do
      play chord(:a3, :M), release: 8, attack: 1
      sleep 8+0.25
    end
  end
end

live_loop :synth3, sync: :met do
  ##| stop
  use_synth_defaults release: 1, amp: 0.2
  use_synth :dpulse
  
  sleep 8
  
  cd = chord(:a4, :M7, invert: -1)
  with_fx :echo, phase: 1, decay: 10 do
    cd.size.times do
      play cd.tick
      sleep 0.25
    end
  end
  sleep 7
end

live_loop :bass, sync: :met do
  ##| stop
  use_synth_defaults release: 1,attack_level: 2, amp: 2
  use_synth :beep
  keys = [:f1, :a1]
  2.times do
    key = keys.tick
    2.times do
      play key
      sleep 0.5
      sleep 0.25
      
      play key+7
      sleep 2-0.5-0.25
      
      play key
      sleep 0.5
      sleep 0.25
      play key+7
      sleep 0.25
      
      play key+7
      sleep 1
    end
  end
end
