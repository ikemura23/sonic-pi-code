# 音を配列でもたせて、休符と音階を視覚的にも見やすく管理するスニペット

live_loop :met do
  sleep 0.5
end

# Synth ########################

live_loop :synth_1, sync: :met do
  ##| stop
  
  default_release = 0.2
  default_cutoff = 90
  
  use_synth :dsaw
  use_synth_defaults release: default_release,
    cutoff: default_cutoff, amp: 1.2
  
  a_M7  = chord(:a3, :M7)
  ab_m7 = chord(:ab3, :m7)
  bb_m7 = chord(:bb3, :m7)
  fs_M7 = chord(:fs3, :M7)
  
  notes = [
    a_M7, 0,0,a_M7,
    0, 0, 0, 0,
    a_M7, 0,0,ab_m7,
    0, 0, 0, 0,
    bb_m7, 0, 0, 0,
    0, 0, bb_m7, 0,
    0, 0, 0, 0,
    fs_M7, 0, 0, 0,
  ]
  
  fx_echo_mix    = 0.0
  fx_reverb_mix  = 0.2
  fx_reverb_room = 0.5
  
  with_fx :echo, decay: 2, phase: 0.25, mix: fx_echo_mix do
    with_fx :reverb, mix: fx_reverb_mix,
    room: fx_reverb_room do
      
      notes.each do |note|
        play note if note != 0
        sleep 0.125
      end
      
    end
  end
end
