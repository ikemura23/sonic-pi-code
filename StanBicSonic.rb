# ドラマーStan Bicknellのフレーズ
# https://youtu.be/6IfVRa2xxwE?t=37

##| note = :M7
##| cd = :eb3

##| live_loop :cd do
##|   cd = [:eb3,:e3,:e3,:eb3,].ring.tick
##|   note = [:M7, '9',:M7,'9'].ring.tick

##|   sleep 1
##| end

live_loop :bass do
  use_synth :prophet
  cd = :eb3
  note = :M7
  play chord(cd, note),release: (1/2.0)
  sleep (1/3.0)
  play chord(cd, note),release: (1/2.0)
  sleep (2/3.0)
  sleep 0.5
  
  
  cd = :e3
  note = :'m'
  
  play chord(cd, note),release: (1/2.0)
  sleep (1/3.0)
  play chord(cd, note),release: (1/2.0)
  sleep (1/6.0)
  sleep 2
  
  cd = :e3
  note = :M7
  play chord(cd, note),release: (1/2.0)
  sleep (1/3.0)
  play chord(cd, note),release: (1/2.0)
  sleep (2/3.0)
  sleep 0.5
  
  note = :'5'
  
  play chord(cd, note),release: (1/2.0)
  sleep (1/3.0)
  play chord(cd, note),release: (1/2.0)
  sleep (1/6.0)
  sleep 2
  
  cd = :e3
  note = :'7+11'
  
  play chord(cd, note),release: (1/2.0)
  sleep (1/3.0)
  play chord(cd, note),release: (1/2.0)
  sleep (2/3.0)
  sleep 0.5
  
  play chord(cd, note),release: (1/2.0)
  sleep (1/3.0)
  play chord(cd, note),release: (1/2.0)
  sleep (1/6.0)
  sleep 2
  
  cd = :eb3
  note = :'7'
  
  play chord(cd, note),release: (1/2.0)
  sleep (1/3.0)
  play chord(cd, note),release: (1/2.0)
  sleep (2/3.0)
  sleep 0.5
  
  play chord(cd, note),release: (1/2.0)
  sleep (1/3.0)
  play chord(cd, note),release: (1/2.0)
  sleep (1/6.0)
  sleep 2
  
end

live_loop :bd do
  sample :bd_haus, cutoff: 90
  sleep 0.5
end
