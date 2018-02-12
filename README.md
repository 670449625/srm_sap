This is a demo of the [SimpleRegModel](https://github.com/Juniper/simple_reg_model) package used in a [uvm testbench](http://accellera.org/downloads/standards/uvm).  

The *SRM* package provides several advantages over the *uvm_reg* package that is shipped with uvm. The demo focusses on showing how sequences can be reused across multiple testbench hierarchy and different access mechanism.

Details about the designs and testbenches can be found [here](http://github.com/sanjeevs/srm_sap/wiki)

To run the demo, download the tar file from the [release area](https://github.com/sanjeevs/srm_sap/releases) and follow the instructions below.

## Prerequisites
Running the demo requires that you have already installed.  
1. Verilog Simulator like vcs or ncsim.  

2. [UVM](http://accellera.org/downloads/standards/uvm)  
Ensure that the env variable *UVM_HOME* is setup correctly to the installation directory.  

3. [Simple Reg Model](https://github.com/Juniper/simple_reg_model)   
Ensure that the env variable *SRM_HOME* is setup correctly to the installation directory.  

## Installation
Download the tar file from  [release area](https://github.com/sanjeevs/srm_sap/releases).  
Say the tar file is srm_sap-0.1-alpha.tar.gz  
Untar and setup the env variable *SAP_HOME*

```
  tar xzvf srm_sap-0.1.tar.gz
  cd srm_sap-0.1
  setenv SAP_HOME `pwd`   // For CSH
  export SAP_HOME=`pwd`   // For Bash
```

## Running blockA testbench
To run the blockA testbench, run the target 'run_vcs' in the run directory,
```
   cd $SAP_HOME/blockA/run
   make run_vcs
```

## Running SAP1 testbench.
To run the SAP1 testbench, run the target 'run_vcs' in the run directory,
```
   cd $SAP_HOME/sap1/run
   make run_vcs
```

## Running SAP2 testbench.
To run the SAP2 testbench, run the target 'run_vcs' in the run directory,
```
   cd $SAP_HOME/sap2/run
   make run_vcs
```


