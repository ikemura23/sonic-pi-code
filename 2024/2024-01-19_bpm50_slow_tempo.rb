use_bpm 50

clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"


live_loop :met do
  sleep 0.5
end

live_loop :loop_amen, sync: :met do
  with_fx :reverb, mix: 0.7, room: 0.8 do
    sample :loop_breakbeat, beat_stretch: 4, amp: 1
    sleep 4
  end
end

live_loop :long_clap, sync: :met  do
  ##| sleep 3
  sleep 1
  with_fx :reverb, mix: 0.9,room: 0.9 do
    sample clap, 0, amp: 1.2, beat_stretch: rrand(1.5,2), rate: rrand(1.5, 2)
  end
  sleep 3
end

live_loop :synt_hollo, sync: :met do
  ##| stop
  use_synth_defaults amp: 5, sustain: 2.5, release: 1 , attack: 0.5
  use_synth :hollow
  
  play chord(:f3, :M7)
  sleep 4
  
  play chord(:f3-1, :m7)
  sleep 4
end

live_loop :synt_hollo2, sync: :met do
  ##| stop
  use_synth_defaults amp: 2, sustain: 4
  use_synth :hollow
  
  play chord(:f4, :M7)
  sleep 4
  
  play chord(:f4-1, :m7)
  sleep 4
end

live_loop :synt_saw, sync: :met do
  stop
  use_synth_defaults amp: 0.9, sustain: 2.5, release: 1 , attack: 0.5
  use_synth :dsaw
  
  with_fx :lpf, cutoff: 60 do
    play chord(:f2, :M7)
    sleep 4
    
    play chord(:f2-1, :m7)
    sleep 4
  end
  
end

live_loop :piano, sync: :met do
  ##| stop
  use_random_seed 876
  
  c = (chord(:c5, :M).to_a.push chord(:c5, :M).first+2).shuffle
  use_synth :piano
  use_synth_defaults amp: 0.7
  
  with_fx :reverb, mix: 0.7, room: 1 do
    2.times do
      
      play c.tick
      sleep 1.5
      2.times do
        play c.tick
        sleep 0.25
      end
    end
  end
  
end

live_loop :rhodey, sync: :met do
  ##| stop
  use_random_seed 987
  c = (chord(:c3, :M, invert: 2).to_a.push chord(:c3, :M).first+2).shuffle
  use_synth :rhodey
  use_synth_defaults amp: 0.2
  with_fx :reverb, mix: 0.7, room: 0.9 do
    3.times do
      play c.tick
      sleep 0.5
    end
    
    2.times do
      play c.tick
      sleep 0.25
    end
    
  end
  
end