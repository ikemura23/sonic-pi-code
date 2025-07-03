# pattern 1

live_loop :met do
  sleep 0.5
end

live_loop :kick, sync: :met do
  
  use_sample_defaults amp: 1.1, lpf: 90
  n = :bd_tek # :bd_haus :bd_tek :bd_ada
  
  7.times do
    sample n
    sleep 0.5
  end
  
  sample :bd_tek, amp: 0.8
  sleep 0.25
  
  sample n
  sleep 0.25
  
  6.times do
    sample n
    sleep 0.5
  end
  
  sample n
  sleep 0.25
  sample n, amp: 0.8
  sleep 0.25
  
  sample n
  sleep 0.5
end