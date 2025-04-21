Automated Rail Gate Control
This repository contains the code for an Automated Rail Gate Control System using an 8051 microcontroller. The system leverages IR sensors for train detection and controls both a gate and traffic lights to ensure safe passage.

🚀 Features
1.IR Sensor Detection-Two IR sensors (IR1 and IR2) detect the train's approach and departure, controlling the gate accordingly.
2.Gate Control-A motor moves the gate forward to close it and backward to open it based on IR sensor inputs.
3.Traffic Light Control-The system controls a red and green traffic light to manage road safety. The red light is on when the gate is closed, and the green light is on when the gate is open.
4.Alarm Activation-When the gate is closing, an alarm can be activated along with the red light for additional safety.
5.Smooth Operation with Delay-Integrated delay functions ensure a smooth transition between actions like opening/closing the gate and switching the lights.

🔄 Working Logic
1.System Initialization-The microcontroller initializes the IR sensor ports, traffic light system, and gate motor.
2.Sensor Monitoring-#IR1 detects the approaching train. When blocked, the gate starts to close, and the red light is turned on.
                    #IR2 detects the train passing. Once blocked, the gate opens, and the green light turns on.
3.Gate Motor Control-The motor is controlled to reverse direction based on sensor signals, closing or opening the gate.
4.Traffic Light Synchronization-Traffic lights are synchronized with the gate's status — red when closed, green when open.
5.Delay Mechanism-Delay functions are used to pause the operation for smooth transitions between opening, closing, and switching lights.

🛠️ Components Used
1.8051 Microcontroller
2.IR Sensors (IR1, IR2)
3.Traffic Lights (Red & Green)
4.DC Motor for Gate Movement

📜 How to Use
1.Upload the provided code to the 8051 microcontroller
2.Connect the IR sensors to Port 3 of the microcontroller.
3.Attach the DC motor to Port 2 for gate control.
4.Wire the traffic lights to Port 2 for controlling the signals.
5.Power the system to start the automatic gate control process.

🔍 Code Overview
The code is divided into the following sections:

1.Initialization: Configures the system's input and output ports.
2.Sensor Monitoring: Continuously checks the IR sensors for train detection.
3.Motor Control: Manages motor direction to open and close the gate.
4.Traffic Light Control: Controls the traffic light system in sync with the gate.
5.Delay Functions: Adds delays for proper timing of operations.

💡 Future Improvements
1.Enhanced Sensor System-Use ultrasonic sensors or cameras for more accurate train detection.
2.Automated Alarm System-Integrate an automatic alarm that alerts nearby vehicles or pedestrians when the gate is closing.
3.Manual Override-Add the ability to manually override the system for maintenance or emergencies.

