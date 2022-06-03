

live_loop :bd do
    sleep 0.5
    sample :bd_tek, cutoff: 130, amp: 1
    
  end
  
  live_loop :base, sync: :bd do
    _release = [0.125, 0.25, 0.375, 0.25]
    cd = chord(:a1, :madd4).shuffle
    use_synth :dsaw
    
    use_random_seed 800
    
    with_fx :reverb do
      4.times do
        play cd.tick, release: 0.2
        sleep _release.look
      end
    end
  end
  