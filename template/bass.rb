## bass template

live_loop :bd do
  sleep 0.5
  sample :bd_tek, cutoff: 110, amp: 1
end


live_loop :bass_loop, sync: :bd do
  ##| bass1 :c3
  ##| bass7 :c2
  ##| bass3 :c3
  ##| bass4 :c2
  ##| bass5 :g1
  ##| bass6 :g2
  bass7 :f2
end

## ハネるタイプ
define :bass1 do | note, ef=0|
  with_fx :reverb do
    use_synth :fm
    use_synth_defaults release: 0.3, amp: 1.2, attack_level: 2
    
    play note
    sleep 0.5
    play note
    sleep 0.375
    play note+ef
    sleep 1-0.5-0.375
    
    sleep 0.25
    play note+ef
    sleep 0.5
    play note+ef
    sleep 0.25
  end
end

define :bass2 do | note |
  use_synth :dsaw
  use_synth_defaults release: 0.3
  
  with_fx :lpf, cutoff: 100 do
    2.times do
      play note
      sleep 0.375
      play note
      sleep 0.375
      play note
      sleep 0.25
    end
  end
end

define :bass7 do | note |
  use_synth :dsaw
  use_synth_defaults release: 0.3
  
  with_fx :lpf, cutoff: 100 do
    play note
    sleep 0.375
    play note
    sleep 0.25
    play note
    sleep 1-0.375-0.25
  end
end

define :bass3 do | note |
  with_fx :reverb do
    use_synth :fm
    use_synth_defaults release: 0.3, amp: 1, attack_level: 2
    
    play note
    sleep 0.375
    play note
    sleep 1-0.375
  end
end

define :bass4 do | note |
  
  use_synth_defaults release: 0.25
  
  sleep 0.25
  synth :fm, note: note, attack_level: 2
  synth :chiplead, note: note
  sleep 0.25
end

# use_bpm 70 くらいがいい
define :bass5 do | note |
  use_synth :dsaw
  
  with_fx :reverb, room: 0.7 do
    with_fx :lpf, cutoff: 100 do
      n = note
      8.times do |i|
        if i == 4 then n=n+3 end
        if i == 7 then n=n+2 end
        sleep 0.125
        3.times do
          play n, sustain: 0.09, release: 0
          play n+24, sustain: 0.1, release: 0, amp: 0.15
          sleep 0.125
          sleep 0.5-0.125*4
        end
      end
    end
  end
end

define :bass6 do | note |
  use_synth :fm
  use_synth_defaults release: 0.25, attack_level: 1.5
  
  play note
  sleep 0.25
  cd = chord_invert(chord(note, :m), -1)
  
  3.times do
    play cd.tick
    sleep 0.25
  end
  
  play note
  sleep 0.25
  
  play note
  sleep 0.25
  sleep 0.25
  3.times do
    play cd.tick
    sleep 0.25
  end
  play note
  sleep 0.25
  sleep 4-0.25*11
end

# deep house に合う
define :bass7 do |note|
  
  use_random_seed 100 # 100 10 9230 9233
  sl = [0.25, 0.25, 0.25, 0.25, 0.375].shuffle
  
  c = chord(note, :sus4, invert: -1) # m9
  with_fx :reverb, mix: 0.5, room: 0.5, amp: 1.5 do
    with_fx :lpf, cutoff: 80 do
      sl.size.times do
        
        synth :dsaw, note: c.choose, sustain: 0.125, release: 0
        sleep sl.tick
      end
      
      sleep 2-sl.sum-0.25
      synth :dsaw, note: c.choose, sustain: 0.125, release: 0
      sleep 0.125
      synth :dsaw, note: c.choose, sustain: 0.125, release: 0
      sleep 0.125
    end
  end
end
