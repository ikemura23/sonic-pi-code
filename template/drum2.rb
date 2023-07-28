kick_play = 1

hat_play = 1

######################

live_loop :met do
  sleep 1
end

## drum ######################

live_loop :kick, sync: :met do
  if kick_play < 1 then stop end
  use_sample_defaults amp: 1.1, lpf: 100
  
  4.times do
    sample :bd_tek
    sleep 0.5
  end
  sample :bd_tek
  sleep 0.5-0.125
  sample :bd_tek
  sleep 0.125
  sample :bd_tek
  sleep 0.5
  
  sample :bd_tek
  sleep 0.5
  
  sample :bd_tek
  sleep 0.25
  sample :bd_tek
  sleep 0.25
end


live_loop :hat, sync: :met do
  if hat_play < 1 then stop end
  sleep 0.25
  sample :drum_cymbal_closed
  sleep 0.25
  
end