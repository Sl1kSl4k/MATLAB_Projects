function [components, axesHandles] = create_gui_components(fig)

signalPanel = uipanel(fig, 'Title', 'Ajustare Semnal și Circuit', 'Position', [20, 370, 550, 300]);


uilabel(signalPanel, 'Text', 'Amplitudine [V]:', 'Position', [20, 215, 150, 22]);
amplitudeSlider = uislider(signalPanel, 'Position', [150, 225, 200, 3], 'Limits', [0, 10]);


uilabel(signalPanel, 'Text', 'Perioada [s]:', 'Position', [20, 145, 150, 22]);
periodEdit = uieditfield(signalPanel, 'numeric', 'Position', [150, 145, 70, 22]);
periodEdit.Value = 0.1;


uilabel(signalPanel, 'Text', 'Rezistenta [Ohm]:', 'Position', [20, 95, 150, 22]);
resistorEdit = uieditfield(signalPanel, 'numeric', 'Position', [150, 95, 70, 22]);
resistorEdit.Value = 100;


uilabel(signalPanel, 'Text', 'Capacitate [F]:', 'Position', [20, 45, 150, 22]);
capacitorEdit = uieditfield(signalPanel, 'numeric', 'Position', [150, 45, 70, 22]);
capacitorEdit.Value = 0.001;




signalGroup = uibuttongroup(signalPanel, 'Title', 'Tip Semnal', 'Position', [270, 20, 200, 150]);

sinusRadio = uiradiobutton(signalGroup, 'Position', [50, 80, 150, 22], 'Text', 'Sinusoidal', 'Value', true);
dreptRadio = uiradiobutton(signalGroup, 'Position', [50, 50, 150, 22], 'Text', 'Dreptunghiular', 'Value', false);
triRadio = uiradiobutton(signalGroup, 'Position', [50, 20, 150, 22], 'Text', 'Triunghiular', 'Value', false);



simulateButton = uibutton(signalPanel, 'Text', 'Start', 'Position', [400, 200, 100, 40]);



ax1 = uiaxes(fig, 'Position', [20, 50, 460, 250]);
title(ax1, 'Semnal de intrare');
xlabel(ax1, 'Timp [s]');
ylabel(ax1, 'Amplitudine [V]');

ax2 = uiaxes(fig, 'Position', [500, 50, 460, 250]);
title(ax2, 'Răspuns Circuit RC');
xlabel(ax2, 'Timp [s]');
ylabel(ax2, 'Amplitudine [V]');

img_ax = uiaxes(fig, 'Position', [570, 320, 400, 350]);
img = imread('rc_ftj.PNG');
imshow(img, 'Parent', img_ax);


ftLabel = uilabel(fig, ...
                  'Text', 'Frecventa de taiere: N/A', ...
                  'Position', [400, 320, 350, 22], ...
                  'FontSize', 15);


components = struct('amplitudeSlider', amplitudeSlider, ...
                    'periodEdit', periodEdit, ...
                    'resistorEdit', resistorEdit, ...
                    'capacitorEdit', capacitorEdit, ...
                    'sinusRadio', sinusRadio, ...
                    'dreptRadio', dreptRadio, ...
                    'triRadio', triRadio, ...
                    'simulateButton', simulateButton, ...
                    'ftLabel', ftLabel);


axesHandles = struct('ax1', ax1, 'ax2', ax2, 'img_ax', img_ax);
end
