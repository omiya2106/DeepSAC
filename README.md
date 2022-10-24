# DeepSAC
![138365442-e668ef58-d1e0-4cdc-9636-65efd28d6eb1](https://user-images.githubusercontent.com/48494146/197577930-bb2e2b5b-1ad0-40a2-aa6f-321b10630320.png)
##Motivation
A typical digital hardware accelerator uses multiplyaccumulate function (MAC) as its neuron units. The synapse of the fully connected neural
network multiplies its weights to the corresponding output data from the previous layer and sends it to the neuron of the next layer to get summed and either classified (at the output layer) or passed to the next layer (at the hidden layer). As a result, many multipliers need to be designed when representing the synapse of the model. When designing energy efficient hardware model, the power consumption of the system increases at a high rate due to the usage of many multipliers. To avoid this, a shifter based low-power design technique (Shift-Accumulate, SAC) has been introduced in this work where shifters have been used instead of multipliers. During the training phase of the model in software, the weights and biases were constrained in order of magnitude of 2 while maintaining the consistency of their original values.
##Hardware Software Co-simulation Process
![image](https://user-images.githubusercontent.com/48494146/197578627-23737a04-d5dd-488a-ab54-075064ea3f5b.png)

Further and detailed information can be found here:
Hassan, Omiya, et al. "Energy Efficient Deep Learning Inference Embedded on FPGA for Sleep Apnea Detection." Journal of Signal Processing Systems (2022): 1-11.
