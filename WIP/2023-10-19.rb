## Inspire from: https://youtu.be/D1gbRvvRFmk?si=eClZB281gUhu8Sw5&t=844

live_loop :met do
  sleep 0.5
end

live_loop :kick, sync: :met do
  a = 1
  
  sample :bd_tek, amp: a, lpf: 110
  sleep 0.5
end

live_loop :hat, sync: :met do
  ##| stop
  sleep 0.5
  sample :hat_bdu
  sleep 0.5
end

live_loop :name, sync: :met do
  
  play chord(:f3, :m7)
  sleep 1.75
  
  play chord(:f3, :m7)
  sleep 1
  
  play chord(:f3+2, :m7)
  sleep 1
  sleep 0.25
  
  play chord(:eb3, :M7)
  sleep 1.75
  
  play chord(:eb3, :M7)
  sleep 1
  
  play chord(:d3, :m7).last, amp: 0.5
  sleep 1.25
  
end