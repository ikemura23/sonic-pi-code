# YUMEMI.apk
# 待機中音楽

use_bpm 70
drum = "/Users/k_ikemura/Music/sonic_pi/drum_slow"

cd = :a3
slp = 8

live_loop :drum do
  # 最初はドラムなし
  sleep 16
  
  ## 開始
  2.times do
    sample drum, 0,beat_stretch:8 , amp: 0.7, lpf: 100
    sleep 8
  end
  
  ## ピアノ sleep 2
  2.times do
    sample drum, 0,beat_stretch:8 , amp: 0.7, lpf: 100
    sleep 8
  end
  
  ## ピアノ sleep 1
  2.times do
    sample drum, 0,beat_stretch:8 , amp: 0.7, lpf: 100
    sleep 8
  end
  
  ## ピアノ sleep 0.5
  2.times do
    sample drum, 0,beat_stretch:8 , amp: 0.7, lpf: 100
    sleep 8
  end
  
  ## ピアノ sleep 1
  2.times do
    sample drum, 0,beat_stretch:8 , amp: 0.7, lpf: 100
    sleep 8
  end
  
  # 最後のドラム休み
  sleep 16
  
  # 再生終了
  sleep 99
end

live_loop :cd do
  use_synth :prophet
  cds = (ring :a3, :g3).tick
  play chord(cds, :M7), release: 8, cutoff: 70
  sleep 8
end

live_loop :piano do
  with_fx :reverb, room: 1 do
    with_fx :reverb, room: 1 do
      
      ##| use_random_seed 3800 # 3800 -> 13800 -> 5800
      sleep 32
      ns = (scale cd+12, :hex_major7, num_octaves: 1)
      
      use_random_seed 3800
      8.times do
        tick
        use_synth :piano
        play (scale cd+12, :hex_major7, num_octaves: 1).choose, release: 1, amp: 0.5
        sleep 2 # 2 -> 1 -> 0.5
      end
      8.times do
        tick
        use_synth :piano
        play (scale cd+12, :hex_major7, num_octaves: 1).choose, release: 1, amp: 0.5
        sleep 2 # 2 -> 1 -> 0.5
      end
      use_random_seed 13800
      4.times do
        4.times do
          tick
          use_synth :piano
          play (scale cd+12, :hex_major7, num_octaves: 1).choose, release: 1, amp: 0.5
          sleep 1
        end
      end
      tick_reset
      use_random_seed 5800
      8.times do
        4.times do
          tick
          use_synth :piano
          play (scale cd+12, :hex_major7, num_octaves: 1).choose, release: 1, amp: 0.5
          sleep 0.5 # 2 -> 1 -> 0.5
        end
        
      end
      
      use_random_seed 3800
      4.times do
        4.times do
          tick
          use_synth :piano
          play (scale cd+12, :hex_major7, num_octaves: 1).choose, release: 1, amp: 0.5
          sleep 1
        end
        
      end
      
      # 休み
      sleep 16
      
      # 再生終了
      sleep 99
    end
  end
end
