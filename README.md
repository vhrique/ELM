# Extreme Learning Machine Toolbox

This is a toolbox to enable the creation of extreme learning machines in MATLAB.
It is possible to create a desired model using just a few lines of code.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

You just need MATLAB and the Statistics and Machine Learning Toolbox.
This toolbox has been developed on MATLAB R2019a, but should also be compatible with earlier versions.

### Installing

Toolbox installation in MATLAB is rather simple.
You just need to add a copy of the source codes (src directory) in the MATLAB paths.

This can be made programatically with the following code:

```
addpath('<directory>/ELM')
```

Two simple demos can be found in the examples directory.
To run them, you just need to execute the scripts Demo_classification.m and Demo_regression.m.

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* MATLAB R2019a

## Contributing

Please contact the author (victor.henrique@pucpr.edu.br).

## Versioning

We use a three-codes versioning system: vA.B.C.

* A stands for the major revision, and will be used when a major new feature is added or compatibility to previous major revision is lost.
* B stands for minor revision, where new features will be added.
* C is used for minor adjustments and bug fixing.

## Authors

* **Victor Henrique Alves Ribeiro, MSc** - *Coding* - Industrial and Systems Engineering Graduate Program, Pontifícia Universidade Católica do Paraná - Brazil
* **Gilberto Reynoso-Meza, PhD** - *Supervision* - Industrial and Systems Engineering Graduate Program, Pontifícia Universidade Católica do Paraná - Brazil
* **Hugo Siqueira Valadares, PhD** - *Supervision* - Computer Science Graduate Program, Electrical Engineering Graduate Program, Federal University of Technology - Paraná - Brazil

## License

This project is licensed under the 3-clause BSD License - see the [LICENSE.txt](LICENSE.txt) file for details.

## Citation

If this toolbox is of help, please cite our work

```
@article{ribeiro2020multi,
  title={Multi-objective ensembles of echo state networks and extreme learning machines for streamflow series forecasting},
  author={Ribeiro, Victor Henrique Alves and Reynoso-Meza, Gilberto and Siqueira, Hugo Valadares},
  journal={Engineering Applications of Artificial Intelligence},
  volume={95},
  pages={103910},
  year={2020},
  publisher={Elsevier}
}
```