#!/usr/bin/env bash
#
# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# function photo { echo "$2" > $1.meta; curl "$3" > $1.jpg; }

set -e

cd instance/photos

# Requires one of Fred's excellent ImageMagick scripts ('aspectcrop')
# See: http://www.fmwconcepts.com/imagemagick/aspectcrop/index.php

# Cut to the right aspect ratio (2:1)
mkdir -p temp
ls *jpg| xargs -I{} aspectcrop -a 2:1 -g c "{}" "temp/{}"
# These don't do well with center gravity
ls sans-pareil.jpg seagull.jpg sultan.jpg two-lion.jpg vanguard.jpg victory.jpg | xargs -I{} aspectcrop -a 2:1 -g s "{}" "temp/{}"
ls unite.jpg | xargs -I{} aspectcrop -a 2:1 -g w "{}" "temp/{}"

# Downsize any really large images to ~(600x300)
mkdir -p thumbs
ls temp/ | xargs -I{} convert -resize "180000@>" "temp/{}" "thumbs/{}"

