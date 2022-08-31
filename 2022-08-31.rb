use_bpm 62

effect = -3

live_loop :met do
  sleep 1
end


live_loop :kick, sync: :met do
  ##| stop
  a = 1.5
  sample :bd_tek, amp: a, cutoff: 130
  sleep 0.5
end

define :pattern do |pattern|
  return pattern.ring.tick == "x"
end

live_loop :mero, sync: :met do
  
  a = 1
  al = 0
  use_synth :saw
  
  with_fx :hpf, cutoff: 30 do
    with_fx :slicer, phase: 0.375 do
      
      c1 = chord(:b3, :m9, invert: -1)
      c2 = chord(:b3, :m9, invert: -3)
      c3 = chord(:b3, :M7, invert: -2)
      
      play c1, sustain: 2.1, release: 0, amp: a
      sleep 2.1
      play c2, sustain: 0.9, release: 0, amp: a
      control
      sleep 0.9
      play c3, sustain: 1, release: 0, amp: a
      sleep 1
    end
    
    with_fx :slicer, phase: 0.375 do
      
      c1 = chord(:b3, :m9, invert: -1)
      c2 = chord(:b3, :M7, invert: 3)
      c3 = chord(:b3, :m7, invert: 2)
      
      play c1, sustain: 2.1, release: 0, amp: a
      sleep 2.1
      play c2, sustain: 0.9, release: 0, amp: a
      sleep 0.9
      play c3, sustain: 1, release: 0, amp: a
      sleep 1
    end
    
  end
end

