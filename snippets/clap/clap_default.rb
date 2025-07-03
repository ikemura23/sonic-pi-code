live_loop :met do
    sleep 0.5
end

live_loop :snare_loop, sync: :met do
    ##| stop
    co = 100
    at = 0.00
    r=4
    a=1
    
    sleep 0.5
    
    sample :sn_generic, rate: r+1, cutoff: co, amp: a, attack: at
    sample :sn_generic, rate: r, start: 0.02, cutoff: co, pan: 0.2, amp: a, attack: at
    
    sleep 0.5
end