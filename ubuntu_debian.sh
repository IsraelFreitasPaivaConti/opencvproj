UbuntuDebian() {
	apt update
	apt upgrade

	if [ -d "venv" ]; then
	    echo 
    else
		python -m venv venv
		pip install -r requirements.txt
	fi
	source "$(dirname "$0")"/venv/bin/activate
}