
function update_plots(axesHandles, t, inputSignal, outputSignal)

    plot(axesHandles.ax1, t, inputSignal);
    title(axesHandles.ax1, 'Semnal de intrare');
    xlabel(axesHandles.ax1, 'Timp [s]');
    ylabel(axesHandles.ax1, 'Amplitudine [V]');
    grid(axesHandles.ax1, 'on');
    
    
    plot(axesHandles.ax2, t, outputSignal);
    title(axesHandles.ax2, 'Raspuns Circuit RC');
    xlabel(axesHandles.ax2, 'Timp [s]');
    ylabel(axesHandles.ax2, 'Amplitudine [V]');
    grid(axesHandles.ax2, 'on');
    
end
