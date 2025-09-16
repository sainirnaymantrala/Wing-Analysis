function [name, PID, dataOut1, dataOut2] = Wing_Analysis_Function(dataIn)
% + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + +
% +
% +  SE-160A:  Aerospace Structural Analysis I
% +
% +  Project: (2) Wing Analysis
% +
% +  Title:   Wing_Analysis_Function
% +  Author:  Sainirnay Mantrala
% +  PID:     A17477737
% +  Version: (01) 02/14/2025
% +           (02) 02/22/2025
% +
% +  This function is the primary analysis function for the wing analysis 
% +  program.  All of the input data is brought into the function using 
% +  "dataIn". Next all the calculations are performed.  Finally, the 
% +  calculated results are written to "dataOut1" and "dataOut2", where 
% +  these two data sets are sent to the main program where it is 
% +  written and plotted in an Excel output file.
% +
% +  SUMMARY OF WING ANALYSIS
% +
% +  A) SECTION PROPERTIES
% +     A.1) Modulus Weighted Section Properties (yc, zc, EA, EIyy, EIzz, EIyz)
% +     A.2) Torsion Constant (GJ)
% +     A.3) Shear Center Location (ysc, zsc)
% +     A.4) Total Half Span Wing Weight (lb)
% +
% +  B) LOADS
% +     B.1) Concentrated Loads (Px, Py, Pz, Mx, My, Mz)
% +     B.2) Distributed Aerodynamic Loads (lift, drag, moment)
% +     B.3) Maneuvering Loads (distributed weight)
% +     B.4) Wing Root Reactions - Axial, Shear, Torque, and Moment 
% +     B.5) Distributed Wing Internal Axial, Shear, Bend Moments, Torque
% +
% +  C) INTERNAL STRESSES
% +     C.1) Wing Root Axial Stress (sxx) and Shear Stress (txs)
% +     C.2) Allowable Stress, and Root Margin of Safety
% +     C.3) Distributed Wing Axial Stress (sxx) Plot
% +     C.4) Distributed Wing Shear Stress (tau) Plot
% +
% +  D) WING TIP DISPLACEMENTS, TWIST, AND BENDING SLOPES
% +     D.1) Distributed Wing X-direction (Axial) Displacement 
% +     D.2) Distributed Wing Y-direction (Drag ) Displacement 
% +     D.2) Distributed Wing Z-direction (Lift ) Displacement 
% +     D.3) Distributed Wing Twist Rotation
% +     D.4) Distributed Wing Bending Slopes (dv/dx, dw/dx)
% +
% +  Input Data Array: dataIn (57)
% +     dataIn(01):     Number of Output Plot Data Points (nplot)
% +     dataIn(02):     Wing Length (inch)
% +     dataIn(03):     Wing Chord  (inch)
% +     dataIn(04):     Maximum Wing Thickness (% of chord)
% +     dataIn(05):     Secondary Structure Added Wing Weight (% of distributed weight)
% +     dataIn(06):     Wing Skin Thickness (inch)
% +     dataIn(07):     Wing Skin Weight Density (lb/in^3)
% +     dataIn(08):     Skin Material Shear Modulus (Msi)
% +     dataIn(09):     Skin Material Yield Strength - Shear (Ksi)
% +     dataIn(10):     Skin Material Ultimate Strength - Shear (Ksi)
% +     dataIn(11):     Stringers #1 and #2: Y-location (% of chord)   
% +     dataIn(12):     Stringers #1 and #2: Section area (A) (inch^2)
% +     dataIn(13):     Stringers #1 and #2: Section inertia about y-axis (Iyy) (inch^4)  
% +     dataIn(14):     Stringers #1 and #2: Section inertia about z-axis (Izz) (inch^4)  
% +     dataIn(15):     Stringers #1 and #2: Section product of inertia   (Iyz) (inch^4)
% +     dataIn(16):     Stringers #1 and #2: Weight density (lb/in^3)
% +     dataIn(17):     Stringers #1 and #2: Young's modulus                 (Msi)
% +     dataIn(18):     Stringers #1 and #2: Yield strength    - tension     (Ksi)
% +     dataIn(19):     Stringers #1 and #2: Ultimate strength - tension     (Ksi)
% +     dataIn(20):     Stringers #1 and #2: Yield strength    - comptrddion (Ksi)
% +     dataIn(21):     Stringers #1 and #2: Ultimate strength - compression (Ksi)
% +     dataIn(22):     Stringers #3 and #4: Y-location (% of chord)   
% +     dataIn(23):     Stringers #3 and #4: Section area (A) (inch^2)
% +     dataIn(24):     Stringers #3 and #4: Section inertia about y-axis (Iyy) (inch^4)  
% +     dataIn(25):     Stringers #3 and #4: Section inertia about z-axis (Izz) (inch^4)  
% +     dataIn(26):     Stringers #3 and #4: Section product of inertia   (Iyz) (inch^4)
% +     dataIn(27):     Stringers #3 and #4: Weight density (lb/in^3)
% +     dataIn(28):     Stringers #3 and #4: Young's modulus                 (Msi)
% +     dataIn(29):     Stringers #3 and #4: Yield strength    - tension     (Ksi)
% +     dataIn(30):     Stringers #3 and #4: Ultimate strength - tension     (Ksi)
% +     dataIn(31):     Stringers #3 and #4: Yield strength    - comptrddion (Ksi)
% +     dataIn(32):     Stringers #3 and #4: Ultimate strength - compression (Ksi)
% +     dataIn(33):     Safety Factor - Yield
% +     dataIn(34):     Safety Factor - Ultimate
% +     dataIn(35):     First Load Location  - X (% of Length)
% +     dataIn(36):     Concentrated Force   - X Direction (lb)
% +     dataIn(37):     Concentrated Force   - Y Direction (lb)
% +     dataIn(38):     Concentrated Force   - Z Direction (lb) 
% +     dataIn(39):     Concentrated Torque  - About X Direction (lb-in)
% +     dataIn(40):     Concentrated Moment  - About Y Direction (lb-in)
% +     dataIn(41):     Concentrated Moment  - About Z Direction (lb-in)
% +     dataIn(42):     Second Load Location - X (% of Length)
% +     dataIn(43):     Concentrated Force   - X Direction (lb)
% +     dataIn(44):     Concentrated Force   - Y Direction (lb)
% +     dataIn(45):     Concentrated Force   - Z Direction (lb) 
% +     dataIn(46):     Concentrated Torque  - About X Direction (lb-in)
% +     dataIn(47):     Concentrated Moment  - About Y Direction (lb-in)
% +     dataIn(48):     Concentrated Moment  - About Z Direction (lb-in)
% +     dataIn(49):     Aircraft Load Factor
% +     dataIn(50):     Drag Distribution - Constant (lb/in)
% +     dataIn(51):     Drag Distribution - rth order (lb/in)
% +     dataIn(52):     Drag Distribution - polynomial order
% +     dataIn(53):     Lift Distribution - Constant (lb/in)
% +     dataIn(54):     Lift Distribution - 2nd Order (lb/in)
% +     dataIn(55):     Lift Distribution - 4th Order (lb/in)
% +     dataIn(56):     Twist Moment Distribution - Constant (lb-in/in)
% +     dataIn(57):     Twist Moment Distribution - 1st Order (lb-in/in)
% +
% +  Output Data
% +   Name:             Name of author of this analysis function           
% +   PID:              UCSD Student ID number of author
% +   dataOut1:         Packed calculated output variable data
% +     dataOut1(01):   Modulus Weighted Centroid y-direction (inch)
% +     dataOut1(02):   Modulus Weighted Centroid z-direction (inch)
% +     dataOut1(03):   Cross-Section Weight rho*A (lb/in)
% +     dataOut1(04):   Axial   Stiffness EA   (lb)
% +     dataOut1(05):   Bending Stiffness EIyy (lb-in^2)   
% +     dataOut1(06):   Bending Stiffness EIzz (lb-in^2)   
% +     dataOut1(07):   Bending Stiffness EIyz (lb-in^2)   
% +     dataOut1(08):   Torsion Stiffness GJ   (lb-in^2)
% +     dataOut1(09):   Shear Center, y-direction (inch)
% +     dataOut1(10):   Shear Center, z-direction (inch)
% +     dataOut1(11):   Total Half-Span Wing Weight including added weight factor (lb)
% +     dataOut1(12):   Root Internal Force - X Direction (lb)
% +     dataOut1(13):   Root Internal Force - Y Direction (lb)
% +     dataOut1(14):   Root Internal Force - Z Direction (lb)
% +     dataOut1(15):   Root Internal Moment - about X Direction (lb-in)
% +     dataOut1(16):   Root Internal Moment - about Y Direction (lb-in)
% +     dataOut1(17):   Root Internal Moment - about Z Direction (lb-in)
% +     dataOut1(18):   Stringer (#1) Calculated Axial Stress (lb/in^2)
% +     dataOut1(19):   Stringer (#1) Allowable Stress - Tension (lb/in^2)
% +     dataOut1(20):   Stringer (#1) Allowable Stress - Compression (lb/in^2)
% +     dataOut1(21):   Stringer (#1) Margin of Safety
% +     dataOut1(22):   Stringer (#2) Calculated Axial Stress (lb/in^2)
% +     dataOut1(23):   Stringer (#2) Allowable Stress - Tension (lb/in^2)
% +     dataOut1(24):   Stringer (#2) Allowable Stress - Compression (lb/in^2)
% +     dataOut1(25):   Stringer (#2) Margin of Safety
% +     dataOut1(26):   Stringer (#3) Calculated Axial Stress (lb/in^2)
% +     dataOut1(27):   Stringer (#3) Allowable Stress - Tension (lb/in^2)
% +     dataOut1(28):   Stringer (#3) Allowable Stress - Compression (lb/in^2)
% +     dataOut1(29):   Stringer (#3) Margin of Safety
% +     dataOut1(30):   Stringer (#4) Calculated Axial Stress (lb/in^2)
% +     dataOut1(31):   Stringer (#4) Allowable Stress - Tension (lb/in^2)
% +     dataOut1(32):   Stringer (#4) Allowable Stress - Compression (lb/in^2)
% +     dataOut1(33):   Stringer (#4) Margin of Safety
% +     dataOut1(34):   Skin Panel (1.2) Calculated Shear Stress (lb/in^2)
% +     dataOut1(35):   Skin Panel (1.2) Allowable Stress - Shear (lb/in^2)
% +     dataOut1(36):   Skin Panel (1.2) Margin of Safety
% +     dataOut1(37):   Skin Panel (2.3) Calculated Shear Stress (lb/in^2)
% +     dataOut1(38):   Skin Panel (2.3) Allowable Stress - Shear (lb/in^2)
% +     dataOut1(39):   Skin Panel (2.3) Margin of Safety
% +     dataOut1(40):   Skin Panel (3.4) Calculated Shear Stress (lb/in^2)
% +     dataOut1(41):   Skin Panel (3.4) Allowable Stress - Shear (lb/in^2)
% +     dataOut1(42):   Skin Panel (3.4) Margin of Safety
% +     dataOut1(43):   Skin Panel (4.1) Calculated Shear Stress (lb/in^2)
% +     dataOut1(44):   Skin Panel (4.1) Allowable Stress - Shear (lb/in^2)
% +     dataOut1(45):   Skin Panel (4.1) Margin of Safety
% +     dataOut1(46):   Tip Displacement  - X Direction (inch)
% +     dataOut1(47):   Tip Displacement  - Y Direction (inch)
% +     dataOut1(48):   Tip Displacement  - Z Direction (inch)
% +     dataOut1(49):   Tip Twist (degree)
% +     dataOut1(50):   Tip Bending Slope (dv/dx) (inch/inch)
% +     dataOut1(51):   Tip Bending Slope (dw/dx) (inch/inch)
% +
% +   dataOut2(nplot,24):  Packed calculated output plot data
% +     column( 1):     X direction coordinate (inch)
% +     column( 2):     Applied distributed drag force (lb/in)   
% +     column( 3):     Applied distributed lift force (lb/in)   
% +     column( 4):     Applied distributed torque (lb-in/in)   
% +     column( 5):     Internal shear force  - Vx (lb)   
% +     column( 6):     Internal shear force  - Vy (lb)   
% +     column( 7):     Internal shear force  - Vz (lb)   
% +     column( 8):     Internal axial torque - Mx (lb-in)
% +     column( 9):     Internal bending moment - My (lb-in)
% +     column(10):     Internal bending moment - Mz (lb-in)
% +     column(11):     Stringer (#1) Axial Stress (lb/in^2) 
% +     column(12):     Stringer (#2) Axial Stress (lb/in^2) 
% +     column(13):     Stringer (#3) Axial Stress (lb/in^2) 
% +     column(14):     Stringer (#4) Axial Stress (lb/in^2) 
% +     column(15):     Skin Panel (1.2) Shear Stress (lb/in^2) 
% +     column(16):     Skin Panel (2.3) Shear Stress (lb/in^2) 
% +     column(17):     Skin Panel (3.4) Shear Stress (lb/in^2) 
% +     column(18):     Skin Panel (4.1) Shear Stress (lb/in^2)
% +     column(19):     Displacement - X Direction (inch) 
% +     column(20):     Displacement - Y Direction (inch) 
% +     column(21):     Displacement - z Direction (inch) 
% +     column(22):     Twist (Twist1 + Twist2 + Twist3) (degree)
% +     column(23):     Bending Slope (dv/dx) (inch/inch)
% +     column(24):     Bending Slope (dw/dx) (inch/inch)
% +     column(25):     Twist1 (Twist from Vy only)  (degree)
% +     column(26):     Twist2 (Twist from Vz only)  (degree)
% +     column(27):     Twist3 (Twist from Mx only)  (degree)
% +
% + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + +

% . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
% .  SECTION (#1): Unpack Input Data Array and Write User Name and PID
% . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
   disp('     (1) Unpack Input Data and Write User Name and PID')

   nplot    = dataIn( 1);              % number of output plot data points
   Lo       = dataIn( 2);              % Wing Length (inch)
   Co       = dataIn( 3);              % Wing Chord  (inch)
   tmax     = dataIn( 4)*Co/100;       % Maximum Wing Thickness (inch)
   Kaw      = dataIn( 5);              % Secondary Structure Added Weight (% of wing weight)

   T_sk     = dataIn( 6);              % Wing Skin Thickness (inch)
   rho_sk   = dataIn( 7);              % Wing Skin Weight Density (lb/inch^3)
   G_sk     = dataIn( 8)*(1000000.);   % Skin Material Shear Modulus (lb/in^2)
   Tau_y_sk = dataIn( 9)*(   1000.);   % Skin Material Yield Shear Strength (lb/in^2)
   Tau_u_sk = dataIn(10)*(   1000.);   % Skin Material Ultimate Shear Strength (lb/in^2)

   Yo(1)    = dataIn(11)*Co/100;       % Stringer #1 Y-location (inch)
   Zo(1)    = tmax/2.;                 % Stringer #1 Z-location (inch)
   As(1)    = dataIn(12);              % Stringer #1 Cross-Section Area (inch^2)
   Iyys(1)  = dataIn(13);              % Stringer #1 Iyy Inertia about the y-axis (inch^4)
   Izzs(1)  = dataIn(14);              % Stringer #1 Izz Inertia about the z-axis (inch^4)
   Iyzs(1)  = dataIn(15);              % Stringer #1 Iyz Product of Inertia (inch^4)
   rhos(1)  = dataIn(16);              % Stringer #1 Weight Density (lb/inch^3)
   Es(1)    = dataIn(17)*(1000000.);   % Stringer #1 Young's Modulus (lb/in^2)
   SyTs(1)  = dataIn(18)*(   1000.);   % Stringer #1 Yield Strength    - Tension (lb/in^2)
   SuTs(1)  = dataIn(19)*(   1000.);   % Stringer #1 Ultimate Strength - Tension (lb/in^2)
   SyCs(1)  = dataIn(20)*(   1000.);   % Stringer #1 Yield Strength    - Compression (lb/in^2)
   SuCs(1)  = dataIn(21)*(   1000.);   % Stringer #1 Ultimate Strength - Compression (lb/in^2)

   Yo(2)    = dataIn(11)*Co/100;       % Stringer #2 Y-location (inch)
   Zo(2)    =-tmax/2.;                 % Stringer #2 Z-location (inch)
   As(2)    = dataIn(12);              % Stringer #2 Cross-Section Area (inch^2)
   Iyys(2)  = dataIn(13);              % Stringer #2 Iyy Inertia about the y-axis (inch^4)
   Izzs(2)  = dataIn(14);              % Stringer #2 Izz Inertia about the z-axis (inch^4)
   Iyzs(2)  = dataIn(15);              % Stringer #2 Iyz Product of Inertia (inch^4)
   rhos(2)  = dataIn(16);              % Stringer #2 Weight Density (lb/inch^3)
   Es(2)    = dataIn(17)*(1000000.);   % Stringer #2 Young's Modulus (lb/in^2)
   SyTs(2)  = dataIn(18)*(   1000.);   % Stringer #2 Yield Strength    - Tension (lb/in^2)
   SuTs(2)  = dataIn(19)*(   1000.);   % Stringer #2 Ultimate Strength - Tension (lb/in^2)
   SyCs(2)  = dataIn(20)*(   1000.);   % Stringer #2 Yield Strength    - Compression (lb/in^2)
   SuCs(2)  = dataIn(21)*(   1000.);   % Stringer #2 Ultimate Strength - Compression (lb/in^2)

   Yo(3)    = dataIn(22)*Co/100;       % Stringer #3 Y-location (inch)
   Zo(3)    =-tmax/2.;                 % Stringer #3 Z-location (inch) 
   As(3)    = dataIn(23);              % Stringer #3 Cross-Section Area (inch^2)
   Iyys(3)  = dataIn(24);              % Stringer #3 Iyy Inertia about the y-axis (inch^4)
   Izzs(3)  = dataIn(25);              % Stringer #3 Izz Inertia about the z-axis (inch^4)
   Iyzs(3)  = dataIn(26);              % Stringer #3 Iyz Product of Inertia (inch^4)
   rhos(3)  = dataIn(27);              % Stringer #3 Weight Density (lb/inch^3)
   Es(3)    = dataIn(28)*(1000000.);   % Stringer #3 Young's Modulus (lb/in^2)
   SyTs(3)  = dataIn(29)*(   1000.);   % Stringer #3 Yield Strength    - Tension (lb/in^2)
   SuTs(3)  = dataIn(30)*(   1000.);   % Stringer #3 Ultimate Strength - Tension (lb/in^2)
   SyCs(3)  = dataIn(31)*(   1000.);   % Stringer #3 Yield Strength    - Compression (lb/in^2)
   SuCs(3)  = dataIn(32)*(   1000.);   % Stringer #3 Ultimate Strength - Compression (lb/in^2)

   Yo(4)    = dataIn(22)*Co/100;       % Stringer #4 Y-location (inch)
   Zo(4)    = tmax/2.;                 % Stringer #4 Z-location (inch) 
   As(4)    = dataIn(23);              % Stringer #4 Cross-Section Area (inch^2)
   Iyys(4)  = dataIn(24);              % Stringer #4 Iyy Inertia about the y-axis (inch^4)
   Izzs(4)  = dataIn(25);              % Stringer #4 Izz Inertia about the z-axis (inch^4)
   Iyzs(4)  = dataIn(26);              % Stringer #4 Iyz Product of Inertia (inch^4)
   rhos(4)  = dataIn(27);              % Stringer #4 Weight Density (lb/inch^3)
   Es(4)    = dataIn(28)*(1000000.);   % Stringer #4 Young's Modulus (lb/in^2)
   SyTs(4)  = dataIn(29)*(   1000.);   % Stringer #4 Yield Strength    - Tension (lb/in^2)
   SuTs(4)  = dataIn(30)*(   1000.);   % Stringer #4 Ultimate Strength - Tension (lb/in^2)
   SyCs(4)  = dataIn(31)*(   1000.);   % Stringer #4 Yield Strength    - Compression (lb/in^2)
   SuCs(4)  = dataIn(32)*(   1000.);   % Stringer #4 Ultimate Strength - Compression (lb/in^2)

   SFy      = dataIn(33);              % Safety Factor - Yield
   SFu      = dataIn(34);              % Safety Factor - Ultimate

   x1       = dataIn(35)*Lo/100;       % First Load Location (inch)
   Fx1      = dataIn(36);              % Concentrated Force - X Direction (lb)
   Fy1      = dataIn(37);              % Concentrated Force - Y Direction (lb)
   Fz1      = dataIn(38);              % Concentrated Force - Z Direction (lb)   
   Mx1      = dataIn(39);              % Concentrated Torque - About X Direction (lb-in)
   My1      = dataIn(40);              % Concentrated Moment - About Y Direction (lb-in)
   Mz1      = dataIn(41);              % Concentrated Moment - About Z Direction (lb-in)
   
   x2       = dataIn(42)*Lo/100;       % Second Load Location (inch)
   Fx2      = dataIn(43);              % Concentrated Force - X Direction (lb)
   Fy2      = dataIn(44);              % Concentrated Force - Y Direction (lb)
   Fz2      = dataIn(45);              % Concentrated Force - Z Direction (lb)   
   Mx2      = dataIn(46);              % Concentrated Torque - About X Direction (lb-in)
   My2      = dataIn(47);              % Concentrated Moment - About Y Direction (lb-in)
   Mz2      = dataIn(48);              % Concentrated Moment - About Z Direction (lb-in)

   LF       = dataIn(49);              % Aircraft Load Factor

   py0      = dataIn(50);              % Drag Distribution - Constant (lb/in)
   pyr      = dataIn(51);              % Drag Distribution - rth order (lb/in)
   rth      = dataIn(52);              % Drag Distribution - polynomial order
   pz0      = dataIn(53);              % Lift Distribution - Constant (lb/in)
   pz2      = dataIn(54);              % Lift Distribution - 2nd Order (lb/in)
   pz4      = dataIn(55);              % Lift Distribution - 4th Order (lb/in)
   mx0      = dataIn(56);              % Twist Moment Distribution - Constant (lb-in/in)
   mx1      = dataIn(57);              % Twist Moment Distribution - 1st Order (lb-in/in)

% Define author name and PID (Write in your name and PID)    
   name     = {'Sainirnay Mantrala'};
   PID      = {'A17477737'};

% . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
% .  SECTION (#2): Calculate the Centroid, Mass Properties, and Modulus- 
% .                Weighted Bending Section Properties.  

   disp('     (2) Calculate the Centroid and Bending Section Properties')

%  2.1) Calculate Modulus-Weighted Centroid.  Use stringers only.
%  --------------------------------------------------------------
EA = sum(Es.* As);
Yc = sum(Es.* As.* Yo)./EA;
Zc = sum(Es.* As.* Zo)./EA;

%  2.2) Calculate Modulus-Weighted Stiffnesses (EIyy, EIzz, EIyz) about 
%       the modulus weighted centroid.  Use stringers only.
%  ---------------------------------------------------------------------
EIyy = sum(Es.* Iyys + Es.* As.*(Zo-Zc).^2);
EIzz = sum(Es.* Izzs + Es.* As.*(Yo-Yc).^2);
EIyz = sum(Es.* Iyzs + Es.* As.*(Yo-Yc).*(Zo-Zc));

kyy = EIyy/((EIyy*EIzz) - EIyz^2);
kzz = EIzz/((EIyy*EIzz) - EIyz^2);
kyz = EIyz/((EIyy*EIzz) - EIyz^2);

%  2.3) Calculate the cross-section weight (stringers and skin) and the total wing weight
%  --------------------------------------------------------------------------------------
% T_sk Wing Skin Thickness (inch)
% rho_sk Wing Skin Weight Density (lb/inch^3)

stringer_w = sum(rhos.*As); % lb/inch
half_ell_P = (pi/2)*(3*(Co/4 + (tmax/2)) - sqrt( (3*(Co/4) + (tmax/2))*(Co/4 + 3*(tmax/2)) ));
horiz_P = (Co/4)*2;
taper_P = sqrt((tmax/2)^2 + (Co/2)^2)*2;
skin_A = (half_ell_P + horiz_P + taper_P)*T_sk;
skin_w = skin_A*rho_sk; % lb/inch
W_wing = ((stringer_w + skin_w) * Lo) * (1 + Kaw/100);
rhoA = W_wing/Lo;
                  
% . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
% .  SECTION (#3): Calculate Root and Distributed Stress Resultants for
% .                Applied Concentrated Forces and Aerodynamic Loads
% . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
   disp('     (3) Calculate Root and Distributed Stress Resultants for Applied Loads')

x = linspace(0, Lo, nplot);

% 3.a) Applied Aerodynamic Forces (move distributed lift from C/4 to
%      centroid.  Move distributed weight (nw) from C/2 to centroid.

dist_lift = pz0 + pz2/(Lo^2).*(x.^2) + pz4/(Lo^4).*(x.^4);
nw = -LF*rhoA;
pz = dist_lift + nw;

% Lift (z-direction)
Vz_L = -1*(pz0.*x + pz2/(Lo^2)*(1/3).*(x.^3) + pz4/(Lo^4)*(1/5).*(x.^5)); % - Vzo
Vzo_L = -Vz_L(end);
Vz_L = Vz_L + Vzo_L;
Vz_L_in = -1*(0.5*pz0.*(x.^2) + pz2/(Lo^2)*(1/12).*(x.^4) + pz4/(Lo^4)*(1/30).*(x.^6) - Vzo_L.*x);

% weight (z-direction)
Vz_w = (-nw).*x;
Vzo_w = -Vz_w(end);
Vz_w = Vz_w + Vzo_w;
Vz_w_in = 0.5*(-nw).*(x.^2) + Vzo_w.*x;

% Torsion (x-direction)
mx = mx0 + (mx1/Lo).*(x) - dist_lift.*(Yc - Co/4) + nw*(Co/2 - Yc);
Mx = -1*(mx0.*x + 0.5*(mx1/Lo).*(x.^2) + Vz_L.*(Yc - Co/4) - Vz_w.*(Co/2 - Yc)); % added Vz and nw terms from Saint Venant's 
Mxo_c = - Mx(end);
Mx = Mx + Mxo_c;
Mxo = Mx(1);
Mx_in = -1*((1/2)*mx0.*(x.^2) + (1/6)*(mx1/Lo).*(x.^3) + Vz_L_in.*(Yc - Co/4) - Vz_w_in.*(Co/2 - Yc) - Mxo_c.*x);

% Weight (z-direction)
Vz = Vz_L + Vz_w;
Vzo = Vzo_L + Vzo_w;
Vz_in = -1*(0.5*pz0.*(x.^2) + pz2/(Lo^2)*(1/12).*(x.^4) + pz4/(Lo^4)*(1/30).*(x.^6) - 0.5*LF*rhoA.*(x.^2) - Vzo.*x);

% (y-axis points into page)
My = -1*(0.5*pz0.*(x.^2) + pz2/(Lo^2)*(1/12).*(x.^4) + pz4/(Lo^4)*(1/30).*(x.^6) - 0.5*LF*rhoA.*(x.^2) - Vzo.*x); % + Myo
Myo = -My(end);
My = My + Myo;

DwDx = -1*((1/6)*pz0.*(x.^3) + pz2/(Lo^2)*(1/60).*(x.^5) + pz4/(Lo^4)*(1/210).*(x.^7) - (1/6)*LF*rhoA.*(x.^3) - (1/2)*Vzo.*(x.^2) - Myo.*x).*(-kzz); % My mult by neg
Disp_Z = -1*((1/24)*pz0.*(x.^4) + pz2/(Lo^2)*(1/360).*(x.^6) + pz4/(Lo^4)*(1/(210*8)).*(x.^8) - (1/24)*LF*rhoA.*(x.^4) - (1/6)*Vzo.*(x.^3) - (1/2)*Myo.*(x.^2)).*(-kzz);

% Drag (y-direction)
py = py0 + (pyr/Lo^rth).*(x.^(rth));
Vy = -1*(py0.*x + (pyr/Lo^rth)*(1/(rth+1)).*(x.^(rth+1))); % - Vyo
Vyo = -Vy(end);
Vy = Vy + Vyo;
Vy_in = -1*(0.5*py0.*(x.^2) + (pyr/Lo^rth)*( 1/((rth+1)*(rth+2)) ).*(x.^(rth+2)) - Vyo.*x);

% (z-axis points out of page)
Mz = (0.5*py0.*(x.^2) + (pyr/Lo^rth)*( 1/((rth+1)*(rth+2)) ).*(x.^(rth+2)) - Vyo.*x); % - Mzo
Mzo = -Mz(end);
Mz = Mz + Mzo;

DvDx = ((1/6)*py0.*(x.^3) + (pyr/Lo^rth)*( 1/((rth+1)*(rth+2)*(rth+3)) ).*(x.^(rth+3)) - (1/2)*Vyo.*(x.^2) + Mzo.*x).*kyy;
Disp_Y = ((1/24)*py0.*(x.^4) + (pyr/Lo^rth)*(1/((rth+1)*(rth+2)*(rth+3)*(rth+4))).*(x.^(rth+4)) - (1/6)*Vyo.*(x.^3) + (1/2)*Mzo.*(x.^2)).*kyy;

% 3.b) Combine Applied Concentrated Forces (1) and (2). These loads are at (Co/4)
% Inital conditions

Vzo = Vzo + Fz1 + Fz2;
Myo = Myo -Fz1*x1 + My1 - Fz2*x2 + My2;

Vyo = Vyo + Fy1 + Fy2;
Mzo = Mzo + Fy1*x1 + Mz1 + Fy2*x2 + Mz2 + (Fx1 + Fx2)*(Yc - Co/4);

Vxo =  Fx1 + Fx2;
Mxo = Mxo + Mx1 + Mx2 - (Fz1 + Fz2)*(Yc - Co/4);

Vx = x.*0;
Disp_X = x.*0;
for i = 1:length(x)
    if(x(i) <= x1)
        j = i;
        % Z-direction
        Vz(i) = Vz(i) + Fz1;
        Vz_in_j = Fz1*x(i);
        Vz_in(i) = Vz_in(i) + Vz_in_j;

        My(i) = My(i) + Fz1*x(i) - Fz1*x1 + My1;
        DwDx_j = (0.5*Fz1*x(i)^2 - Fz1*x1*x(i) + My1*x(i)).*(-1/EIyy);
        DwDx(i) = DwDx(i) + DwDx_j;
        Disp_Z_j = ((1/6)*Fz1*x(i)^3 - 0.5*Fz1*x1*x(i)^2 + 0.5*My1*x(i)^2).*(-1/EIyy);
        Disp_Z(i) = Disp_Z(i) + Disp_Z_j;

        % Y-direction
        Vy(i) = Vy(i) + Fy1;
        Vy_in_j = Fy1*x(i);
        Vy_in(i) = Vy_in(i) + Vy_in_j; % check sign

        Mz(i) = Mz(i) - Fy1*x(i) + Fy1*x1 + Mz1 + Fx1*(Yc - Co/4);
        DvDx_j = (-0.5*Fy1*x(i)^2 + Fy1*x1*x(i) + Mz1*x(i) + Fx1*(Yc - Co/4)*x(i)).*(1/EIzz);
        DvDx(i) = DvDx(i) + DvDx_j;
        Disp_Y_j = ((-1/6)*Fy1*x(i)^3 + 0.5*Fy1*x1*x(i)^2 + 0.5*Mz1*x(i)^2 + 0.5*Fx1*(Yc - Co/4)*x(i)^2).*(1/EIzz);
        Disp_Y(i) = Disp_Y(i) + Disp_Y_j;

        % X-direction
        Vx(i) = Vx(i) + Fx1;
        Disp_X_j = (Fx1*x(i))/EA;
        Disp_X(i) = Disp_X(i) + Disp_X_j;

        Mx(i) = Mx(i) + Mx1 - (Fz1)*(Yc - Co/4);
        Mx_in_j = Mx1*x(i) - (Fz1)*(Yc - Co/4)*x(i);
        Mx_in(i) = Mx_in(i) + Mx_in_j;
        
    else
        % Z-direction
        DwDx(i) = DwDx(i) + DwDx_j;
        Disp_Z(i) = Disp_Z(i) + Disp_Z_j + DwDx_j*(x(i) - x1);
        Vz_in(i) = Vz_in(i) + Vz_in_j;

        % Y-direction
        DvDx(i) = DvDx(i) + DvDx_j;
        Disp_Y(i) = Disp_Y(i) + Disp_Y_j + DvDx_j*(x(i) - x1);
        Vy_in(i) = Vy_in(i) + Vy_in_j;

        % X-direction
        Disp_X(i) = Disp_X(i) + Disp_X_j;
        Mx_in(i) = Mx_in(i) + Mx_in_j;

    end
    if(x(i) <= x2)
        k = i;
        % Z-direction
        Vz(i) = Vz(i) + Fz2;
        Vz_in_k = Fz2*x(i);
        Vz_in(i) = Vz_in(i) + Vz_in_k;

        My(i) = My(i) + Fz2*x(i) - Fz2*x2 + My2;
        DwDx_k = (0.5*Fz2*x(i)^2 - Fz2*x2*x(i) + My2*x(i)).*(-1/EIyy);
        DwDx(i) = DwDx(i) + DwDx_k;
        Disp_Z_k = ((1/6)*Fz2*x(i)^3 - 0.5*Fz2*x2*x(i)^2 + 0.5*My2*x(i)^2).*(-1/EIyy);
        Disp_Z(i) = Disp_Z(i) + Disp_Z_k;

        % Y-direction
        Vy(i) = Vy(i) + Fy2;
        Vy_in_k = Fy2*x(i);
        Vy_in(i) = Vy_in(i) + Vy_in_k; % check sign

        Mz(i) = Mz(i) - Fy2*x(i) + Fy2*x2 + Mz2 + Fx2*(Yc - Co/4);
        DvDx_k = (-0.5*Fy2*x(i)^2 + Fy2*x2*x(i) + Mz2*x(i) + Fx2*(Yc - Co/4)*x(i)).*(1/EIzz);
        DvDx(i) = DvDx(i) + DvDx_k;
        Disp_Y_k = ((-1/6)*Fy2*x(i)^3 + 0.5*Fy2*x2*x(i)^2 + 0.5*Mz2*x(i)^2 + 0.5*Fx2*(Yc - Co/4)*x(i)^2).*(1/EIzz);
        Disp_Y(i) = Disp_Y(i) + Disp_Y_k;

        % X-direction
        Vx(i) = Vx(i) + Fx2;
        Disp_X_k = (Fx2*x(i))/EA;
        Disp_X(i) = Disp_X(i) + Disp_X_k;

        % Twist x-direction
        Mx(i) = Mx(i) + Mx2 - (Fz2)*(Yc - Co/4);
        Mx_in_k = Mx2*x(i) - (Fz2)*(Yc - Co/4)*x(i);
        Mx_in(i) = Mx_in(i) + Mx_in_k;

    else
        % Z-direction
        DwDx(i) = DwDx(i) + DwDx_k;
        Disp_Z(i) = Disp_Z(i) + Disp_Z_k + DwDx_k*(x(i) - x2);
        Vz_in(i) = Vz_in(i) + Vz_in_k;

        % Y-direction
        DvDx(i) = DvDx(i) + DvDx_k;
        Disp_Y(i) = Disp_Y(i) + Disp_Y_k + DvDx_k*(x(i) - x2);
        Vy_in(i) = Vy_in(i) + Vy_in_k;

        % X-direction
        Disp_X(i) = Disp_X(i) + Disp_X_k;
        Mx_in(i) = Mx_in(i) + Mx_in_k;

    end
end

% . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
% .  SECTION (#4): STRINGER STRESSES: Calculate Allowable Properties, 
% .                Root Stresses, Margins of Safety, and Stress Distribution
% . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
   disp('     (4) Calculate Stringer Stress Distribution and Root Margins of Safety')

% 4.1) Calculate root stringer stresses and margins of safety 
A = [(1/EA), 0, 0; 0, kyy, -kyz; 0, -kyz, kzz];

Sxx1 = x.*0;
Sxx2 = x.*0;
Sxx3 = x.*0;
Sxx4 = x.*0;

for i = 1:length(x)
    Sxx1(i) = Es(1)*[1, -(Yo(1)-Yc), -(Zo(1)-Zc)]*A*[Vx(i); Mz(i); -My(i)];
    Sxx2(i) = Es(2)*[1, -(Yo(2)-Yc), -(Zo(2)-Zc)]*A*[Vx(i); Mz(i); -My(i)];
    Sxx3(i) = Es(3)*[1, -(Yo(3)-Yc), -(Zo(3)-Zc)]*A*[Vx(i); Mz(i); -My(i)];
    Sxx4(i) = Es(4)*[1, -(Yo(4)-Yc), -(Zo(4)-Zc)]*A*[Vx(i); Mz(i); -My(i)];
end

Sxxo(1) = Sxx1(1);
Sxxo(2) = Sxx2(1);
Sxxo(3) = Sxx3(1);
Sxxo(4) = Sxx4(1);

Sat = min(SyTs./SFy, SuTs./SFu);
Sac = max(SyCs./SFy, SuCs./SFu);

MSs = ((Sxxo < 0).*(Sac./Sxxo) + (Sxxo > 0).*(Sat./Sxxo)) - 1;


% . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
% .  SECTION (#5): SHEAR STUDIES:  Torsion and Transverse Loading. Calculatemx
% .                shear flow, shear stresses, and margin of safety.
% . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
   disp('     (5) Calculate Shear Flow, Shear Stresses, and Margins of Safety')

%  5.1) Preliminaries:  Calculate the leading edge ellipse area, perimeter,
%       and torsion constant (GJ)

A12 = (pi/2)*(Co/4)*(tmax/2) + tmax*(Yo(1)-Co/4) + (1/2)*tmax*(Yc-Yo(1));
A23 = (Yo(3)-Yo(2))*(tmax/4);
A34 = (1/2)*tmax*(Yo(3)-Yc) + tmax*((Co/2)-Yo(3)) + (Co/2)*(tmax/2);
A41 = A23;
A_in = A12 + A23 + A34 + A41;
GJ = (4*(A_in^2)*G_sk*T_sk)/(half_ell_P + horiz_P + taper_P);

%  5.2) Shear Flow Analysis

   %  Calculate the unit shear flows for the three cases (Vy, Vz, Mx) separately:
   
K = [2*A12 2*A23 2*A34 2*A41; 1 -1 0 0; 0 1 -1 0; 0 0 1 -1];
K_in = inv(K);

fy = kyy * (Es.*As.*(Yo-Yc)).';
fy(1) = -Zc;
fz = kzz * (Es.*As.*(Zo-Zc)).';
fz(1) = Yc - Co/4;
fm = [1; 0; 0; 0];

q_Vy = K_in*fy*[Vy];
q_Vz = K_in*fz*[Vz];
q_Mx = K_in*fm*[Mx];

q = q_Vy + q_Vz + q_Mx;

   %  Calculate the shear stress distribution along the length from (Mx), (Vy), and (Vz)
Tau = q./T_sk;
Tau_12 = Tau(1,:);
Tau_23 = Tau(2,:);
Tau_34 = Tau(3,:);
Tau_41 = Tau(4,:);

   %  Calculate the skin shear allowable stress and margin of safety (MS)
   %  at the root
Tau_allow_sk12 = min(Tau_y_sk/SFy, Tau_u_sk/SFu);
Tau_allow_sk23 = min(Tau_y_sk/SFy, Tau_u_sk/SFu);
Tau_allow_sk34 = min(Tau_y_sk/SFy, Tau_u_sk/SFu);
Tau_allow_sk41 = min(Tau_y_sk/SFy, Tau_u_sk/SFu);

MS_sk12 = Tau_allow_sk12/abs(Tau_12(1)) - 1;
MS_sk23 = Tau_allow_sk23/abs(Tau_23(1)) - 1;
MS_sk34 = Tau_allow_sk34/abs(Tau_34(1)) - 1;
MS_sk41 = Tau_allow_sk41/abs(Tau_41(1)) - 1;

% . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
% .  SECTION (#6): SHEAR STUDIES:  Torsion and Transverse Loading. Calculate
% .                the twist distribution and tip twist.
% . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
   disp('     (6) Calculate the Twist Distribution and Tip Twist')


S12 = half_ell_P + 2*(Yo(1)-Co/4);
S23 = Yo(3) - Yo(2);
S34 = taper_P + 2*(Co/2 - Yo(3));
S41 = S23;

Twist1 = (180/pi)*(1/(2*A_in*G_sk*T_sk)).*[S12 S23 S34 S41]*K_in*fy*[Vy_in];
Twist2 = (180/pi)*(1/(2*A_in*G_sk*T_sk)).*[S12 S23 S34 S41]*K_in*fz*[Vz_in];
Twist3 = (180/pi)*(1/(2*A_in*G_sk*T_sk)).*[S12 S23 S34 S41]*K_in*fm*[Mx_in];

Twist = Twist1 + Twist2 + Twist3;

% . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
% .  SECTION (#7): SHEAR STUDIES:  Torsion and Transverse Loading.
% .                Calculate the shear center location.
% . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
   disp('     (7) Calculate the Shear Center Location')

   %  Calculate the shear center location (y-direction).  Apply a unit tip 
   %  load (Vz = Pz = 1) that is offset from the centroid by (ey) such that 
   %  (Mx = Pz*ey).  Calculate the twist rate and set to zero.  Solve for (ey).


   %  Calculate the shear center location (z-direction).  Apply a unit tip 
   %  load (Vy = Py = 1) that is offset from the centroid by (ez) such that 
   %  (Mx = -Py*ez).  Calculate the twist rate and set to zero. Solve for (ez).

% Shear center y
fz_cy = kzz * (Es.*As.*(Zo-Zc)).';
fz_cy(1) = Yc - Co/4;
fm_c = [1; 0; 0; 0];

dtheta_dx_z = (1/(2*A_in*G_sk*T_sk)).*[S12 S23 S34 S41]*K_in*fz_cy;
dtheta_dx_m = (1/(2*A_in*G_sk*T_sk)).*[S12 S23 S34 S41]*K_in*fm_c;

eY =  - (dtheta_dx_z/dtheta_dx_m);
Ysc_LE = Yc + eY;

% Shear center z
fy_cz = kyy * (Es.*As.*(Yo-Yc)).';
fy_cz(1) = -Zc;
dtheta_dx_y = (1/(2*A_in*G_sk*T_sk)).*[S12 S23 S34 S41]*K_in*fy_cz;

eZ =  (dtheta_dx_y/dtheta_dx_m);
Zsc_LE = Zc + eZ;

% . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
% .  SECTION (#8): Pack Calculated Data into the "dataOut1" Array size: (51)
% . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
   disp('     (8) Pack the Calculated Data into Array: dataOut1')
   dataOut1     = zeros(51);
    dataOut1(01) = Yc;               % Modulus Weighted Centroid y-direction (inch)
    dataOut1(02) = Zc;               % Modulus Weighted Centroid z-direction (inch)
    dataOut1(03) = rhoA;             % Cross-Section Weight (lb/inch)
    dataOut1(04) = EA;               % Axial   Stiffness (lb)
    dataOut1(05) = EIyy;             % Bending Stiffness (lb-in^2)   
    dataOut1(06) = EIzz;             % Bending Stiffness (lb-in^2)   
    dataOut1(07) = EIyz;             % Bending Stiffness (lb-in^2)   
    dataOut1(08) = GJ;               % Torsion Stiffness (lb-in^2)
    dataOut1(09) = Ysc_LE;           % Shear Center y-direction (inch)
    dataOut1(10) = Zsc_LE;           % Shear Center z-direction (inch)
    dataOut1(11) = W_wing;           % Total Half-Span Wing Weight (lb)
    dataOut1(12) = Vxo;              % Root Internal Force - X Direction (lb)
    dataOut1(13) = Vyo;              % Root Internal Force - Y Direction (lb)
    dataOut1(14) = Vzo;              % Root Internal Force - Z Direction (lb)
    dataOut1(15) = Mxo;              % Root Internal Moment - about X Direction (lb-in)
    dataOut1(16) = Myo;              % Root Internal Moment - about Y Direction (lb-in)
    dataOut1(17) = Mzo;              % Root Internal Moment - about Z Direction (lb-in)
    dataOut1(18) = Sxxo(1);          % Stringer (#1) Calculated Axial Stress (lb/in^2)
    dataOut1(19) = Sat(1);           % Stringer (#1) Allowable Stress - Tension (lb/in^2)
    dataOut1(20) = Sac(1);           % Stringer (#1) Allowable Stress - Compression (lb/in^2)
    dataOut1(21) = MSs(1);           % Stringer (#1) Margin of Safety
    dataOut1(22) = Sxxo(2);          % Stringer (#2) Calculated Axial Stress (lb/in^2)
    dataOut1(23) = Sat(2);           % Stringer (#2) Allowable Stress - Tension (lb/in^2)
    dataOut1(24) = Sac(2);           % Stringer (#2) Allowable Stress - Compression (lb/in^2)
    dataOut1(25) = MSs(2);           % Stringer (#2) Margin of Safety
    dataOut1(26) = Sxxo(3);          % Stringer (#3) Calculated Axial Stress (lb/in^2)
    dataOut1(27) = Sat(3);           % Stringer (#3) Allowable Stress - Tension (lb/in^2)
    dataOut1(28) = Sac(3);           % Stringer (#3) Allowable Stress - Compression (lb/in^2)
    dataOut1(29) = MSs(3);           % Stringer (#3) Margin of Safety
    dataOut1(30) = Sxxo(4);          % Stringer (#4) Calculated Axial Stress (lb/in^2)
    dataOut1(31) = Sat(4);           % Stringer (#4) Allowable Stress - Tension (lb/in^2)
    dataOut1(32) = Sac(4);           % Stringer (#4) Allowable Stress - Compression (lb/in^2)
    dataOut1(33) = MSs(4);           % Stringer (#4) Margin of Safety
    dataOut1(34) = Tau_12(1);        % Skin Panel (1.2) Calculated Shear Stress (lb/in^2)
    dataOut1(35) = Tau_allow_sk12;   % Skin Panel (1.2) Allowable Shear Stress  (lb/in^2)
    dataOut1(36) = MS_sk12;          % Skin Panel (1.2) Margin of Safety
    dataOut1(37) = Tau_23(1);        % Skin Panel (2.3) Calculated Shear Stress (lb/in^2)
    dataOut1(38) = Tau_allow_sk23;   % Skin Panel (2.3) Allowable Shear Stress  (lb/in^2)
    dataOut1(39) = MS_sk23;          % Skin Panel (2.3) Margin of Safety
    dataOut1(40) = Tau_34(1);        % Skin Panel (3.4) Calculated Shear Stress (lb/in^2)
    dataOut1(41) = Tau_allow_sk34;   % Skin Panel (3.4) Allowable Shear Stress  (lb/in^2)
    dataOut1(42) = MS_sk34;          % Skin Panel (3.4) Margin of Safety
    dataOut1(43) = Tau_41(1);        % Skin Panel (4.1) Calculated Shear Stress (lb/in^2)
    dataOut1(44) = Tau_allow_sk41;   % Skin Panel (4.1) Allowable Shear Stress  (lb/in^2)
    dataOut1(45) = MS_sk41;          % Skin Panel (4.1) Margin of Safety
    dataOut1(46) = Disp_X(nplot);    % Tip Diplacement - X Direction (inch)
    dataOut1(47) = Disp_Y(nplot);    % Tip Diplacement - Y Direction (inch)
    dataOut1(48) = Disp_Z(nplot);    % Tip Diplacement - Z Direction (inch)
    dataOut1(49) = Twist(nplot);     % Tip Twist (degree)
    dataOut1(50) = DvDx(nplot);      % Tip Bending Slope (dv/dx) (inch/inch)
    dataOut1(51) = DwDx(nplot);      % Tip Bending Slope (dw/dx) (inch/inch)

% . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
% .  SECTION (#9): Pack the plot data arrays into "dataOut2" 
% .                 matrix size: (nplot,24)  
% . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
   disp('     (9) Pack the Calculated Plot Data into Array: dataOut2')
   dataOut2     = zeros(nplot,27);

   for i = 1:nplot
    dataOut2(i, 1) = x(i);           % x-location (inch)
    dataOut2(i, 2) = py(i);          % drag force (lb/in)
    dataOut2(i, 3) = pz(i);          % lift force (lb/in)
    dataOut2(i, 4) = mx(i);          % distributed torque (lb-in/in)
    dataOut2(i, 5) = Vx(i);          % Internal shear force - Vx (lb)
    dataOut2(i, 6) = Vy(i);          % Internal shear force - Vy (lb)
    dataOut2(i, 7) = Vz(i);          % Internal shear force - Vz (lb)
    dataOut2(i, 8) = Mx(i);          % Internal axial force - Mx (lb-in)
    dataOut2(i, 9) = My(i);          % Internal shear force - My (lb-in)
    dataOut2(i,10) = Mz(i);          % Internal shear force - Mz (lb-in)
    dataOut2(i,11) = Sxx1(i);        % Stringer (#1) Axial Stress (lb/in^2) 
    dataOut2(i,12) = Sxx2(i);        % Stringer (#2) Axial Stress (lb/in^2) 
    dataOut2(i,13) = Sxx3(i);        % Stringer (#3) Axial Stress (lb/in^2) 
    dataOut2(i,14) = Sxx4(i);        % Stringer (#4) Axial Stress (lb/in^2) 
    dataOut2(i,15) = Tau_12(i);      % Skin Panel (1.2) Shear Stress (lb/in^2) 
    dataOut2(i,16) = Tau_23(i);      % Skin Panel (2.3) Shear Stress (lb/in^2) 
    dataOut2(i,17) = Tau_34(i);      % Skin Panel (3.4) Shear Stress (lb/in^2) 
    dataOut2(i,18) = Tau_41(i);      % Skin Panel (4.1) Shear Stress (lb/in^2)
    dataOut2(i,19) = Disp_X(i);      % Displacement - X Direction (inch)
    dataOut2(i,20) = Disp_Y(i);      % Displacement - Y Direction (inch)
    dataOut2(i,21) = Disp_Z(i);      % Displacement - Z Direction (inch)
    dataOut2(i,22) = Twist(i);       % Wing Twist (degree)
    dataOut2(i,23) = DvDx(i);        % Bending Slope (dv/dx) (inch/inch)
    dataOut2(i,24) = DwDx(i);        % Bending Slope (dw/dx) (inch/inch)
    dataOut2(i,25) = Twist1(i);      % Wing Twist from Vy (degree)
    dataOut2(i,26) = Twist2(i);      % Wing Twist from Vz (degree)
    dataOut2(i,27) = Twist3(i);      % Wing Twist from Mx (degree)

   end
   
end

%  End of Function: Wing_Analysis_Function
%  ------------------------------------------------------------------------