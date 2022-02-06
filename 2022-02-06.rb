#output https://twitter.com/ikemura23/status/1490220935957204996
clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

live_loop :bd do
  sleep 0.5
end

live_loop :bd3, sync: :bd do
  28.times do
    sample :bd_tek, amp: 1
    sleep 0.5
  end
  sleep 2
end

live_loop :splash_hard, sync: :bd do
  sample :drum_splash_hard, cutoff: 110, amp: 0.8
  sleep 16
end

live_loop :bd2, sync: :bd do
  _amp = 0.8 #0.8
  sample :bd_mehackit, amp: _amp, cutoff: 70
  sleep 0.375
  sample :bd_mehackit, amp: _amp, cutoff: 70
  sleep 0.375
  sample :bd_mehackit, amp: _amp, cutoff: 70
  sleep 0.25
end

live_loop :clap, sync: :bd do
  sleep 0.5
  sample clap, 1, amp: 1, rate: 1.2 #1, 0
  sleep 0.5
end

live_loop :cymbal_close, sync: :bd do
  sleep 0.25
  2.times do
    sample :drum_cymbal_closed, amp: 0.7, attack: 0.01, rate: 1.2, hpf: 100
    sleep 0.125
  end
end

live_loop :bass, sync: :bd do
  use_synth :tb303
  cd = :a1
  _amp=1.5 #1.5
  with_fx :lpf, cutoff: 100, amp: _amp do
    
    play cd-2, release: 0.375, sustain: 0
    sleep 0.375
    play cd, release: 0.2, sustain: 0
    sleep 0.125
    play cd, release: 0.2, sustain: 0
    sleep 0.25
    play cd, release: 0.2, sustain: 0
    sleep 0.25
    
    sleep 1-0.375-0.125-0.5
  end
end

live_loop :bass2, sync: :bd do
  use_synth :dsaw
  _cds=[:d2,:d2-2].ring
  _amp=0 #1,4
  _sl=[0.375, 0.125, 0.25]
  2.times do
    cd = _cds.tick
    with_fx :lpf, cutoff: 90,amp: _amp do
      
      2.times do
        play cd, release: 0.375, sustain: 0
        sleep 0.375
        play cd, release: 0.375, sustain: 0
        sleep 0.125
        play cd, release: 0.375, sustain: 0
        sleep 0.25
        play cd-5, release: 0.375, sustain: 0
        sleep 0.25
        
        play cd-12, release: 0.375, sustain: 0
        sleep 0.375
        play cd-12, release: 0.375, sustain: 0
        sleep 0.125
        play cd-12, release: 0.375, sustain: 0
        sleep 0.25
        play cd-5, release: 0.375, sustain: 0
        sleep 0.25
      end
    end
    sleep 1-0.375-0.125-0.5
  end
end

live_loop :pico2, sync: :bd do
  use_synth :pretty_bell
  sl = [0.25, 0.25, 0.125, 0.25,0.125,0.25,0.125,0.125]
  effect = [-2,0].ring
  with_fx :reverb, room: 0.9, amp: 1.3 do
    sl.size.times do
      c = :a4+effect.tick
      play c, amp: 0.3, release: 0.2
      play c+7, amp: 0.3, release: 0.2
      sleep sl.look
    end
    sleep 2-sl.sum
  end
end

live_loop :pico3, sync: :bd do
  use_random_seed 10899 # 700 800
  use_synth :prophet
  16.times do
    with_fx :lpf, cutoff: 80, amp: 1 do
      c = chord_invert(chord(:a5, :m),1).choose+[0,7].choose
      play c,release: 0.2, sustain: 0
      sleep 0.125
    end
  end
end

live_loop :mero, sync: :bd do
  use_synth :dtri
  
  c1 = [:a4,:a4+5]
  c2 = [:a4+7,:a4+12]
  s = play c1, release: 4, note_slide: 0.5
  sleep 0.25
  control s, note: c2
  sleep 3.75
end

