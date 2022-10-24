# DeepSAC
![138365442-e668ef58-d1e0-4cdc-9636-65efd28d6eb1](https://user-images.githubusercontent.com/48494146/197577930-bb2e2b5b-1ad0-40a2-aa6f-321b10630320.png)

## Proposed Sleep Apnea Detection Model:
![image](https://user-images.githubusercontent.com/48494146/197580046-4a766159-a126-4e2f-b612-1707e5f41707.png)
Block diagram of the proposed detection model

## Motivation
A typical digital hardware accelerator uses multiplyaccumulate function (MAC) as its neuron units. The synapse of the fully connected neural
network multiplies its weights to the corresponding output data from the previous layer and sends it to the neuron of the next layer to get summed and either classified (at the output layer) or passed to the next layer (at the hidden layer). As a result, many multipliers need to be designed when representing the synapse of the model. When designing energy efficient hardware model, the power consumption of the system increases at a high rate due to the usage of many multipliers. To avoid this, a shifter based low-power design technique (Shift-Accumulate, SAC) has been introduced in this work where shifters have been used instead of multipliers. During the training phase of the model in software, the weights and biases were constrained in order of magnitude of 2 while maintaining the consistency of their original values.

## Hardware Software Co-simulation Process
![image](https://user-images.githubusercontent.com/48494146/197578627-23737a04-d5dd-488a-ab54-075064ea3f5b.png)

## Results
![image](https://user-images.githubusercontent.com/48494146/197579647-02053d9a-1e69-4b73-8e1a-0ee8b9105f0a.png)
Proposed Feedforward Neural Network

![image](https://user-images.githubusercontent.com/48494146/197579466-f7f2716e-bcf4-460c-a4fe-c77d9ff30506.png)
Power consumption rate dreceased by 13x times when replacing multipliers with shifters.

![image](https://user-images.githubusercontent.com/48494146/197579888-9b6269e9-1867-42b8-8710-a28365b218f3.png)
Hardware Model of the Feedforward Network

![image](https://user-images.githubusercontent.com/48494146/197579750-314e038e-5faa-4b2e-92c4-bcdf6d4e8983.png)
Simulation results on reprogrammable hardware (Nexys Artix-7 FPGA)

Further and detailed information can be found here:
Hassan, Omiya, et al. "Energy Efficient Deep Learning Inference Embedded on FPGA for Sleep Apnea Detection." Journal of Signal Processing Systems (2022): 1-11.
