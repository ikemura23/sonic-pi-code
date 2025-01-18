# Plasma https://www.youtube.com/watch?v=Uuq1xew7V7k

use_bpm 90

# drum -------------------------------------------------
in_thread do
  
  ##| part 1
  ##| 6.times do
  ##|   drum
  ##| end
  ##| drum_fill_1
  ##| drum_fill_2
  
  # part 2
  15.times do
    drum
  end
  drum_fill_2
  
  # part 3
  7.times do
    drum
  end
  drum_fill_2
  
end

define :drum do
  use_sample_defaults amp: 1
  
  sample :drum_heavy_kick
  sleep 1
  
  sample :sn_zome, rate: 0.8, amp: 0.7
  sleep 1
end

define :drum_fill_1 do
  
  sample :sn_zome, rate: 0.8, amp: 0.7
  sleep 1
  sample :sn_zome, rate: 0.8, amp: 0.7
  sleep 1
  
end
define :drum_fill_2 do
  sample :sn_zome, rate: 0.8, amp: 0.7
  sleep 0.25
  sample :drum_heavy_kick
  sleep 0.25
  sample :drum_heavy_kick
  sleep 0.25
  sample :drum_heavy_kick
  sleep 0.25
  
  sample :sn_zome, rate: 0.8, amp: 0.7
  sleep 0.25
  sample :drum_heavy_kick
  sleep 0.25
  sample :drum_heavy_kick
  sleep 0.25
  sample :drum_heavy_kick
  sleep 0.25
  
end



# Bass -------------------------------------------------

in_thread do
  
  # part 1
  ##| 16.times do
  ##|   bass :cs2
  ##| end
  
  # part 2
  8.times do
    bass :cs2
  end
  8.times do
    bass :e2
  end
  8.times do
    bass :cs2
  end
  4.times do
    bass :d2
  end
  4.times do
    bass :e2
  end
  
  # part 3
  2.times do
    8.times do
      bass :a1
    end
    8.times do
      bass :fs1
    end
    8.times do
      bass :e1
    end
    8.times do
      bass :b1
    end
  end
  
  # part 4
  8.times do
    bass :a1
  end
  8.times do
    bass :fs1
  end
  8.times do
    bass :cs1
  end
  8.times do
    bass :cs10
  end
  
end



define :bass do | note |
  use_synth_defaults release: 0.25, attack_level: 0, amp: 1
  ##| use_synth :dsaw
  
  sleep 0.25
  
  3.times do
    synth :saw, note: note
    synth :pluck, note: note, amp: 0.5
    sleep 0.25
  end
end

# Synth -------------------------------------------------

in_thread do
  synth1
end

define :synth1 do
  use_synth_defaults release: 4, amp: 0.5
  use_synth :dsaw
  
  play chord(:cs4, :M)
  sleep 8
  
  play chord(:e4, :M)
  sleep 8
  
  play chord(:cs4, :M)
  sleep 8
  
  play chord(:e4, :M), release: 1.5
  sleep 0.75
  
  play chord(:fs4, :m)
  sleep 4-0.75
  
end
