#output https://twitter.com/ikemura23/status/1518005508292382720

hatLoop="/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/drum_loops/LCC_hat\ loops"
clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

use_bpm 64

live_loop :kick do
  sleep 0.5
  sample :bd_tek, amp: 1.3, lpf: 90, rate: 0.8
  
end

live_loop :hatLoop, sync: :kick do
  sample hatLoop, 9, beat_stretch: 8, amp: 1, lpf: 110, start: 0, finish: 0.5
  sleep 4
end

live_loop :clap, sync: :kick do
  sleep 0.5
  with_fx :reverb do
    sample clap, 6, amp: 1, lpf: 110
  end
  sleep 0.5
end


base_effect = [0,7,5].ring
live_loop :base, sync: :kick do
  use_synth :fm
  n = :es2+base_effect.tick
  
  play n, sustain: 0.4, release: 0.1
  sleep 0.5
  play n, sustain: 0.275, release: 0.1
  sleep 0.375
  play n, sustain: 0, release: 0.25
  sleep 0.125
  
  n=n+base_effect.tick
  play n, sustain: 0, release: 0.25
  sleep 0.25
  play n, sustain: 0, release: 0.25
  sleep 0.5
  n=:db2+base_effect.tick
  play n, sustain: 0, release: 0.25
  sleep 0.25
end

live_loop :midle, sync: :kick do
  use_synth :saw
  
  use_random_seed [101, 2160, 3008, 4020].choose
  
  c = chord_invert(chord(:es3+[0,5,7].choose, [:m7, :m9, :m11].choose), [0,1].choose)
  
  with_fx :echo,decay: 8, phase: 0.375 do
    with_fx :reverb, room: 0.95, mix: 0.6 do
      with_fx :wobble, cutoff_max: rrand(100, 130), wave: [1,2,3].choose do
        play c, release: 0.125 #, attack: rrand(0.05, 0.1)
        sleep 0.125
        play c, release: 0.125 #, attack: rrand(0.05, 0.1)
        sleep 0.125
      end
    end
  end
  
  sleep 4-0.25
end

live_loop :midle2, sync: :kick do
  use_synth :pluck
  
  c = chord_invert(chord(:es2, :m9), [0,1].choose)
  
  sleep 1
  with_fx :echo,decay: 8, phase: 0.375 do
    with_fx :reverb, room: 1, mix: 0.4 do
      play c, release: 0.125
      sleep 0.125
      play c, release: 0.125
      sleep 0.125
    end
  end
  
  sleep 3-0.25
end

live_loop :midle3, sync: :kick do
  use_synth :dpulse
  
  c = chord(:es4, :sus2)
  r = [ 0.375, 0.375, 0.25]
  ef = [5, 0, 3]
  a = 0
  
  sleep 2
  with_fx :lpf, cutoff: 100 do
    with_fx :reverb, room: 0.8, mix: 0.6 do
      3.times do
        with_fx :wobble, wave: 3,invert_wave: 1 do
          play c.tick, release: 0.25, amp: a #, attack: 0.09
        end
        sleep r.look
      end
    end
  end
  sleep 2-r.sum
end

live_loop :low, sync: :kick do
  use_synth :hollow
  c = chord_invert(chord(:es3+7, [:m9,:sus2,:sus4].ring.tick), [-1,0,1].choose)
  play c, release: 4, sustain: 6, amp: 1.5, attack: 0.5
  sleep 7
end
