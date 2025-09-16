% Write input variables from excel sheet
fileIn = 'Wing_Analysis_Input.xlsx';

dataIn = zeros(57);
dataIn(01) = readmatrix(fileIn,'Range','G11:G11');    % Number of Output Plot Data Points (nplot)
dataIn(02) = readmatrix(fileIn,'Range','G16:G16');    % Wing Length (inch)
dataIn(03) = readmatrix(fileIn,'Range','G17:G17');    % Wing Chord (inch)
dataIn(04) = readmatrix(fileIn,'Range','G18:G18');    % Maximum Wing Thickness (% of chord)
dataIn(05) = readmatrix(fileIn,'Range','G19:G19');    % Secondary Structure Added Wing Weight (% of distributed weight)
dataIn(06) = readmatrix(fileIn,'Range','G23:G23');    % Wing Skin Thickness (inch)
dataIn(07) = readmatrix(fileIn,'Range','G24:G24');    % Wing Skin Weight Density (lb/in^3)
dataIn(08) = readmatrix(fileIn,'Range','G25:G25');    % Skin Material Shear Modulus (Msi)
dataIn(09) = readmatrix(fileIn,'Range','G26:G26');    % Skin Material Yield Strength - Shear (Ksi)
dataIn(10) = readmatrix(fileIn,'Range','G27:G27');    % Skin Material Ultimate Strength - Shear (Ksi)
dataIn(11) = readmatrix(fileIn,'Range','G31:G31');    % Stringers #1 and #2: Y-location (% of chord)
dataIn(12) = readmatrix(fileIn,'Range','G32:G32');    % Stringers #1 and #2: Section area (A) (inch^2)
dataIn(13) = readmatrix(fileIn,'Range','G33:G33');    % Stringers #1 and #2: Section inertia about y-axis (Iyy) (inch^4)
dataIn(14) = readmatrix(fileIn,'Range','G34:G34');    % Stringers #1 and #2: Section inertia about z-axis (Izz) (inch^4)
dataIn(15) = readmatrix(fileIn,'Range','G35:G35');    % Stringers #1 and #2: Section product of inertia (Iyz) (inch^4)
dataIn(16) = readmatrix(fileIn,'Range','G36:G36');    % Stringers #1 and #2: Weight density (lb/in^3)
dataIn(17) = readmatrix(fileIn,'Range','G37:G37');    % Stringers #1 and #2: Young's modulus (Msi)
dataIn(18) = readmatrix(fileIn,'Range','G38:G38');    % Stringers #1 and #2: Yield strength - tension (Ksi)
dataIn(19) = readmatrix(fileIn,'Range','G39:G39');    % Stringers #1 and #2: Ultimate strength - tension (Ksi)
dataIn(20) = readmatrix(fileIn,'Range','G40:G40');    % Stringers #1 and #2: Yield strength - compression (Ksi)
dataIn(21) = readmatrix(fileIn,'Range','G41:G41');    % Stringers #1 and #2: Ultimate strength - compression (Ksi)
dataIn(22) = readmatrix(fileIn,'Range','H31:H31');    % Stringers #3 and #4: Y-location (% of chord)
dataIn(23) = readmatrix(fileIn,'Range','H32:H32');    % Stringers #3 and #4: Section area (A) (inch^2)
dataIn(24) = readmatrix(fileIn,'Range','H33:H33');    % Stringers #3 and #4: Section inertia about y-axis (Iyy) (inch^4)
dataIn(25) = readmatrix(fileIn,'Range','H34:H34');    % Stringers #3 and #4: Section inertia about z-axis (Izz) (inch^4)
dataIn(26) = readmatrix(fileIn,'Range','H35:H35');    % Stringers #3 and #4: Section product of inertia (Iyz) (inch^4)
dataIn(27) = readmatrix(fileIn,'Range','H36:H36');    % Stringers #3 and #4: Weight density (lb/in^3)
dataIn(28) = readmatrix(fileIn,'Range','H37:H37');    % Stringers #3 and #4: Young's modulus (Msi)
dataIn(29) = readmatrix(fileIn,'Range','H38:H38');    % Stringers #3 and #4: Yield strength - tension (Ksi)
dataIn(30) = readmatrix(fileIn,'Range','H39:H39');    % Stringers #3 and #4: Ultimate strength - tension (Ksi)
dataIn(31) = readmatrix(fileIn,'Range','H40:H40');    % Stringers #3 and #4: Yield strength - compression (Ksi)
dataIn(32) = readmatrix(fileIn,'Range','H41:H41');    % Stringers #3 and #4: Ultimate strength - compression (Ksi)
dataIn(33) = readmatrix(fileIn,'Range','G46:G46');    % Safety Factor - Yield
dataIn(34) = readmatrix(fileIn,'Range','G47:G47');    % Safety Factor - Ultimate
dataIn(35) = readmatrix(fileIn,'Range','G51:G51');    % First Load Location - X (% of Length)
dataIn(36) = readmatrix(fileIn,'Range','G52:G52');    % Concentrated Force - X Direction (lb)
dataIn(37) = readmatrix(fileIn,'Range','G53:G53');    % Concentrated Force - Y Direction (lb)
dataIn(38) = readmatrix(fileIn,'Range','G54:G54');    % Concentrated Force - Z Direction (lb)
dataIn(39) = readmatrix(fileIn,'Range','G55:G55');    % Concentrated Torque - About X Direction (lb-in)
dataIn(40) = readmatrix(fileIn,'Range','G56:G56');    % Concentrated Moment - About Y Direction (lb-in)
dataIn(41) = readmatrix(fileIn,'Range','G57:G57');    % Concentrated Moment - About Z Direction (lb-in)
dataIn(42) = readmatrix(fileIn,'Range','H51:H51');    % Second Load Location - X (% of Length)
dataIn(43) = readmatrix(fileIn,'Range','H52:H52');    % Concentrated Force - X Direction (lb)
dataIn(44) = readmatrix(fileIn,'Range','H53:H53');    % Concentrated Force - Y Direction (lb)
dataIn(45) = readmatrix(fileIn,'Range','H54:H54');    % Concentrated Force - Z Direction (lb)
dataIn(46) = readmatrix(fileIn,'Range','H55:H55');    % Concentrated Torque - About X Direction (lb-in)
dataIn(47) = readmatrix(fileIn,'Range','H56:H56');    % Concentrated Moment - About Y Direction (lb-in)
dataIn(48) = readmatrix(fileIn,'Range','H57:H57');    % Concentrated Moment - About Z Direction (lb-in)
dataIn(49) = readmatrix(fileIn,'Range','G61:G61');    % Aircraft Load Factor
dataIn(50) = readmatrix(fileIn,'Range','G62:G62');    % Drag Distribution - Constant (lb/in)
dataIn(51) = readmatrix(fileIn,'Range','G63:G63');    % Drag Distribution - rth order (lb/in)
dataIn(52) = readmatrix(fileIn,'Range','G64:G64');    % Drag Distribution - polynomial order
dataIn(53) = readmatrix(fileIn,'Range','G65:G65');    % Lift Distribution - Constant (lb/in)
dataIn(54) = readmatrix(fileIn,'Range','G66:G66');    % Lift Distribution - 2nd Order (lb/in)
dataIn(55) = readmatrix(fileIn,'Range','G67:G67');    % Lift Distribution - 4th Order (lb/in)
dataIn(56) = readmatrix(fileIn,'Range','G68:G68');    % Twist Moment Distribution - Constant (lb-in/in)
dataIn(57) = readmatrix(fileIn,'Range','G69:G69');    % Twist Moment Distribution - 1st Order (lb-in/in)

