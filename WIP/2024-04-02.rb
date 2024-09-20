## Inspire : COMPUTER DATA - stress https://www.youtube.com/watch?v=m4NM88zjvGc


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
  
  live_loop :synty, sync: :met do
    ##| stop
    use_synth_defaults release: 2
    
    play chord(:bb3, :m7)
    sleep 2
    
    play chord(:ab3, :M7)
    sleep 2
    
    play chord(:a3, :m7)
    sleep 2
    
    play chord(:f3, :M7)
    sleep 2
    
  end
  
  live_loop :bass, sync: :met do
    
    use_synth_defaults release: 2
    use_synth :fm
    
    play :bb2
    sleep 2
    
    play :ab2
    sleep 2
    
    play :a2
    sleep 2
    
    play :f2
    sleep 2
    
  end