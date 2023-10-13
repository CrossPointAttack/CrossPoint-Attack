# CrossPoint Attacks

Welcome to **CrossPoint Attacks**, a project that explores novel side channels for bypassing cutting-edge PTO defenses like Nethide (USENIX Security 2018) and EqualNet (NDSS 2022). Our attacks leverage statistical disparities and correlated congestion to reveal hidden links on the Internet.

CrossPoint attacks leverage novel side channels named:

1. **Statistical disparities**: This side channel leverages static inherent features of the Internet, such as propagation delay and IP addresses.
2. **Correlated congestion**: This side channel leverages dynamic features of the Internet, Congestion! to reveal hidden links. 



## Getting Started

Our code is written in Python and Jupyter and includes detailed explanations. Each `.ipynb` contains at least two blocks: one with the Python code and another **with a running example**.

### Prerequisites

You will need Python3 and Jupyter installed on your computer to run our code.

Please use pip3 to install the requirements:

```
pip3 install -r ./requirements.txt
```

### Installation

Clone this repository to your local machine:

```
git clone https://github.com/CrossPointAttack/CrossPoint-Attacks.git
```

## Usage

The project is organized into two main directories:

1. `CrossPoint_bot`: Contains botnet codes with Jupyter and shell scripts.
2. `CrossPoint_controller`: Contains examples and the whole CrossPoint codes.

### Instructions for Researchers

If you want to rebuild our experiments in your own environment, follow these steps:

1. Run the `bot_config` in each bot to generate attack_flow JSON files.
2. Send these JSON files to the controller.
3. In the controller, run the SD attack to output the suspicious attack flow set.
4. In the controller, find the control group and the attack flow set.
5. Run `bash_ping` in control group bots and suspicious attack flow bots.
6. Run `CrossPoint-CC` to find profitable links.

### Fast Example

We also provide a fast example with configured bots and congestion files for you to try:

1. Run `CrossPoint-CC-example.ipynb` to understand how our code analyzes congestions.
2. Run `CrossPoint_controller.ipynb` to understand how to utilize statistical disparities.

## License

This project is licensed under the MIT License 2.0.

