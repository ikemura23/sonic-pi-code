# dsaw

live_loop :met do
  sleep 1
end

# mero ---------------
live_loop :kick, sync: :met do
  sample :bd_tek, amp: 1
  sleep 0.5
end

live_loop :mero1, sync: :met do
  
  with_fx :reverb, mix: 0.5, room: 0.5 do
    with_fx :wobble, phase: 0.5, wave: 0, mix: 0.7 do
      ##| sleep 1
      sleep 0.75
      c = chord(:e4-7, :sus4, invert: [-1,0,0,1,2].choose)
      synth :dsaw, note: c, release: 0.25, amp: 1.4, cutoff: rrand(70, 90)
    end
    sleep 0.25
    sleep 0.375
    
    with_fx :wobble, phase: 0.125, wave: 0, mix: 0.5 do
      c = chord(:e5, :sus2, invert: [0,1,2].choose)
      synth :dpulse, note: c, release: 0.25, amp: 1.2, cutoff: rrand(40, 60)
      sleep 2-0.75-0.25-0.375
    end
  end
end
