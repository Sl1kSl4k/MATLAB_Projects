function circuit_rc_ftj_gui()


    fig = uifigure('Name', 'Circuit RC FTJ', 'Position', [50, 50, 1000, 700]);

    [components, axesHandles] = create_gui_components(fig);

    components.simulateButton.ButtonPushedFcn = @(src, event) simulateCallback();

    function simulateCallback()

        A = components.amplitudeSlider.Value;
        T = components.periodEdit.Value;
        sinus = components.sinusRadio.Value;
        drept = components.dreptRadio.Value;
        tri = components.triRadio.Value;
        R = components.resistorEdit.Value;
        C = components.capacitorEdit.Value;


        t = 0:0.0000001:5 * T;
        f = 1 / T;
        

    if sinus
        inputSignal = A * sin(2 * pi * f * t);
    elseif drept
        inputSignal = A * square(2 * pi * f * t);
    elseif tri
        inputSignal = A * sawtooth(2 * pi * f * t, 0.5);
    end
        
        RC = R * C;
        ft = 1 / (2 * pi * RC);
        components.ftLabel.Text = sprintf('Frecventa de taiere: %.5f Hz', ft);

        outputSignal = simulate_rc_response(inputSignal, t, RC);

        update_plots(axesHandles, t, inputSignal, outputSignal);
    end
end
