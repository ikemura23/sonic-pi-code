# Coastal Fragrance - Zorrovian
# https://www.youtube.com/watch?v=nD5wqRGpGlk

# URLs Posted on SNS:
#  https://x.com/ikemura23/status/1878795684255777196
#  https://www.instagram.com/p/DExHYGwz2sN
#  https://bsky.app/profile/ikemura23.bsky.social/post/3lfmtprjxxc2o
#  https://youtu.be/aiO9qWF7tHo

use_bpm 80

drum_loops = "/Users/k_ikemura/Music/sonic_pi/Nuttah\ Jungle/EO_NutJngl_WAV_LOOPS/EO_NutJngl_Drum_Break_Loops"
percussion_loops = "/Users/k_ikemura/Music/sonic_pi/96 JUNGLE - VOL.2/E1_96JV2_Percussion_Loops"


live_loop :met do
  sleep 0.5
end

# Drum #############################


live_loop :dnb_drum_loops, sync: :met do
  ##| stop
  
  sample drum_loops, 3, beat_stretch: 16, amp: 1.5 #3 9
  sleep 16
end

live_loop :percussion_loops, sync: :met do
  ##| stop
  
  sample percussion_loops, 4, beat_stretch: 8, amp: 1
  sleep 8
end


# Synth ############################

live_loop :synth_1, sync: :met do
  ##| stop
  
  use_synth_defaults amp: 0.3, release: 3, cutoff: 110
  use_synth :dpulse
  
  times = 0.1
  
  with_fx :hpf, cutoff: 60 do
    with_fx :echo, phase: 1, decay: 2, mix: 0.2 do
      with_fx :reverb, mix: 0.6 do
        2.times do
          in_thread do
            play_pattern_timed chord(:f4, :m7, invert: 0), times
          end
          sleep 4
          
          in_thread do
            play_pattern_timed chord(:g4, :m7, invert: 0), times
          end
          sleep 2
          
          in_thread do
            play_pattern_timed chord(:bb4, :m7, invert: 0), times
          end
          sleep 2
        end
        
        #----
        2.times do
          in_thread do
            play_pattern_timed chord(:c5, :m7, invert: 0), times
          end
          sleep 4
          
          in_thread do
            play_pattern_timed chord(:g4, :m7, invert: 0), times
          end
          sleep 2
          
          in_thread do
            play_pattern_timed chord(:bb4, :m7, invert: 0), times
          end
          sleep 2
        end
      end
    end
  end
end

live_loop :synth_2, sync: :met do
  ##| stop
  
  use_synth_defaults amp: 1.5, release: 4, sustain: 0, cutoff: 80
  use_synth :dtri
  
  
  2.times do
    play chord(:f2, :m7, invert: 3)
    sleep 4
    
    play chord(:g2, :m7, invert: 3), release: 3
    sleep 2
    
    play chord(:bb2, :m7, invert: 3), release: 3
    sleep 2
  end
  
  2.times do
    play chord(:c3, :m7, invert: 3)
    sleep 4
    
    play chord(:g2, :m7, invert: 3), release: 3
    sleep 2
    
    play chord(:bb2, :m7, invert: 3), release: 3
    sleep 2
  end
end

# Hollow --------------------

live_loop :hollow, sync: :met do
  ##| stop
  use_synth :hollow
  use_synth_defaults sustain: 2, amp: 3
  
  2.times do
    play chord(:f4, :m7), sustain: 4
    sleep 4
    
    play chord(:g4, :m7)
    sleep 2
    
    play chord(:bb4, :m7)
    sleep 2
  end
  
  2.times do
    play chord(:c5, :m7), sustain: 4
    sleep 4
    
    play chord(:g4, :m7)
    sleep 2
    
    play chord(:bb4, :m7)
    sleep 2
  end
end


# bass ###########################

live_loop :bass, sync: :met do
  ##| stop
  use_synth_defaults amp: 1.5, release: 0.2, sustain: 0.1
  
  use_synth :beep
  
  sleep 2
  
  key = :f2
  
  play key, sustain: 0.75, note_slide: 0.75 do |s|
    control s, note: key-2
  end
  sleep 0.75
  
  play key-5, sustain: 4-0.75, note_slide: 4-0.75 do |s|
    control s, note: key-12
  end
  sleep 4-0.75
  
  sleep 2
end
