Termux() {
	apt update
	pkg update
	apt upgrade
	pkg upgrade

	pkg install clang python fftw libjpeg-turbo libpng pkg-config

	python -m venv venv
	pip install -r requirements.txt

	mkdir lib64
	cd lib64

	git clone https://github.com/opencv/opencv.git
	cd opencv

	mkdir build
	cd build

	cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr/local -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules ..
	make -j8
	make install
}