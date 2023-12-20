# cromwell-bayesian-model-covid-demo

This project demostrates running the Bayesian model using Cromwell, Python, and Docker.

## Pre-requisites:
 
 1. JAVA must be installed and be a minimum version of 11.
 2. Docker must also be installed and running.

Please note: The cromwell workflow script will check for these requirements and stop execution if they are not met.


## To execute:
 
 1. Edit idmWorkflow.wdl using a text editor to specify the run paramters (lines 39-41), then save
~~~
state = "PA",
start_date = "2020-03-05",
end_date = "2020-03-07"
~~~
 2. From the command line execute the Cromwell workflow
~~~
./cromwell_workflow.sh
~~~


## Results:

Results will be inside the results folder of this project:
~~~
~/../cromwell-bayesian-covid-model-demo/results
~~~
