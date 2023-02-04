live_loop :met do
    sleep 1
  end
  
live_loop :each_sample, sync: :met do
    use_synth :dpulse
    sc = scale(:e3, :blues_minor, num_octaves: 2)

    sc.each do |s|
        play s, release: 0.5
        sleep 0.25
    end
end