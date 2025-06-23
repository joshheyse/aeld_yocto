SUMMARY = "Beagle Bone CAN"
DESCRIPTION = "Simple Application which listens to CAN Messagers and publishes them over MQTT"
LICENSE = "MIT"

SRC_URI = "git://git@github.com/joshheyse/aeld_app;protocol=https;branch=main "
SRCREV = "f639f691ec7a77f4fff22dfbad7e39959da7b08b"
PV .= "+git"

DEPENDS = "paho-mqtt-cpp can-utils"

S = "${WORKDIR}/git"

inherit cmake
