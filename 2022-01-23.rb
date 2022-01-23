use_random_seed 9300
clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

live_loop :bd do
  sleep 0.5
  ##| sample :bd_tek, amp: 2.5
end

live_loop :bd2, sync: :bd do
  _amp = 0 #2
  sample :bd_tek, amp: _amp, cutoff: 70
  sleep 1
  sample :bd_tek, amp: _amp, cutoff: 70
  sleep 0.375
  sample :bd_tek, amp: _amp, cutoff: 70
  sleep 0.375
  sleep 0.25
end

live_loop :clap, sync: :bd do
  sleep 0.5
  sample clap, 0, amp: 1.5 #5, 0, 1
  sleep 0.5
end

live_loop :cymbal_close, sync: :bd do
  sleep 0.25
  2.times do
    sample :drum_cymbal_closed, amp: 0.7, attack: 0.02, rate: 1.4, hpf: 60
    sleep 0.125
  end
end

live_loop :bass, sync: :bd do
  use_synth :tri
  cd = :c1
  
  effect = [2,9,7]
  with_fx :reverb, amp: 2 do
    with_fx :krush do
      sleep 0.125
      play cd, release: 0.2, sustain: 0
      2.times do
        play cd, release: 0.2, sustain: 0
        sleep 0.25
      end
      sleep 0.125
      play cd, release: 0.2, sustain: 0
      sleep 0.25
      # 4
      sleep 0.25
      play cd, release: 0.2, sustain: 0
      sleep 0.375
      3.times do
        play cd+effect.tick, release: 0.13, sustain: 0
        sleep 0.125
      end
    end
  end
end

back_effect = [9,7,5,2].ring
live_loop :back_code, sync: :bd do
  cd = :c3 + back_effect.first
  invert = [0, 1, -1].choose
  with_fx :flanger, amp: 1 do
    synth :sine, note: chord_invert(chord(cd, :m9), invert), release: 3
    synth :sine, note: chord(cd+5, [:m9].choose), release: 3, amp: 0.5
    sleep 4
  end
end

live_loop :pico2, sync: :bd do
  use_synth :dpulse
  sleep 2
  with_fx :reverb, room: 0.9 do
    with_fx :echo, decay: 3, phase: 0.375 do
      ##| play :c7, amp: 0.3, release: 0.2
    end
  end
  sleep 2
end
