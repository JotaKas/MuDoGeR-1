#!/bin/bash

# loading conda environment
echo '------- START MODULE 2-5 BIN TAXONOMY'
conda activate mudoger_env
config_path="$(which config.sh)"
database="${config_path/config/database}"
source $config_path
source $database

# load gtdbtk env
conda activate "$MUDOGER_DEPENDENCIES_ENVS_PATH"/gtdbtk_env

#Run only once during database installation configuration
#echo ${CHECKM_DB} | checkm data setRoot ${CHECKM_DB}

GTDBTK_DATA_PATH="$DATABASES_LOCATION"gtdbtk/release*

master_folder=$1
cores=$2


gtdbtk classify_wf --extension fa --cpus "$cores" --genome_dir "$master_folder"/binning/unique_bins --out_dir "$master_folder"/metrics/GTDBtk_taxonomy

conda deactivate
