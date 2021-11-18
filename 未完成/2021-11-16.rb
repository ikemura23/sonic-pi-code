use_bpm 55 #50 60
drum = "/Users/k_ikemura/Music/sonic_pi/LCA_drum loops"

live_loop :industry do
  sample drum, 3, beat_stretch: 8, cutoff: 130, amp: 0.5
  sleep 8
end

live_loop :chord2 do
  cd = [:c2, :g1].ring
  c = cd.tick
  use_synth :sine # :sine :dsaw
  play c, release: 4, release: 4
  play chord(c+24,:M7),release: 4
  
  sleep 4
end

base_cd = [:c2, :g1].ring

live_loop :base do
  
  c = base_cd.tick
  
  with_fx :bitcrusher do
    use_synth :saw # :saw :chiplead
    2.times do
      sleep 0.25
      
      play c, release: 0.25
      sleep 0.25
      sleep 0.25
      play c, release: 0.25
      sleep 0.25
      play c, release: 0.125
      sleep 0.125
      play c+12, release: 0.25
      sleep 0.25
      play c, release: 0.25
      sleep 0.25
      sleep 0.375
    end
  end
end

live_loop :pico do
  use_synth :dpulse
  
  cd = chord_invert(chord(:g5, :sus2),0)
  cl = [cd.last, cd.first, cd[1], cd.first]
  
  play cl.tick, release: 0.25, amp: 0.4
  sleep 0.5
  
end
