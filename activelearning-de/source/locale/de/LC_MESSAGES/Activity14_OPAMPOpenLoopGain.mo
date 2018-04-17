��    <      �              �  9   �  �        �  0   �  0     w   9  4   �  �   �  
   �  w   �  �     3   �          7	     V	  �   v	  g   P
  '   �
  m   �
  8   N  6   �  5   �  T   �  5   I  T     .   �  �     �   �  B   B  �   �  _   	  #  i  �   �  �     	   �  �   �     8     >     S     c  	   s  �   }  k   8  	   �  "   �      �  "   �  5        K     k  �  �  #     e   B     �  �  �  5   j  y  �      �     N  �  9   ,  �   f        0   &   0   W   w   �   4    !  �   5!  
   �!  w   �!  �   ]"  3   ;#    o#     �$     �$  �   �$  g   �%  '   &  m   /&  8   �&  6   �&  5   '  T   C'  5   �'  T   �'  .   #(  �   R(  �   �(  B   �)  �   �)  _   X*  #  �*  �   �,  �   m-  	   �-  �   �-     �.     �.     �.     �.  	   �.  �   �.  k   �/  	   �/  "   �/       0  "   A0  5   d0     �0     �0  �  �0  #   m3  e   �3     �3  �  4  5   �5  y  �5    i7  �   l8   **Connect OUT1 to IN1 and set probe attenuations to x1.** **Construct the circuit shown in figure 2.** Before inserting the R2 and R3 resistors in the circuit, measure and record the values of the two resistors using a DMM if available. **Example:** **Readout MEAN(IN2): In our case it is -34.2mV** **Readout MEAN(IN2): In our case it is -34.8mV** **Red Pitaya STEMlab 125-14**. An Red Pitaya STEMlab 125-10 is not suitable for this measurement due to ADC resolution! Adjust OUT1 amplitude until MEAN(IN1) shows near 1V. As you can see from the measurements there is certain offset on the AUX opamp output (pin 6). Ideally when R5 is set to POS1 (figure 2) :math:`V_{out}` should be 0. Background Be sure to read through the tutorial_ on Open Loop Gain and Open Loop Gain Nonlinearity before doing these experiments. Before connecting the circuit to the STEMlab -3.3V and +3.3V  pins double check your circuit. The  -3.3V and +3.3V  voltage supply pins do not have  short circuit handling and they can be damaged in case of short circuit. Build circuit on the breadboard and set R5 to POS2. C1 capacitor is used as a feedback impedance on the inverting amplifier configuration of the AUX opamp. This is done to attenuate all AC signals in the circuit and AUX opamp output. For this reason it is good to have large capacitance of C1 in order to eliminate any AC signals. Capacitor: 1x 10 :math:`\mu F` Capacitor: 2x 0.1 :math:`\mu F` Compare measurements with the datasheet value from Figure 2. Our measurements are very close to the specified value. For more accurate measurement a higher resolution equipment and less noisy environment is necessary. DUT output must go to -1V since our AUX opamp is in feedback loop trying to push his :math:`V_d` to 0V. Deselect SHOW button and select enable. Extension connector pins used for **-3.3V** and **+3.3V** voltage supply are show in the documentation here_. Figure 1: OP27 datasheet and Open Loop Gain value marked Figure 2: Voltage supply connections and  test circuit Figure 3: Test circuit. R5 on POS1 (look at Figure 2) Figure 4: Measurements of :math:`V_{out}` when  R5 is set to POS1 (look at Figure 2) Figure 5: Test circuit. R5 on POS2 (look at Figure 2) Figure 6: Measurements of :math:`V_{out}` when  R5 is set to POS2 (look at Figure 2) For open loop gain folowing equation 2 we get: If we take :math:`A_{OL} = 1.8E6` then for 1V on DUT(OP27) output we need to have input diferential voltage :math:`V_d` as folows: In other words, DUT input differential voltage :math:`V_d=V^{+}+{V^-}`, (where :math:`V^-=0` and  :math:`V_d = V^+`), necessary to set DUT output to -1V is :math:`\frac{V_{out}}{A_{OL}}`. In our case R3 = 97.3k :math:`\Omega` and R2 = 99.7 :math:`\Omega` In the OUT1 settings menu from the waveform menu select DC. Set Amplitude value to 1V to apply a 1V DC voltage to the circuit (R5). In the measurement menu select “MEAN”, select IN1 and press DONE, select IN2 and press DONE In theory, in order to measure :math:`A_{OL}`  we could only use a signal generator (for setting the :math:`V_{d}`) and voltmeter for measurements of DUT output. But in practice this is almost not duable dou to imperfections, noise levels, offset levels and etc. Because of that we are using method shown on figure 2 where we perform the measurements of output signal :math:`V_{out}` which is, through voltage divider (R3/R2) related to :math:`V_{d}` and  a few order of magnitudes larger than :math:`V_{d}` and thus measurable with our equipment. In this tutorials we use the terminology taken from the user manual when referring to the connections to the Red Pitaya STEMlab board hardware_. Instead of using switch S, R5 can be manually set on pin6 of DUT on the breadboard. Build circuit in the breadboard and set R5 to POS1. Materials Nonetheless, during both (POS1 and POS2) measurements the DC offset is the same and it will cancel out when calculating open loop gain. Notes OPAMP Open Loop Gain OPAMP:  1x OP27 OPAMP:  1x OP97 Objective On the left bottom of the screen be sure that IN1 V/div is set to 500mV/div and IN2 V/div to 10mV/div (You can set V/div by selecting the desired channel and using vertical +/- controls) Oscilloscope_ & Signal_ generator_ application is used for generating and observing signals on the circuit. Procedure Resistor:  1x 100 :math:`k \Omega` Resistor:  2x 100 :math:`\Omega` Resistor:  2x 200 :math:`k \Omega` Start the Oscilloscope & Signal Generator application Step 1: S is on POS1 (Figure 2) Step 2: S is on POS2 (Figure 2) The dc gain is measured by forcing the output of the DUT(OPAMP under test a OP27 in our case) to move by a known amount (1V in our case, look at Figure 2) by switching R5 between the DUT output (OP27 pin 6) and a 1V reference (STEMlab OUT1 output) with switch S. If R5 is at +1V (Switch S position POS2), then the DUT output (OP27 pin6) must move to –1V if the input of the auxiliary amplifier is to remain unchanged near zero. The voltage change at auxiliary amplifier output :math:`V_{out}` (OP97 pin 6), attenuated by **R3/R1** factor, is the input to the DUT(OP27 pin 3), which causes a 1V change of output.It is simple to calculate the gain from this: The definition of open-loop gain is The objective of this experiment is to measure  the open‐loop gain characteristics of a OP27 opamp. Thus an open-loop gain of Unlike the ideal op amp, a practical op amp has a finite gain. The open-loop DC gain (usually referred to as :math:`A_{VOL}` and sometimes as **forward gain**) is the gain of the amplifier without the feedback loop being closed, hence the name “open-loop.” For a precision op amp this gain can be very high, on the order of 160 dB (100 million) or more. The open loop gain of the OP27_ amplifier is arround 1.8 million. Using  horizontal +/- controls set t/div to 100ms/div Voltage feedback op amps operate as a **voltage in / voltage out** amplifier and the open-loop gain is a **dimensionless ratio**, so no units are necessary. However, data sheets sometimes express gain in :math:`V/mV` or :math:`V/ \mu V` instead of :math:`V/V`, for the convenience of using smaller numbers. Or, voltage gain can also be expressed in :math:`dB` terms, as gain in We chosed 10uF and used polarized(electrolytic) capacitor here. This is not  an “ok” solution since our capacitor can be subjected to reverse polarisation. But for good measurements and short period of measurements the electrolytic capacitor can be used. where :math:`(V^{+} - V^{-})` is the input voltage difference :math:`V_d` that is being amplified, :math:`V^{+}` a voltage on non-inverting input and :math:`V^{-}` voltage on inverting input. Project-Id-Version: Red Pitaya 1.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2018-03-09 17:51+0100
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language-Team: LANGUAGE <LL@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.5.1
 **Connect OUT1 to IN1 and set probe attenuations to x1.** **Construct the circuit shown in figure 2.** Before inserting the R2 and R3 resistors in the circuit, measure and record the values of the two resistors using a DMM if available. **Example:** **Readout MEAN(IN2): In our case it is -34.2mV** **Readout MEAN(IN2): In our case it is -34.8mV** **Red Pitaya STEMlab 125-14**. An Red Pitaya STEMlab 125-10 is not suitable for this measurement due to ADC resolution! Adjust OUT1 amplitude until MEAN(IN1) shows near 1V. As you can see from the measurements there is certain offset on the AUX opamp output (pin 6). Ideally when R5 is set to POS1 (figure 2) :math:`V_{out}` should be 0. Background Be sure to read through the tutorial_ on Open Loop Gain and Open Loop Gain Nonlinearity before doing these experiments. Before connecting the circuit to the STEMlab -3.3V and +3.3V  pins double check your circuit. The  -3.3V and +3.3V  voltage supply pins do not have  short circuit handling and they can be damaged in case of short circuit. Build circuit on the breadboard and set R5 to POS2. C1 capacitor is used as a feedback impedance on the inverting amplifier configuration of the AUX opamp. This is done to attenuate all AC signals in the circuit and AUX opamp output. For this reason it is good to have large capacitance of C1 in order to eliminate any AC signals. Capacitor: 1x 10 :math:`\mu F` Capacitor: 2x 0.1 :math:`\mu F` Compare measurements with the datasheet value from Figure 2. Our measurements are very close to the specified value. For more accurate measurement a higher resolution equipment and less noisy environment is necessary. DUT output must go to -1V since our AUX opamp is in feedback loop trying to push his :math:`V_d` to 0V. Deselect SHOW button and select enable. Extension connector pins used for **-3.3V** and **+3.3V** voltage supply are show in the documentation here_. Figure 1: OP27 datasheet and Open Loop Gain value marked Figure 2: Voltage supply connections and  test circuit Figure 3: Test circuit. R5 on POS1 (look at Figure 2) Figure 4: Measurements of :math:`V_{out}` when  R5 is set to POS1 (look at Figure 2) Figure 5: Test circuit. R5 on POS2 (look at Figure 2) Figure 6: Measurements of :math:`V_{out}` when  R5 is set to POS2 (look at Figure 2) For open loop gain folowing equation 2 we get: If we take :math:`A_{OL} = 1.8E6` then for 1V on DUT(OP27) output we need to have input diferential voltage :math:`V_d` as folows: In other words, DUT input differential voltage :math:`V_d=V^{+}+{V^-}`, (where :math:`V^-=0` and  :math:`V_d = V^+`), necessary to set DUT output to -1V is :math:`\frac{V_{out}}{A_{OL}}`. In our case R3 = 97.3k :math:`\Omega` and R2 = 99.7 :math:`\Omega` In the OUT1 settings menu from the waveform menu select DC. Set Amplitude value to 1V to apply a 1V DC voltage to the circuit (R5). In the measurement menu select “MEAN”, select IN1 and press DONE, select IN2 and press DONE In theory, in order to measure :math:`A_{OL}`  we could only use a signal generator (for setting the :math:`V_{d}`) and voltmeter for measurements of DUT output. But in practice this is almost not duable dou to imperfections, noise levels, offset levels and etc. Because of that we are using method shown on figure 2 where we perform the measurements of output signal :math:`V_{out}` which is, through voltage divider (R3/R2) related to :math:`V_{d}` and  a few order of magnitudes larger than :math:`V_{d}` and thus measurable with our equipment. In this tutorials we use the terminology taken from the user manual when referring to the connections to the Red Pitaya STEMlab board hardware_. Instead of using switch S, R5 can be manually set on pin6 of DUT on the breadboard. Build circuit in the breadboard and set R5 to POS1. Materials Nonetheless, during both (POS1 and POS2) measurements the DC offset is the same and it will cancel out when calculating open loop gain. Notes OPAMP Open Loop Gain OPAMP:  1x OP27 OPAMP:  1x OP97 Objective On the left bottom of the screen be sure that IN1 V/div is set to 500mV/div and IN2 V/div to 10mV/div (You can set V/div by selecting the desired channel and using vertical +/- controls) Oscilloscope_ & Signal_ generator_ application is used for generating and observing signals on the circuit. Procedure Resistor:  1x 100 :math:`k \Omega` Resistor:  2x 100 :math:`\Omega` Resistor:  2x 200 :math:`k \Omega` Start the Oscilloscope & Signal Generator application Step 1: S is on POS1 (Figure 2) Step 2: S is on POS2 (Figure 2) The dc gain is measured by forcing the output of the DUT(OPAMP under test a OP27 in our case) to move by a known amount (1V in our case, look at Figure 2) by switching R5 between the DUT output (OP27 pin 6) and a 1V reference (STEMlab OUT1 output) with switch S. If R5 is at +1V (Switch S position POS2), then the DUT output (OP27 pin6) must move to –1V if the input of the auxiliary amplifier is to remain unchanged near zero. The voltage change at auxiliary amplifier output :math:`V_{out}` (OP97 pin 6), attenuated by **R3/R1** factor, is the input to the DUT(OP27 pin 3), which causes a 1V change of output.It is simple to calculate the gain from this: The definition of open-loop gain is The objective of this experiment is to measure  the open‐loop gain characteristics of a OP27 opamp. Thus an open-loop gain of Unlike the ideal op amp, a practical op amp has a finite gain. The open-loop DC gain (usually referred to as :math:`A_{VOL}` and sometimes as **forward gain**) is the gain of the amplifier without the feedback loop being closed, hence the name “open-loop.” For a precision op amp this gain can be very high, on the order of 160 dB (100 million) or more. The open loop gain of the OP27_ amplifier is arround 1.8 million. Using  horizontal +/- controls set t/div to 100ms/div Voltage feedback op amps operate as a **voltage in / voltage out** amplifier and the open-loop gain is a **dimensionless ratio**, so no units are necessary. However, data sheets sometimes express gain in :math:`V/mV` or :math:`V/ \mu V` instead of :math:`V/V`, for the convenience of using smaller numbers. Or, voltage gain can also be expressed in :math:`dB` terms, as gain in We chosed 10uF and used polarized(electrolytic) capacitor here. This is not  an “ok” solution since our capacitor can be subjected to reverse polarisation. But for good measurements and short period of measurements the electrolytic capacitor can be used. where :math:`(V^{+} - V^{-})` is the input voltage difference :math:`V_d` that is being amplified, :math:`V^{+}` a voltage on non-inverting input and :math:`V^{-}` voltage on inverting input. 