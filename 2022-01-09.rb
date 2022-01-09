drum = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_drum\ loops/LCKK_drum\ loops\ full"

live_loop :bd do
  sleep 0.5
  ##| sample :bd_tek, amp: 1.5
end

live_loop :cymbal_close, sync: :bd do
  sleep 0.25
  ##| sample :drum_cymbal_closed, amp: 2, attack: 0.02, rate: 3
  sleep 0.25
end

live_loop :cymbal_close, sync: :bd do
  cymbal_amp = 1
  with_fx :lpf, cutoff: 130 do
    sample :drum_cymbal_closed, amp: cymbal_amp, attack: 0.02, rate: 1.8
    sleep 0.125
    sample :drum_cymbal_closed, amp: cymbal_amp, attack: 0.02, rate: 1.8
    sleep 0.125
    sample :drum_cymbal_closed, amp: cymbal_amp, attack: 0.02, rate: 1
    ##| sample :drum_cymbal_open, amp: cymbal_amp, beat_stretch: 0.5
    sleep 0.125
    sample :drum_cymbal_closed, amp: cymbal_amp, attack: 0.02, rate: 1.8
    sleep 0.125
  end
end

live_loop :drum, sync: :bd do
  sample drum, 9, beat_stretch: 4, amp: 1.5 #,hpf: 80
  sleep 4
end

##| key = [:e4-7, :e4-7].ring
##| cd = [:sus4, :M7, :sus4].ring
##| iw = [0].ring

##| live_loop :sine, sync: :bd do

##|   ##| with_fx :slicer, phase: 0.5 do
##|   with_fx :wobble, wave: 0, invert_wave: iw.look, phase: 14 do
##|     3.times do
##|       n = chord_invert(chord(key.tick, cd.look), 0)
##|       with_fx :reverb, room: 0.8 do
##|         synth :supersaw, note: n, release: 2, cutoff: 110
##|         sleep 2
##|       end
##|     end
##|   end
##|   sleep 2
##|   ##| end
##| end

live_loop :vo, sync: :bd do
  use_synth :supersaw
  play [74, 76, 81], release: 2
  sleep 4
end

live_loop :pico, sync: :bd do
  use_synth :pulse
  4.times do
    sleep 0.375
    play :e6-2, release: 0.1, sustain: 0, amp: 0.5
  end
  sleep 2-0.375*4
end

##| base_cd = [:b1, :b1-2, :b1, :b1+3].ring
##| base_cd = [:e2-4, :e2-4, :e2, :e2-2, :e2-4, :e2-4, :e2-2, :e1].ring
base_cd = [:e1, :e1-2].ring
live_loop :base, sync: :bd do
  
  n = chord(base_cd.tick, :m).first
  sleep 0.25
  synth :chiplead, note: n, sustain: 0.25, release: 0 ,amp: 0.5
  synth :fm, note: n+12, sustain: 0.25, release: 0, amp: 1
  sleep 0.25
  
  ##| 2.times do
  ##|   synth :chiplead, note: n, sustain: 0.125, release: 0 ,amp: 0.2
  ##|   synth :fm, note: n+12, sustain: 0.125, release: 0, amp: 1
  ##|   sleep 0.125
  ##| end
  
  ##| 4.times do
  ##|   sleep 0.25
  ##|   2.times do
  ##|     synth :supersaw, note: n+12, sustain: 0.125, release: 0 ,amp: 1
  ##|     ##| synth :chiplead, note: n, sustain: 0.125, release: 0 ,amp: 0.5
  ##|     synth :fm, note: n+12, sustain: 0.125, release: 0, amp: 1
  ##|     sleep 0.125
  ##|   end
  ##| end
  
end