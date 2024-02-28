version 1.0

task run_Model {
    input {
        File setup_os_script
        File install_python_script
        File install_model_script
        File run_model_script
        File move_results_script
        String git_repository_url
        String start
        String stop
        String num_samples
        String pop_size
    }
    command {
        ${setup_os_script}
        ${install_python_script}
        ${install_model_script} "${git_repository_url}"
        ${run_model_script} "${git_repository_url}" "${start}" "${stop}" "${num_samples}" "${pop_size}"
        ${move_results_script}
    }
    runtime {
        docker: "python:3.6.15-bullseye"
    }
    output {
        File response = stdout()
    }
}

workflow idmWorkflow {
    call run_Model {
        input:
            setup_os_script = "./scripts/sh/setup_os.sh",
            install_python_script = "./scripts/sh/install_python_libraries.sh",
            install_model_script = "./scripts/sh/install_model.sh",
            run_model_script = "./scripts/sh/run_model.sh",
            move_results_script = "./scripts/sh/move_results.sh",
            git_repository_url = "https://github.com/midas-network/bayesian-covid-model-demo.git",
            start = 0,
            stop = 50,
            num_samples = 200,
            pop_size = 1.78e6
    }
}

