#!/usr/bin/env bash

source venv/bin/activate

pip install -r requirements.txt

reports_dir="./reports"
if [[ ! -d "${reports_dir}" ]]
then
    mkdir ${reports_dir}
fi

datetime=`date +%Y%m%d_%H%M%S`
report_path="${reports_dir}/report_${datetime}"
if [[ ! -d "${report_path}" ]]
then
    mkdir ${report_path}
fi

adb kill-server
adb start-server

echo "Starting Appium on Linux..."
appium &

robot -V config/testdata_stage.yaml --outputdir ${report_path} function_test/feature_x/Login.robot