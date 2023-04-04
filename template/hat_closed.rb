hat_play = 1

live_loop :met do
  sleep 1
end

live_loop :hhc1, sync: :met do
  if hat_play < 1 then stop end
  with_fx :hpf, cutoff: 100, amp: 0.8 do
    sample :drum_cymbal_closed, amp: 0.2, rate: 1
    sleep 0.125
    sleep 0.125
    sample :drum_cymbal_closed, amp: 1.2, rate: 1
    sleep 0.125
    sleep 0.125
  end
end