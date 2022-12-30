# https://twitter.com/ikemura23/status/1533440156694302720

clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

##| use_random_seed 3000

live_loop :bd do
  sleep 0.5
  sample :bd_tek, cutoff: 130, amp: 1.2
end

live_loop :clap do
  
  sleep 0.5
  sleep 0.375
  num = 7
  
  sample clap,num, amp: 1
  
  sleep 0.375
  sample clap,num, amp: 1
  
  sleep 1-0.5-0.75
end

live_loop :cymbal , sync: :bd do
  sleep 0.25
  sample :drum_cymbal_closed, amp: [1, 0.5].tick, cutoff: 120
end

live_loop :cymbal_open, sync: :bd do
  sleep 0.25
  sample :drum_cymbal_open, amp: 0.4, beat_stretch: 2, finish: 0.1, hpf: 100
  sleep 0.25
end

live_loop :base, sync: :bd do
  _release = [0.25, 0.25, 0.125, 0.25,0.25,0.125, 0.25,]
  cd = chord_invert(chord(:a1, :sus2),1)
  use_synth :dpulse
  
  with_fx :reverb do
    with_fx :lpf, cutoff: 90 do
      7.times do
        play cd.tick, release: 0.2
        sleep _release.look
      end
      sleep 0.5
    end
  end
end

live_loop :cd1, sync: :bd do
  use_synth :rodeo
  
  amp = 0
  
  key = :a3
  sl = [7, 2, 2, 4]
  cds = [:m, :m, :m7, :m7]
  effect=[0, 3, -5, -3, -2, 1, -7, -5]
  
  4.times do |i|
    s = key+sl[i]
    c = cds[i]
    
    with_fx :reverb, amp: amp do
      cd = chord_invert(chord(s, c),-2)
      play cd, release: 2
      sleep 2
      
      ##| sleep 2
      
      sleep 0.25
      play cd, release: 0.25
      sleep 0.25
      play cd, release: 0.25
      sleep 0.125
      play cd, release: 0.25
      sleep 0.25
      play cd, release: 0.25
      sleep 0.25
      play cd, release: 0.25
      sleep 0.25
      sleep 2-0.25*5-0.125
    end
  end
end

live_loop :strings, sync: :bd do
  sl = [0, -5, -5, -3]
  key = [:m, :m, :m7, :m7]
  
  use_synth :hollow
  
  4.times do |i|
    ef = [0].choose
    with_fx :wobble, wave: 1, phase: 10 do
      with_fx :slicer, phase: 0.5, wave: 3, mix: 0.4 do
        play chord(:a4+sl[i]+ef, key[i]), sustain: 3.5, release: 1, attack: 0.25, amp: 2
        play chord(:a3+sl[i]+ef, key[i]), sustain: 3.5, release: 1, attack: 0.25, amp: 1.5
        sleep 4
      end
    end
  end
  
end

