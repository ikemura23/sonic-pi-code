## base template

live_loop :bd do
  sleep 0.5
  sample :bd_tek, cutoff: 110, amp: 1
end


live_loop :base_loop, sync: :bd do
  ##| base1 :c3
  base7 :c2
  ##| base3 :c3
  ##| base4 :c2
  ##| bass5 :g1
  ##| bass6 :g2
end

## ハネるタイプ
define :base1 do | note, ef=0|
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

define :base2 do | note |
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

define :base7 do | note |
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

define :base3 do | note |
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