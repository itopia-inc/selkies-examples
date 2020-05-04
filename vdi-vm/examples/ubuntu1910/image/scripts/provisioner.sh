#!/bin/bash

# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e
set -x

SCRIPT_DIR=$(dirname $(readlink -f $0 2>/dev/null) 2>/dev/null || echo "${PWD}/$(dirname $0)")

# Install OS components
[[ ${INSTALL_CORE:-"true"} == "true" ]] && ${SCRIPT_DIR}/install_desktop.sh
[[ ${INSTALL_WEBRTC:-"true"} == "true" ]] && ${SCRIPT_DIR}/install_webrtc_ubuntu1910.sh

# Install startup scripts.
mkdir -p /opt/vdi
cp ${SCRIPT_DIR}/{start_webrtc.sh,startx.sh} /opt/vdi/

# Remove installer files
[[ ${SCRIPT_DIR} != "/" ]] && rm -rf ${SCRIPT_DIR}
