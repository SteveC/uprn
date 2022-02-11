#!/bin/bash

# download os open uprn csv, then:

tail -n +2 osopenuprn_202112.csv > data_without_header.csv

split -l 100000 data_without_header.csv segment_

rm data_without_header.csv

gzip -9 segment*