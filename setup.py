import configparser
import sys

from subprocess import call

def checkBoltedConfigurationFile(config):
	if config['general']['hil'] is "0.0.0.0" or \
	   config['general']['bmi'] is "0.0.0.0" or \
	   config['general']['keylime-cv'] is "0.0.0.0" or \
	   config['genearl']['keylime-client'] is "0.0.0.0":
	   	print("Please change the configuration file to proceed")
	else:
		print("Now start installing bolted system.\n")
def main():
	if sys.argv[0] is "install":
		print("Install bolted system.\n")
		boltedConfig = configparser.ConfigParser()
		boltedConfig = config.read('bolted.cfg')
		checkBoltedConfigurationFile(boltedConfig)


if __name__ == "__main__": 
	main()
