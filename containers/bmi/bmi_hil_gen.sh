#!/bin/bash

sed -i -e "0,/<base url for hil>/{s/<base url for hil>/$1/g}" bmi_config.cfg
# sed -i -e '0,/<>/{s/<>//g}' bmi_config.cfg
