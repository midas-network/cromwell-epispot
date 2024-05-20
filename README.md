# cromwell-epispot

This project demostrates running Epispot using Cromwell, Python, and Docker.

## Cromwell:
[Cromwell](https://github.com/broadinstitute/cromwell) is an open-source Workflow Management System for bioinformatics.

## Model:
[Epispot](https://github.com/epispot/epispot): A Python package for the mathematical modeling of infectious diseases via compartmental models.

## Execution:
### Pre-requisites:
 
 1. JAVA must be installed and be a minimum version of 11.
 2. Docker must also be installed and running.

Please note: The cromwell workflow script will check for these requirements and stop execution if they are not met.


### Input parameters:
 
 Edit **modelWorkflow_inputs.json** file to specify the run parameters for the model.

 First specify the name of the run for the model (do not include spaces).\
 For **Epispot**, provide each start, stop, num_samples and pop_size.

 All other input parameters specify the model particulars, such as git repository, output folder of the model, types of output produced, installation and  run scripts.

~~~
{
  "modelWorkflow.name_of_this_model_run": "epispot",
  "modelWorkflow.start_array": [0],
  "modelWorkflow.stop_array": [50,100],
  "modelWorkflow.num_samples_array": [200,400],
  "modelWorkflow.pop_size_array": ["1.78e6"],
  "modelWorkflow.model_executable": "./scripts/python/epispot_run.py",
  "modelWorkflow.model_git_repository": "https://github.com/epispot/epispot",
  "modelWorkflow.model_output_folder": "results",
  "modelWorkflow.model_output_file_types": "[png,txt]",
  "modelWorkflow.install_model_script": "./scripts/sh/epispot/install_model.sh",
  "modelWorkflow.run_model_script": "./scripts/sh/epispot/run_model.sh",
  "modelWorkflow.model_runtime_docker": "python:3.9.18-slim-bullseye",

  "modelWorkflow.setup_os_script": "./scripts/sh/setup_os.sh",
  "modelWorkflow.clone_repository_script": "./scripts/sh/clone_git_repository.sh",
  "modelWorkflow.copy_cromwell_logs_script": "./scripts/sh/copy_cromwell_logs.sh",
  "modelWorkflow.copy_model_output_script": "scripts/python/copy_model_output.py"
}
~~~

## To execute:
 
 1. From the command line execute the Cromwell workflow
~~~
./cromwell_workflow.sh
~~~


## Results:

Results will be inside the model_output folder of this project:
~~~
~/../cromwell-epispot/model_output
~~~
