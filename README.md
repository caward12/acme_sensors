### ACME Sensors

You work at Acme Sensor Co, a company that makes thermometers and hygrometers. You are in charge of quality control, and you get fed results of accuracy tests.
Based on the result for a given sensor, you will sell the sensor as either "pro-grade", "prosumer-grade", or "discount".

Your task is to write a command-line program which can be provided a directory of these CSVs, and output a summary of results.

#### To run the program in the command-line:

cd into the acme_sensors folder

run the results.rb file with -d and then the path to the directory containing your csv files - path should be based from the root directory.

`ruby lib/results.rb -d path/to/directory/of/csvs`

#### To run test suite:
`rake test`