## Clap テンプレート

clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

live_loop :bd do
  sample :bd_tek, cutoff: 100, amp: 1.2
  sleep 0.5
end

## 呼び出し
live_loop :clap, sync: :bd do
  ##| clap4 sl: 0.375, a: 1, l: 120
  clap_double
end

# シンプルなclap
define :clap1 do | amp = 1, lpf = 130 |
  sleep 0.5
  with_fx :reverb do
    sample clap, 5, amp: amp, lpf: lpf
  end
  sleep 0.5
end

# 汎用的（デフォルト引数）
define :clap2 do | sl = 0.5, amp = 1, lpf = 130  |
  sleep sl
  with_fx :reverb do
    sample clap, 5, amp: amp, lpf: lpf
  end
  sleep 1-sl
end

# densityを使ったパターン
define :clap3 do | amp = 1, lpf = 130 |
  density 1 do
    with_fx :reverb do
      sample clap, 5, amp: amp, lpf: lpf
    end
    sleep 1
  end
end

# 汎用的（キーワード引数）
define :clap4 do | sl: , a: , l: |
  sleep sl
  with_fx :reverb do
    sample clap, 5, amp: a, lpf: l
  end
  sleep 1-sl
end

# 溜め
define :clap_double do
  num = 5
  
  sleep 0.5
  with_fx :reverb, mix: 0.1 do
    sleep 0.375
    sample clap,num, amp: 1
    
    sleep 0.375
    sample clap,num, amp: 1
  end
  sleep 1-0.5-0.75
end

# 遠くで聞こえるようなclap
define :long_clap do
  sleep 1
  with_fx :reverb, mix: 0.9,room: 0.9 do
    sample clap, 0, amp: 0.8, beat_stretch: rrand(1, 2), rate: rrand(0.8, 2)
  end
  sleep 1
end