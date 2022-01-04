
kick_snare = "/Users/k_ikemura/Music/sonic_pi/LCA_kick_snare\ loops"
drum = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_drum\ loops/LCKK_drum\ loops\ full"

live_loop :bd do
  sleep 0.5
  sample :bd_tek
end

live_loop :cymbal_close, sync: :bd do
  4.times do
    sample :drum_cymbal_closed, amp: [2,0,2,2].tick, attack: 0.02, rate: 5
    sleep 0.125
  end
end

live_loop :kick_snare_loop, sync: :bd do
  ##| sample drum, 2, beat_stretch: 8, amp: 1.5 #,hpf: 50, start: 0, finish: 0.5
  sleep 8
end

key = [:ab4, :f4].ring
cd = [:sus4, :sus2].ring
iw = [1,0].ring

live_loop :sine, sync: :bd do
  n = chord_invert(chord(key.tick, :m9), 0)
  sleep 0.25
  with_fx :slicer, phase: 0.5 do
    with_fx :wobble, wave: 0, invert_wave: iw.look, phase: 8 do
      with_fx :reverb, room: 0.8 do
        synth :dsaw, note: n, release: 0, sustain: 7.75, cutoff: 70
        sleep 7.75
      end
    end
  end
end

live_loop :base, sync: :bd do
  base_cd = [:ab1, :f1].ring
  n = chord(base_cd.tick, :m)
  
  with_fx :reverb do
    ##| synth :chiplead, note: n.first, sustain: 8, release: 0 ,amp: 0.5
    ##| synth :fm, note: n.first+12, sustain: 8, release: 0, amp: 0.5
    sleep 8
  end
  
  ##| 16.times do
  ##|   with_fx :reverb do
  ##|     synth :chiplead, note: n.first, sustain: 0.25, release: 0 ,amp: 0.5
  ##|     synth :fm, note: n.first+12, sustain: 0.25, release: 0, amp: 0.5
  ##|     sleep 0.25
  
  ##|     synth :chiplead, note: n.first+12, sustain: 0.125, release: 0 ,amp: 0.5
  ##|     synth :fm, note: n.first+24, sustain: 0.125, release: 0, amp: 0.5
  ##|     sleep 0.125
  
  ##|     synth :chiplead, note: n.first+12, sustain: 0.125, release: 0 ,amp: 0.5
  ##|     synth :fm, note: n.first+24, sustain: 0.125, release: 0, amp: 0.5
  ##|     sleep 0.125
  ##|   end
  ##| end
  
end