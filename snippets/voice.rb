live_loop :met do
  sleep 1
end

live_loop :sample_voice, sync: :met do
  use_sample_defaults amp: 1#, rate: -1
  
  with_fx :hpf, cutoff: 80 do
    ##| with_fx :echo, phase: 0.25, decay: 3 do
    sample :loop_weirdo, start: 0.14, finish: 0.22
    sleep 1
  end
  ##| end
end