% Run script
[name, PID, dataOut1, dataOut2] = Wing_Analysis_Function(dataIn);

% Write outputs to excel sheet
fileOut = 'Wing_Analysis_Output.xlsx';
deletePlots(fileOut, 'Output');

writematrix(dataIn(01), fileOut,'Range','G18:G18');    % Number of Output Plot Data Points (nplot) 
writematrix(dataIn(02), fileOut,'Range','G23:G23');    % Wing Length (inch) 
writematrix(dataIn(03), fileOut,'Range','G24:G24');    % Wing Chord (inch) 
writematrix(dataIn(04), fileOut,'Range','G25:G25');    % Maximum Wing Thickness (% of chord) 
writematrix(dataIn(05), fileOut,'Range','G26:G26');    % Secondary Structure Added Wing Weight (% of distributed weight) 
writematrix(dataIn(06), fileOut,'Range','G30:G30');    % Wing Skin Thickness (inch) 
writematrix(dataIn(07), fileOut,'Range','G31:G31');    % Wing Skin Weight Density (lb/in^3) 
writematrix(dataIn(08), fileOut,'Range','G32:G32');    % Skin Material Shear Modulus (Msi) 
writematrix(dataIn(09), fileOut,'Range','G33:G33');    % Skin Material Yield Strength - Shear (Ksi) 
writematrix(dataIn(10), fileOut,'Range','G34:G34');    % Skin Material Ultimate Strength - Shear (Ksi) 
writematrix(dataIn(11), fileOut,'Range','G38:G38');    % Stringers #1 and #2: Y-location (% of chord) 
writematrix(dataIn(12), fileOut,'Range','G39:G39');    % Stringers #1 and #2: Section area (A) (inch^2) 
writematrix(dataIn(13), fileOut,'Range','G40:G40');    % Stringers #1 and #2: Section inertia about y-axis (Iyy) (inch^4) 
writematrix(dataIn(14), fileOut,'Range','G41:G41');    % Stringers #1 and #2: Section inertia about z-axis (Izz) (inch^4) 
writematrix(dataIn(15), fileOut,'Range','G42:G42');    % Stringers #1 and #2: Section product of inertia (Iyz) (inch^4) 
writematrix(dataIn(16), fileOut,'Range','G43:G43');    % Stringers #1 and #2: Weight density (lb/in^3) 
writematrix(dataIn(17), fileOut,'Range','G44:G44');    % Stringers #1 and #2: Young's modulus (Msi) 
writematrix(dataIn(18), fileOut,'Range','G45:G45');    % Stringers #1 and #2: Yield strength - tension (Ksi) 
writematrix(dataIn(19), fileOut,'Range','G46:G46');    % Stringers #1 and #2: Ultimate strength - tension (Ksi) 
writematrix(dataIn(20), fileOut,'Range','G47:G47');    % Stringers #1 and #2: Yield strength - compression (Ksi) 
writematrix(dataIn(21), fileOut,'Range','G48:G48');    % Stringers #1 and #2: Ultimate strength - compression (Ksi) 
writematrix(dataIn(22), fileOut,'Range','H38:H38');    % Stringers #3 and #4: Y-location (% of chord) 
writematrix(dataIn(23), fileOut,'Range','H39:H39');    % Stringers #3 and #4: Section area (A) (inch^2) 
writematrix(dataIn(24), fileOut,'Range','H40:H40');    % Stringers #3 and #4: Section inertia about y-axis (Iyy) (inch^4) 
writematrix(dataIn(25), fileOut,'Range','H41:H41');    % Stringers #3 and #4: Section inertia about z-axis (Izz) (inch^4) 
writematrix(dataIn(26), fileOut,'Range','H42:H42');    % Stringers #3 and #4: Section product of inertia (Iyz) (inch^4) 
writematrix(dataIn(27), fileOut,'Range','H43:H43');    % Stringers #3 and #4: Weight density (lb/in^3) 
writematrix(dataIn(28), fileOut,'Range','H44:H44');    % Stringers #3 and #4: Young's modulus (Msi) 
writematrix(dataIn(29), fileOut,'Range','H45:H45');    % Stringers #3 and #4: Yield strength - tension (Ksi) 
writematrix(dataIn(30), fileOut,'Range','H46:H46');    % Stringers #3 and #4: Ultimate strength - tension (Ksi) 
writematrix(dataIn(31), fileOut,'Range','H47:H47');    % Stringers #3 and #4: Yield strength - compression (Ksi) 
writematrix(dataIn(32), fileOut,'Range','H48:H48');    % Stringers #3 and #4: Ultimate strength - compression (Ksi) 
writematrix(dataIn(33), fileOut,'Range','G53:G53');    % Safety Factor - Yield 
writematrix(dataIn(34), fileOut,'Range','G54:G54');    % Safety Factor - Ultimate 
writematrix(dataIn(35), fileOut,'Range','G58:G58');    % First Load Location - X (% of Length) 
writematrix(dataIn(36), fileOut,'Range','G59:G59');    % Concentrated Force - X Direction (lb) 
writematrix(dataIn(37), fileOut,'Range','G60:G60');    % Concentrated Force - Y Direction (lb) 
writematrix(dataIn(38), fileOut,'Range','G61:G61');    % Concentrated Force - Z Direction (lb) 
writematrix(dataIn(39), fileOut,'Range','G62:G62');    % Concentrated Torque - About X Direction (lb-in) 
writematrix(dataIn(40), fileOut,'Range','G63:G63');    % Concentrated Moment - About Y Direction (lb-in) 
writematrix(dataIn(41), fileOut,'Range','G64:G64');    % Concentrated Moment - About Z Direction (lb-in) 
writematrix(dataIn(42), fileOut,'Range','H58:H58');    % Second Load Location - X (% of Length) 
writematrix(dataIn(43), fileOut,'Range','H59:H59');    % Concentrated Force - X Direction (lb) 
writematrix(dataIn(44), fileOut,'Range','H60:H60');    % Concentrated Force - Y Direction (lb) 
writematrix(dataIn(45), fileOut,'Range','H61:H61');    % Concentrated Force - Z Direction (lb) 
writematrix(dataIn(46), fileOut,'Range','H62:H62');    % Concentrated Torque - About X Direction (lb-in) 
writematrix(dataIn(47), fileOut,'Range','H63:H63');    % Concentrated Moment - About Y Direction (lb-in) 
writematrix(dataIn(48), fileOut,'Range','H64:H64');    % Concentrated Moment - About Z Direction (lb-in) 
writematrix(dataIn(49), fileOut,'Range','G68:G68');    % Aircraft Load Factor 
writematrix(dataIn(50), fileOut,'Range','G69:G69');    % Drag Distribution - Constant (lb/in) 
writematrix(dataIn(51), fileOut,'Range','G70:G70');    % Drag Distribution - rth order (lb/in) 
writematrix(dataIn(52), fileOut,'Range','G71:G71');    % Drag Distribution - polynomial order 
writematrix(dataIn(53), fileOut,'Range','G72:G72');    % Lift Distribution - Constant (lb/in) 
writematrix(dataIn(54), fileOut,'Range','G73:G73');    % Lift Distribution - 2nd Order (lb/in) 
writematrix(dataIn(55), fileOut,'Range','G74:G74');    % Lift Distribution - 4th Order (lb/in) 
writematrix(dataIn(56), fileOut,'Range','G75:G75');    % Twist Moment Distribution - Constant (lb-in/in) 
writematrix(dataIn(57), fileOut,'Range','G76:G76');    % Twist Moment Distribution - 1st Order (lb-in/in)

