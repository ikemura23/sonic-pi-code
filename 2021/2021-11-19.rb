
drum = "/Users/k_ikemura/Music/sonic_pi"

live_loop :kick do
  sleep 0.5
  sample :bd_haus, lpf: 100, amp: 1.5
end

live_loop :drum, sync: :kick do
  sample drum, 6, beat_stretch:8, amp: 1.3, hpf: 100, start: 0, finish: 0.5
  sleep 4
end

live_loop :ambi_lunar_land, sync: :kick do
  sleep 0.25
  with_fx :slicer, phase: 0.5, amp_min: 0.1 ,amp: 2 do
    sample :ambi_lunar_land, beat_streat: 8
    sleep 8
    sample :ambi_lunar_land, beat_streat: 8+0.25, amp_min: 0.1, rate: -1
    sleep 8-0.25
  end
end


ef = 0 #effect

live_loop :base_fm, sync: :kick do
  cd = [:c3, :f2, :g2, :bb2 ]
  use_synth :fm
  4.times do
    cd.tick
    2.times do
      with_fx :distortion, distort: 0.4 do
        synth :fm, note: cd.look+ef, release: 0, sustain: 0.25, amp: 0.8
        sleep 0.25
      end
    end
  end
end

live_loop :base_chiplead, sync: :kick do
  notes_base = [:c2, :f1, :g1, :bb1]
  use_synth :chiplead
  with_fx :lpf, cutoff: 120 do
    4.times do
      sleep 0.25
      play notes_base.tick+ef, release: 0, sustain: 0.25, amp: 1
      sleep 0.25
    end
  end
end

live_loop :pico, sync: :kick do
  use_synth :pulse
  use_random_seed 1000
  4.times do
    sleep 0.25
    ##| play chord([:c5, :d5, :g4].choose+ef, :m), release: 0.125, sustain: 0, amp: 1
    sleep 0.25
  end
end
