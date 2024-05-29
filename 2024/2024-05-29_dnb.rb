# 2024-05-29 Atmosphere dnb

drum_loops = "/Users/k_ikemura/Music/sonic_pi/96 JUNGLE - VOL.2/E1_96JV2_Drum_Breaks"
percussion_loops = "/Users/k_ikemura/Music/sonic_pi/96 JUNGLE - VOL.2/E1_96JV2_Percussion_Loops"
chord_loops = "/Users/k_ikemura/Music/sonic_pi/96 JUNGLE - VOL.2/E1_96JV2_Chord_Loops"
bass_loops = "/Users/k_ikemura/Music/sonic_pi/96 JUNGLE - VOL.2/E1_96JV2_Bass_Loops"
melodic_loops = "/Users/k_ikemura/Music/sonic_pi/96 JUNGLE - VOL.2/E1_96JV2_Melodic_Loops"

##| use_bpm 68

live_loop :met do
  sleep 0.5
end

live_loop :drum_loops, sync: :met do
  ##| stop
  #5 7
  sample drum_loops, 5, beat_stretch: 6
  sleep 6
  
end

live_loop :percussion_loops, sync: :met do
  ##| stop
  # 0 3 4 5 11 12
  sample percussion_loops, 4, beat_stretch: 6, amp: 0.8
  sleep 6
end


live_loop :melodic_loops, sync: :met do
  stop
  # 19 21
  sleep 0
  sample melodic_loops, 21, beat_stretch: 12, amp: 1
  sleep 12
end


live_loop :chord_loops, sync: :met do
  ##| stop
  # 0 15 25 28
  sample chord_loops, 25, beat_stretch: 12, amp: 2
  sleep 12
end

live_loop :bass_loops, sync: :met do
  ##| stop
  sample bass_loops, 15, beat_stretch: 12, amp: 3
  sleep 12
end
