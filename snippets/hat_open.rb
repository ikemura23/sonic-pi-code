cymbal_open_flag = 1

live_loop :met do
  sleep 1
end

live_loop :cymbal_open, sync: :met do
  if cymbal_open_flag < 1 then stop end
  sleep 0.25
  sample :drum_cymbal_open, amp: 0.25, beat_stretch: 1.8, finish: 0.125, hpf: 90#, rate: 1.1
  sleep 0.25
end