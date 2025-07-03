live_loop :met do
    sleep 1
  end
  
  ## drum ######################
  
  live_loop :kick, sync: :met do
    #use_sample_defaults amp: 1, lpf: 100
    sample :bd_tek
    sleep 0.5
  end
  
  
  live_loop :hat, sync: :met do
    
    sleep 0.25
    sample :drum_cymbal_closed
    sleep 0.25
    
  end