
function outputSignal = simulate_rc_response(inputSignal, t, RC)

    H = tf(1, [RC 1]);
    outputSignal = lsim(H, inputSignal, t);
    

end
