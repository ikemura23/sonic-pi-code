# output https://twitter.com/ikemura23/status/1511654448048664581

live_loop :kick do
    sample :bd_tek, amp: 1, cutoff: 120
    sleep 0.5
  end
  
  live_loop :loop_garzul, sync: :kick do
    sample :loop_garzul, beat_stretch: 8, amp: 0.5, cutoff: 110 #:loop_garzul
    sleep 8
  end
  
  live_loop :loop_industrial, sync: :kick do
    ##| sample :loop_industrial, beat_stretch: 1, amp: 0.5, cutoff: 110
    sleep 1
  end
  
  live_loop :hi, sync: :kick do
    use_random_seed 5500 # [5500, 7500, 9500, 2900].choose
    
    key = :c4
    effect = [0,5,7].choose
    sle = [0.25,0.25, 0.375]
    
    with_fx :reverb, room: 0.7, mix: 0.7 do
      with_fx :distortion, amp: 0.4 do
        8.times do
          n = [key, key +[7,7,5,12].choose] # 7,5,10,12,14
          a = rrand(0.5, 0.8)-0.2
          
          ##| synth :prophet, note: n, release: 0.25, cutoff: 100 #:square :prophet
          sleep sle.choose
        end
      end
    end
  end
  
  live_loop :base1, sync: :kick do
    use_random_seed 6001 # [6001, 7000, 3400, 3500].choose
    base_note = :c2
    base_amp = 0.7
    
    base_sleep = [0.25, 0.375]
    with_fx :reverb, room: 0.7, mix: 0.6 do
      4.times do
        sl = base_sleep.choose
        n = [base_note, base_note+7]
        a = 1
        c = 90 # [80,100].choose
        synth :dpulse, note: n, amp: base_amp, release: 0.25, cutoff: c
        synth :fm, note: base_note, amp: base_amp+1, release: 0.4
        sleep sl
      end
    end
  end
  
  live_loop :low, sync: :kick do
    use_synth :hollow
    c = [:sus2,:sus4, :m7, :m9].ring #:sus2,:sus4, :m7, :m9
    4.times do
      play chord(:c5, c.tick), release: 0, sustain: 4, amp: 3
      sleep 4
    end
  end
  