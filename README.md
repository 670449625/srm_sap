This is a demo of the [SimpleRegModel](https://github.com/Juniper/simple_reg_model) package used in a [uvm testbench](http://accellera.org/downloads/standards/uvm).  

## Purpose
The *SRM* package provides several advantages over the *uvm_reg* package that is shipped with uvm. **The demo focusses on showing how a block level sequence can be reused unchanged across multiple testbench hierarchy and different access mechanism.**

## Details
Details about the designs and testbenches can be found [here](http://github.com/sanjeevs/srm_sap/wiki)

## Prerequisites
Running the demo requires that you have already installed the following software.  
1. Recent version of Verilog Simulator like vcs. I have tested it with vcs/2014.03-SP-3

2. [UVM](http://accellera.org/downloads/standards/uvm)  
Ensure that the env variable *UVM_HOME* is pointing to the installation directory like below.
```
>ls $UVM_HOME
bin  docs  examples  LICENSE.txt  README.txt  release-notes.txt  src  UVM_Reference.html

```

3. [Simple Reg Model](https://github.com/Juniper/simple_reg_model/releases)
Download the release file srm-0.2.tar.gz and untar it in a install directory.
Ensure that the env variable *SRM_HOME* is pointing to the installation directory. 
```
>ls $SRM_HOME
examples  License.txt  README.txt  src  SRM_Reference.html

```

## Installation
Download the tar file from  [release area](https://github.com/sanjeevs/srm_sap/releases).  
Say the tar file is srm_sap-0.1-alpha.tar.gz  
Untar and setup the env variable *SAP_HOME*

```
  tar xvzf srm_sap-0.1.tar.gz
  cd srm_sap-0.1-alpha
  setenv SAP_HOME `pwd`   // For CSH
  export SAP_HOME=`pwd`   // For Bash
```
At this point the following should be true.
```
>ls $SAP_HOME
agents  blockA  docs  my_setup.csh  notes.md  README.md  sap1  sap2

```

## Running blockA testbench
To run the blockA testbench, run the target 'run_vcs' in the run directory,
```
   cd $SAP_HOME/blockA/run
   make run_vcs
```
The test spawns a basic [sequence](https://github.com/sanjeevs/srm_sap/wiki/Sequence) that writes and reads the register and the table.

## Running SAP1 testbench.
To run the SAP1 testbench, run the target 'run_vcs' in the run directory,
```
   cd $SAP_HOME/sap1/run
   make run_vcs
```
Note that the [test](https://github.com/sanjeevs/srm_sap/wiki/SAP1_test) in the SAP1 testbench spawns the same sequence from the block level test. No changes are done to the sequence, yet it runs on different adapters. It is spawned on the host agent just like real world. If faster simulation time is desired, we can spawn it on the internal block PIO bus. If backdoor path is known then we can even directly program the registers in zero time.

## Running SAP2 testbench.
To run the SAP2 testbench, run the target 'run_vcs' in the run directory,
```
   cd $SAP_HOME/sap2/run
   make run_vcs
```
As before, the [test](https://github.com/sanjeevs/srm_sap/wiki/SAP2_test) in the SAP2 testbench spawns the same sequence from the block level test. No changes are done to the sequence, yet it runs on different adapters like in SAP1, but targetted towards different instances of SAP1. 


