use_bpm 62

effect = -3

live_loop :met do
  sleep 1
end

define :pattern do |pattern|
  return pattern.ring.tick == "x"
end

live_loop :mero, sync: :met do
  ##| c1 = chord(:b3+effect, :maj9, invert: -1)
  ##| c2 = chord(:b3-2+effect, :maj9, invert: -1)
  
  ##| s = :saw
  a = 3
  al = 0
  use_synth :dsaw
  
  with_fx :hpf, cutoff: 50 do
    c1 = chord(:b3, :maj9, invert: -1)
    p1 = "x--x--x--x--x--x--"
    p1.length.times do
      play c1, sustain: 0.2, release: 0, attack: 0.03, amp: a if pattern p1
      sleep 0.125
    end
    
    c2 = chord(:b3, :m9, invert: -2)
    p2 = "x--x--"
    p2.length.times do
      play c2, sustain: 0.2, release: 0, attack: 0.03, amp: a if pattern p2
      sleep 0.125
    end
    
    c3 = chord(:b3, :maj9, invert: -2)
    p3 = "x--x--x-"
    p3.length.times do
      play c3, sustain: 0.2, release: 0, attack: 0.03, amp: a if pattern p3
      sleep 0.125
    end
  end
  
end
