# UMD - Trashiii & Zorrovian v2
# https://www.youtube.com/watch?v=qF5zqR072IE

use_bpm 82

drum_loops = "/Users/k_ikemura/Music/sonic_pi/Nuttah\ Jungle/EO_NutJngl_WAV_LOOPS/EO_NutJngl_Drum_Break_Loops"
percussion_loops = "/Users/k_ikemura/Music/sonic_pi/96 JUNGLE - VOL.2/E1_96JV2_Percussion_Loops"

live_loop :met do
  sleep 0.5
end

# Drum #############################

live_loop :kick, sync: :met do
  stop
  sample :bd_tek, amp: 1, lpf: 110
  sleep 0.5
end

live_loop :hat, sync: :met do
  stop
  sleep 0.25
  sample :hat_zap, lpf: 110
  sleep 0.25
  
end

live_loop :loop_amen, sync: :met do
  stop
  sample :loop_amen, beat_stretch: 2
  sleep 2
end

live_loop :drum_loops, sync: :met do
  ##| stop
  
  sample drum_loops, 27, beat_stretch: 16, amp: 2, start: 0, finish: 0.5
  sleep 8
end

live_loop :percussion_loops, sync: :met do
  ##| stop
  sample percussion_loops, 12, beat_stretch: 16, amp: 0.4
  sleep 16
end

live_loop :splash, sync: :met do
  
  sample :drum_splash_hard
  sleep 16
  
end

live_loop :name, sync: :met do
  use_synth :noise
  sleep 28
  play :c4, attack: 4
  sleep 4
  
end

# Synth #############################

live_loop :synth_1, sync: :met do
  ##| stop
  use_synth_defaults release: 1.5, amp: 0.6
  use_synth :dpulse
  
  with_fx :reverb, mix: 0.7, room: 0.8 do
    
    4.times do
      note = :c4+[-4,-4,-6,1].tick
      play note
      play note+12, amp: 0.2
      sleep 0.25
      
      play note+7
      sleep 0.25
      
      play note+14
      sleep 0.25
      
      play note+16
      sleep 0.25
      
      play note+23
      sleep 0.25
      
      sleep 4-0.25*5
    end
    
  end
end


live_loop :synth_2, sync: :met do
  ##| stop
  use_synth_defaults release: 0.25, attack: 0.5,sustain: 3.5, amp: 1.6
  use_synth :dsaw
  
  with_fx :reverb, mix: 0.7, room: 0.7 do
    with_fx :lpf, cutoff: 90, mix: 1 do
      with_fx :wobble, phase: 4, invert_wave: 1, mix: 0 do
        
        play chord(:cs3, :M7, invert: 0)
        sleep 4
        
        play chord(:cs3, :M7, invert: 0)
        sleep 4
        
        play chord(:eb3, :m7, invert: 0)
        sleep 4
        
        play chord(:bb2, :m7, invert: 0)
        sleep 4
        
      end
      
    end
  end
end


live_loop :synth_3, sync: :met do
  ##| stop
  use_synth_defaults release: 0.5, amp: 6
  use_synth :hollow
  
  play chord(:cs6, :M7)
  sleep 4
  
  play chord(:cs6, :M7)
  sleep 4
  
  play chord(:eb6, :m7)
  sleep 4
  
  play chord(:bb6, :m7)
  sleep 4
  
end

live_loop :synth_4, sync: :met do
  ##| stop
  use_synth_defaults release: 0.5, attack: 0.5, sustain: 3.5, amp: 1.5
  use_synth :supersaw
  
  with_fx :reverb, mix: 0.7, room: 0.8 do
    with_fx :hpf, cutoff: 50, mix: 1 do
      
      play chord(:f3, :m7)
      sleep 4
      
      play chord(:ab3, :M7)
      sleep 4
      
      play chord(:eb3, :m7)
      sleep 4
      
      play chord(:bb3, :m7)
      sleep 4
    end
  end
end

# Bass ############## ###############

live_loop :bass, sync: :met do
  ##| stop
  use_synth_defaults release: 1, sustain: 4, amp: 1.1
  use_synth :dsaw
  
  play :f1
  sleep 4
  
  play :ab1
  sleep 4
  
  play :eb1
  sleep 4
  
  play :bb1
  sleep 4
end