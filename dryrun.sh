#!/usr/bin/env bash

source venv/bin/activate

robot --outputdir ${report_path} --dryrun function_test/Account