writematrix(dataOut1(01), fileOut,'Range','G89:G89');    % Modulus Weighted Centroid y-direction (inch)
writematrix(dataOut1(02), fileOut,'Range','G90:G90');    % Modulus Weighted Centroid z-direction (inch)
writematrix(dataOut1(03), fileOut,'Range','G91:G91');    % Cross-Section Weight rho*A (lb/in)
writematrix(dataOut1(04), fileOut,'Range','G92:G92');    % Axial Stiffness EA (lb)
writematrix(dataOut1(05), fileOut,'Range','G93:G93');    % Bending Stiffness EIyy (lb-in^2)
writematrix(dataOut1(06), fileOut,'Range','G94:G94');    % Bending Stiffness EIzz (lb-in^2)
writematrix(dataOut1(07), fileOut,'Range','G95:G95');    % Bending Stiffness EIyz (lb-in^2)
writematrix(dataOut1(08), fileOut,'Range','G96:G96');    % Torsion Stiffness GJ (lb-in^2)
writematrix(dataOut1(09), fileOut,'Range','G97:G97');    % Shear Center, y-direction (inch)
writematrix(dataOut1(10), fileOut,'Range','G98:G98');    % Shear Center, z-direction (inch)
writematrix(dataOut1(11), fileOut,'Range','G83:G83');    % Total Half-Span Wing Weight including added weight factor (lb)
writematrix(dataOut1(12), fileOut,'Range','G173:G173');    % Root Internal Force - X Direction (lb)
writematrix(dataOut1(13), fileOut,'Range','G174:G174');    % Root Internal Force - Y Direction (lb)
writematrix(dataOut1(14), fileOut,'Range','G175:G175');    % Root Internal Force - Z Direction (lb)
writematrix(dataOut1(15), fileOut,'Range','G176:G176');    % Root Internal Moment - about X Direction (lb-in)
writematrix(dataOut1(16), fileOut,'Range','G177:G177');    % Root Internal Moment - about Y Direction (lb-in)
writematrix(dataOut1(17), fileOut,'Range','G178:G178');    % Root Internal Moment - about Z Direction (lb-in)
writematrix(dataOut1(18), fileOut,'Range','G321:G321');    % Stringer (#1) Calculated Axial Stress (lb/in^2)
writematrix(dataOut1(19), fileOut,'Range','G322:G322');    % Stringer (#1) Allowable Stress - Tension (lb/in^2)
writematrix(dataOut1(20), fileOut,'Range','G323:G323');    % Stringer (#1) Allowable Stress - Compression (lb/in^2)
writematrix(dataOut1(21), fileOut,'Range','G324:G324');    % Stringer (#1) Margin of Safety
writematrix(dataOut1(22), fileOut,'Range','H321:H321');    % Stringer (#2) Calculated Axial Stress (lb/in^2)
writematrix(dataOut1(23), fileOut,'Range','H322:H322');    % Stringer (#2) Allowable Stress - Tension (lb/in^2)
writematrix(dataOut1(24), fileOut,'Range','H323:H323');    % Stringer (#2) Allowable Stress - Compression (lb/in^2)
writematrix(dataOut1(25), fileOut,'Range','H324:H324');    % Stringer (#2) Margin of Safety
writematrix(dataOut1(26), fileOut,'Range','I321:I321');    % Stringer (#3) Calculated Axial Stress (lb/in^2)
writematrix(dataOut1(27), fileOut,'Range','I322:I322');    % Stringer (#3) Allowable Stress - Tension (lb/in^2)
writematrix(dataOut1(28), fileOut,'Range','I323:I323');    % Stringer (#3) Allowable Stress - Compression (lb/in^2)
writematrix(dataOut1(29), fileOut,'Range','I324:I324');    % Stringer (#3) Margin of Safety
writematrix(dataOut1(30), fileOut,'Range','J321:J321');    % Stringer (#4) Calculated Axial Stress (lb/in^2)
writematrix(dataOut1(31), fileOut,'Range','J322:J322');    % Stringer (#4) Allowable Stress - Tension (lb/in^2)
writematrix(dataOut1(32), fileOut,'Range','J323:J323');    % Stringer (#4) Allowable Stress - Compression (lb/in^2)
writematrix(dataOut1(33), fileOut,'Range','J324:J324');    % Stringer (#4) Margin of Safety
writematrix(dataOut1(34), fileOut,'Range','G353:G353');    % Skin Panel (1.2) Calculated Shear Stress (lb/in^2)
writematrix(dataOut1(35), fileOut,'Range','G354:G354');    % Skin Panel (1.2) Allowable Stress - Shear (lb/in^2)
writematrix(dataOut1(36), fileOut,'Range','G355:G355');    % Skin Panel (1.2) Margin of Safety
writematrix(dataOut1(37), fileOut,'Range','H353:H353');    % Skin Panel (2.3) Calculated Shear Stress (lb/in^2)
writematrix(dataOut1(38), fileOut,'Range','H354:H354');    % Skin Panel (2.3) Allowable Stress - Shear (lb/in^2)
writematrix(dataOut1(39), fileOut,'Range','H355:H355');    % Skin Panel (2.3) Margin of Safety
writematrix(dataOut1(40), fileOut,'Range','I353:I353');    % Skin Panel (3.4) Calculated Shear Stress (lb/in^2)
writematrix(dataOut1(41), fileOut,'Range','I354:I354');    % Skin Panel (3.4) Allowable Stress - Shear (lb/in^2)
writematrix(dataOut1(42), fileOut,'Range','I355:I355');    % Skin Panel (3.4) Margin of Safety
writematrix(dataOut1(43), fileOut,'Range','J353:J353');    % Skin Panel (4.1) Calculated Shear Stress (lb/in^2)
writematrix(dataOut1(44), fileOut,'Range','J354:J354');    % Skin Panel (4.1) Allowable Stress - Shear (lb/in^2)
writematrix(dataOut1(45), fileOut,'Range','J355:J355');    % Skin Panel (4.1) Margin of Safety
writematrix(dataOut1(46), fileOut,'Range','G384:G384');    % Tip Displacement - X Direction (inch)
writematrix(dataOut1(47), fileOut,'Range','G385:G385');    % Tip Displacement - Y Direction (inch)
writematrix(dataOut1(48), fileOut,'Range','G386:G386');    % Tip Displacement - Z Direction (inch)
writematrix(dataOut1(49), fileOut,'Range','G387:G387');    % Tip Twist (degree)
writematrix(dataOut1(50), fileOut,'Range','G388:G388');    % Tip Bending Slope (dv/dx) (inch/inch)
writematrix(dataOut1(51), fileOut,'Range','G389:G389');    % Tip Bending Slope (dw/dx) (inch/inch)

% Toggle showing plots
show = 'off';

% Draw plots
chord_len = dataIn(03);
thickness = dataIn(04)*chord_len/100;

figure('visible', show);
hold on;
a = chord_len/4;
b = thickness;  
x0 = a;
y0 = 0; 

t = linspace(pi/2, 3*pi/2, 100); 
x = x0 + a * cos(t);
y = y0 + b * sin(t);

plot(x, y, 'b', 'LineWidth', 2);
l = linspace(a, a*2, 100); 
plot(l, (l.*0) + thickness, 'b', 'LineWidth', 2);
plot(l, (l.*0) - thickness, 'b', 'LineWidth', 2);

dia_x = linspace(a*2, a*4, 100);
dia_y = linspace(thickness, 0, 100);

plot(dia_x, dia_y, 'b', 'LineWidth', 2);
plot(dia_x, -dia_y, 'b', 'LineWidth', 2);

p_1 = dataIn(11)*chord_len/100;
p_3 = dataIn(22)*chord_len/100;

plot(p_1,thickness,'Marker', 'o', 'Color', 'red', 'MarkerSize', 7)
plot(p_1,-thickness,'Marker', 'o', 'Color', 'red', 'MarkerSize', 7)
plot(p_3,thickness,'Marker', 'o', 'Color', 'red', 'MarkerSize', 7)
plot(p_3,-thickness,'Marker', 'o', 'Color', 'red', 'MarkerSize', 7)

xlim([0,chord_len])
ylim([-chord_len/2, chord_len/2])
grid on;
xlabel('Wing Chord Length (inch)'); 
ylabel('(inch)');
insertPlotToExcel(gcf, fileOut,'Output', 'J19:N34');

figure('visible', show);
plot(dataOut2(:,1), dataOut2(:,2),'k','LineWidth',2);
grid on;
xlabel('Distance Along Half-Wing (inch)'); 
ylabel('Distributed Aerodynamic Drag (lb/inch)');
insertPlotToExcel(gcf, fileOut,'Output', 'E102:N122');

figure('visible', show);
plot(dataOut2(:,1), dataOut2(:,3),'k','LineWidth',2);
grid on;
xlabel('Distance Along Half-Wing (inch)'); 
ylabel('Distributed Vertical Force (Lift and Weight) (lb/inch)');
insertPlotToExcel(gcf, fileOut,'Output', 'E125:N145');

figure('visible', show);
plot(dataOut2(:,1), dataOut2(:,4),'k','LineWidth',2);
grid on;
xlabel('Distance Along Half-Wing (inch)'); 
ylabel('Distributed Aerodynamic Torque (lb-inch/inch)');
insertPlotToExcel(gcf, fileOut,'Output', 'E148:N168');

figure('visible', show);
plot(dataOut2(:,1), dataOut2(:,5),'k','LineWidth',2);
grid on;
xlabel('Distance Along Half-Wing (inch)'); 
ylabel('Internal Axial Force Vx (lb)');
insertPlotToExcel(gcf, fileOut,'Output', 'E181:N201');

figure('visible', show);
plot(dataOut2(:,1), dataOut2(:,6),'k','LineWidth',2);
grid on;
xlabel('Distance Along Half-Wing (inch)'); 
ylabel('Internal Shear Force Vy (lb)');
insertPlotToExcel(gcf, fileOut,'Output', 'E204:N224');

figure('visible', show);
plot(dataOut2(:,1), dataOut2(:,7),'k','LineWidth',2);
grid on;
xlabel('Distance Along Half-Wing (inch)'); 
ylabel('Internal Shear Force Vz (lb)');
insertPlotToExcel(gcf, fileOut,'Output', 'E227:N247');

figure('visible', show);
plot(dataOut2(:,1), dataOut2(:,8),'k','LineWidth',2);
grid on;
xlabel('Distance Along Half-Wing (inch)'); 
ylabel('Internal Axial Torque Mx (lb-inch)');
insertPlotToExcel(gcf, fileOut,'Output', 'E250:N270');

figure('visible', show);
plot(dataOut2(:,1), dataOut2(:,9),'k','LineWidth',2);
grid on;
xlabel('Distance Along Half-Wing (inch)'); 
ylabel('Internal Bending Moment My (lb-inch)');
insertPlotToExcel(gcf, fileOut,'Output', 'E273:N293');

figure('visible', show);
plot(dataOut2(:,1), dataOut2(:,10),'k','LineWidth',2);
grid on;
xlabel('Distance Along Half-Wing (inch)'); 
ylabel('Internal Bending Moment Mz (lb-inch)');
insertPlotToExcel(gcf, fileOut,'Output', 'E296:N316');

figure('visible', show);
hold on
plot(dataOut2(:,1), dataOut2(:,11),'k','LineWidth',2);
plot(dataOut2(:,1), dataOut2(:,12),'g','LineWidth',2);
plot(dataOut2(:,1), dataOut2(:,13),'r','LineWidth',2);
plot(dataOut2(:,1), dataOut2(:,14),'b','LineWidth',2);
grid on;
xlabel('Distance Along Half-Wing (inch)');
ylabel('Axial Stress Sigma-xx) (Ksi)');
legend('Stringer #1', 'Stringer #2', 'Stringer #3', 'Stringer #4')
hold off
insertPlotToExcel(gcf, fileOut,'Output', 'E328:N348');

figure('visible', show);
hold on
plot(dataOut2(:,1), dataOut2(:,15),'k','LineWidth',2);
plot(dataOut2(:,1), dataOut2(:,16),'g','LineWidth',2);
plot(dataOut2(:,1), dataOut2(:,17),'r','LineWidth',2);
plot(dataOut2(:,1), dataOut2(:,18),'b','LineWidth',2);
grid on;
xlabel('Distance Along Half-Wing (inch)'); 
ylabel('Shear Stress Tau-xs) (Ksi)');
legend('Skin Panel 1.2', 'Skin Panel 2.3', 'Skin Panel 3.4', 'Skin Panel 4.1')
hold off
insertPlotToExcel(gcf, fileOut,'Output', 'E359:N379');

figure('visible', show);
plot(dataOut2(:,1), dataOut2(:,19),'k','LineWidth',2);
grid on;
xlabel('Distance Along Half-Wing (inch)'); 
ylabel('X-Direction Displacement (u) (inch)');
insertPlotToExcel(gcf, fileOut,'Output', 'E392:N412');

figure('visible', show);
plot(dataOut2(:,1), dataOut2(:,20),'k','LineWidth',2);
grid on;
xlabel('Distance Along Half-Wing (inch)'); 
ylabel('Y-Direction Displacement (v) (inch)');
insertPlotToExcel(gcf, fileOut,'Output', 'E415:N435');

figure('visible', show);
plot(dataOut2(:,1), dataOut2(:,21),'k','LineWidth',2);
grid on;
xlabel('Distance Along Half-Wing (inch)'); 
ylabel('Z-Direction Displacement (w) (inch)');
insertPlotToExcel(gcf, fileOut,'Output', 'E438:N458');

figure('visible', show);
plot(dataOut2(:,1), dataOut2(:,22),'k','LineWidth',2);
grid on;
xlabel('Distance Along Half-Wing (inch)'); 
ylabel('Twist Distribution (theta) (degree)');
insertPlotToExcel(gcf, fileOut,'Output', 'E461:N481');

figure('visible', show);
plot(dataOut2(:,1), dataOut2(:,23),'k','LineWidth',2);
grid on;
xlabel('Distance Along Half-Wing (inch)'); 
ylabel('Bending Slope (dv/dx) (inch/inch)');
insertPlotToExcel(gcf, fileOut,'Output', 'E484:N504');

figure('visible', show);
plot(dataOut2(:,1), dataOut2(:,24),'k','LineWidth',2);
grid on;
xlabel('Distance Along Half-Wing (inch)'); 
ylabel('Bending Slope (dw/dx) (inch/inch)');
insertPlotToExcel(gcf, fileOut,'Output', 'E507:N527');

disp('     (10) Output Excel sheet updated')


function insertPlotToExcel(figHandle, excelFileName, sheetName, cellRange)
% insertPlotToExcel - Inserts a MATLAB figure into Excel and fits it to a specified cell range
%
% Usage:
%   insertPlotToExcel(figHandle, excelFileName, sheetName, cellRange)
%
% Inputs:
%   figHandle      - Handle to MATLAB figure (use gcf for current figure)
%   excelFileName  - Name of Excel file (e.g., 'myFile.xlsx') in the same folder
%   sheetName      - Name of the Excel sheet to insert into
%   cellRange      - Range of cells to fit the image (e.g., 'B2:D6')

% Full path to Excel file
fullPath = fullfile(pwd, excelFileName);

% Check if file exists
if ~isfile(fullPath)
    error('Excel file "%s" not found in current directory.', excelFileName);
end

% Copy figure to clipboard
print(figHandle, '-dmeta');

% Open Excel workbook
excelApp = actxserver('Excel.Application');
excelApp.Visible = true;
workbook = excelApp.Workbooks.Open(fullPath);
sheet = workbook.Sheets.Item(sheetName);

% Paste figure
sheet.Range(cellRange).Select;
sheet.Paste;

% Get the newly pasted shape
newShape = sheet.Shapes.Item(sheet.Shapes.Count);

% Resize to fit the cell range
cellLeft = sheet.Range(cellRange).Left;
cellTop = sheet.Range(cellRange).Top;
cellWidth = sheet.Range(cellRange).Width;
cellHeight = sheet.Range(cellRange).Height;

newShape.LockAspectRatio = false;
newShape.Left = cellLeft;
newShape.Top = cellTop;
newShape.Width = cellWidth;
newShape.Height = cellHeight;

% Save and close workbook
workbook.Save();
workbook.Close(false);
excelApp.Quit();
delete(excelApp);
end


function deletePlots(excelFileName, sheetName)
% deletePlots - Deletes all shapes/plots on a specified Excel sheet
%
% Usage:
%   deletePlots(excelFileName, sheetName)
%
% Inputs:
%   excelFileName - Name of the Excel file (in current folder)
%   sheetName     - Name of the sheet to clear

% Full path to Excel file
fullPath = fullfile(pwd, excelFileName);

% Check if file exists
if ~isfile(fullPath)
    error('Excel file "%s" not found in current directory.', excelFileName);
end

% Open Excel
excelApp = actxserver('Excel.Application');
excelApp.Visible = true;
workbook = excelApp.Workbooks.Open(fullPath);
sheet = workbook.Sheets.Item(sheetName);

% Delete all shapes on the sheet
for i = sheet.Shapes.Count:-1:1
    sheet.Shapes.Item(i).Delete;
end

% Save and close workbook
workbook.Save();
workbook.Close(false);
excelApp.Quit();
delete(excelApp);
end



