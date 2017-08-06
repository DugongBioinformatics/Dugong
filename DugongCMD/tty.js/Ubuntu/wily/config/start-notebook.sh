#!/bin/bash
# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

set -e

. /usr/local/bin/start.sh jupyter notebook $*
/etc/init.d/ssh start
systemctl enable ssh
