use_bpm 75
use_debug false
drum = "/Users/k_ikemura/Music/sonic_pi/drum"
noise = "/Users/k_ikemura/Music/sonic_pi/noise"
voice = "/Users/k_ikemura/Music/sonic_pi/voice"

live_loop :bd do
  sample :bd_haus, amp: 1, lpf: 130
  sleep 0.5
end

live_loop :samples, sync: :bd do
  sample drum, 8, beat_stretch: 4, amp: 1
  sample noise, 0, beat_stretch: 4, amp: 0.8
  sleep 4
end


cd = :E1+0
list = [cd+2,cd+1,cd+2,cd-2]

live_loop :bass, sync: :bd do
  
  with_fx :reverb, room: 0.8 do
    
    use_synth :dsaw
    with_fx :bitcrusher do
      36.times do
        2.times do
          2.times do
            play cd, release: 0.2
            sleep 0.25
            play cd, release: 0.2
            sleep 0.125
            play cd, release: 0.2
            sleep 0.125
            play cd, release: 0.2
            sleep 0.125
            play cd+12, release: 0.2
            sleep 0.125
            play cd, release: 0.2
            sleep 0.125
            play cd, release: 0.2
            sleep 0.125
          end
        end
        
        cd = (ring cd+2,cd+1,cd+2,cd-2).tick
        
        puts(cd)
        if cd == 42 then cd = :E1+2 end
      end
      
    end
  end
end
