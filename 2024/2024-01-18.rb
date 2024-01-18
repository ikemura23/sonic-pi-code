use_bpm 50


live_loop :met do
  sleep 0.5
end
live_loop :hat, sync: :met do
  ##| sample :hat_bdu
  sleep 1
end

live_loop :loop_amen, sync: :met do
  with_fx :reverb, mix: 0.7, room: 0.8 do
    sample :loop_breakbeat, beat_stretch: 4, amp: 1
    sleep 4
  end
end

live_loop :synt_hollo, sync: :met do
  ##| stop
  use_synth_defaults amp: 3, sustain: 2.5, release: 1 , attack: 0.5
  use_synth :hollow
  
  play chord(:f3, :M7)
  sleep 4
  
  play chord(:f3-1, :m7)
  sleep 4
end

live_loop :synt_saw, sync: :met do
  ##| stop
  use_synth_defaults amp: 0.6, sustain: 2.5, release: 1 , attack: 0.5
  use_synth :dsaw
  
  with_fx :lpf, cutoff: 60 do
    play chord(:f2, :M7)
    sleep 4
    
    play chord(:f2-1, :m7)
    sleep 4
  end
  
end



live_loop :piano, sync: :met do
  stop
  c = (chord(:c5, :M).to_a.push chord(:c5, :M).first+2).shuffle
  use_synth :piano
  use_synth_defaults amp: 0.8
  use_random_seed [1234,2000].tick
  
  4.times do
    with_fx :reverb, mix: 0.7, room: 1 do
      play c.tick
      sleep 1
    end
  end
  
end

live_loop :rhodey, sync: :met do
  ##| stop
  use_random_seed [987,879].tick
  c = (chord(:c3, :M, invert: 2).to_a.push chord(:c3, :M).first+2).shuffle
  use_synth :rhodey
  use_synth_defaults amp: 0.2
  with_fx :reverb, mix: 0.7, room: 0.9 do
    4.times do
      play c.tick
      sleep 0.25
    end
    sleep 0.25
    3.times do
      play c.tick
      sleep 0.25
    end
    sleep 0.25
    3.times do
      play c.tick
      sleep 0.25
    end
    sleep 1
  end
  
end