live_loop :met do
    sleep 0.5
end

# splash
live_loop :splash, sync: :met do
    sample :drum_splash_hard, amp: 0.5
    sleep 16
end
