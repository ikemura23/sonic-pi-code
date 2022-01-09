#output https://mobile.twitter.com/ikemura23/status/1480081616643190788

drum = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_drum\ loops/LCKK_drum\ loops\ full"

live_loop :bd do
  sleep 0.5
  sample :bd_tek, amp: 1.5
end

live_loop :cymbal_close, sync: :bd do
  cymbal_amp = 1
  with_fx :lpf, cutoff: 130 do
    sample :drum_cymbal_closed, amp: cymbal_amp, attack: 0.02, rate: 1.8
    sleep 0.125
    sample :drum_cymbal_closed, amp: cymbal_amp, attack: 0.02, rate: 1.8
    sleep 0.125
    ##| sample :drum_cymbal_closed, amp: cymbal_amp, attack: 0.02, rate: 1
    sample :drum_cymbal_open, amp: cymbal_amp, beat_stretch: 0.5
    sleep 0.125
    sample :drum_cymbal_closed, amp: cymbal_amp, attack: 0.02, rate: 1.8
    sleep 0.125
  end
end

live_loop :drum, sync: :bd do
  sample drum, 9, beat_stretch: 4, amp: 1.5 #,hpf: 80
  sleep 4
end

live_loop :vo, sync: :bd do
  use_synth :supersaw
  with_fx :lpf, cutoff: 130 do
    play chord_invert(chord(:e5-7, :sus4), 1), release: 2
    sleep 4
  end
end

live_loop :pico, sync: :bd do
  use_synth :pulse
  4.times do
    sleep 0.375
    play :e6-2, release: 0.1, sustain: 0, amp: 0.5
  end
  sleep 2-0.375*4
end

base_cd = [:e1, :e1-2].ring

##| base_cd = [:e2-4, :e2-4, :e2, :e2-2, :e2-4, :e2-4, :e2-2, :e1].ring

live_loop :base, sync: :bd do
  
  n = chord(base_cd.tick, :m).first
  ##| 2.times do
  sleep 0.25
  synth :chiplead, note: n, sustain: 0.25, release: 0 ,amp: 0.9
  synth :fm, note: n+12, sustain: 0.25, release: 0, amp: 1
  sleep 0.25
  ##| end
  
  
  ##| 4.times do
  ##|   sleep 0.25
  ##|   2.times do
  ##|     synth :supersaw, note: n+12, sustain: 0.125, release: 0 ,amp: 0.5
  ##|     synth :chiplead, note: n, sustain: 0.125, release: 0 ,amp: 0.5
  ##|     synth :fm, note: n+12, sustain: 0.125, release: 0, amp: 1
  ##|     sleep 0.125
  ##|   end
  ##| end
  
end