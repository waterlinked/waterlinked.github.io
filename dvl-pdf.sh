#!/bin/bash

files="site/dvl/dvl-a50/dvl-a50.pdf
site/dvl/dvl-a125/dvl-a125.pdf
site/dvl/interfaces/interfaces.pdf
site/dvl/networking/networking.pdf
site/dvl/axes/axes.pdf
site/dvl/dvl-protocol/dvl-protocol.pdf
site/dvl/dead-reckoning/dead-reckoning.pdf
site/dvl/gui/dashboard/dashboard.pdf
site/dvl/gui/diagnostic-report/diagnostic-report.pdf
site/dvl/gui/demo-gui/demo-gui.pdf
site/dvl/gui/configuration/configuration.pdf
site/dvl/bluerov-integration/bluerov-integration.pdf
site/dvl/sw-update/sw-update.pdf"

echo $files
pdftk $files cat output waterlinked-dvl-manual-offline.pdf

