live_loop :met1 do
  sleep 1
end

# 軽い音のスネア（clapにも使えそう？）
with_fx :reverb, mix: 0.1, room: 0.2 do
  live_loop :clap, sync: :met1 do
    ##| stop
    a = 0.75
    co = 110
    at = 0.00
    r = 3
    sleep 0.5
    sample :sn_generic, rate: r+1, cutoff: co, amp: a, attack: at
    sample :sn_generic, rate: r, start: 0.02, cutoff: co, pan: 0.2, amp: a, attack: at
    sleep 0.5
  end
end
