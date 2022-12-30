# 長く鳴らす

live_loop :met do
    sleep 1
  end
  
  live_loop :mero2, sync: :met do
    synth :hollow, note: chord(:e3, :sus4, invert: 0), release: 0, sustain: 8, amp: 2.5
    sleep 8
  end