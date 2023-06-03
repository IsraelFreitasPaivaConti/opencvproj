UbuntuDebian() {
	apt update
	apt upgrade

	if [ -d "venv" ]; then
	else
		python -m venv venv
		pip install -r requirements.txt
	fi
	source "$(dirname "$0")"/bin/activate
}