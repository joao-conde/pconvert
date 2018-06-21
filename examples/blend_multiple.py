#!/usr/bin/python
# -*- coding: utf-8 -*-

import os

import pconvert

pconvert.blend_multiple(
    (
        os.path.abspath("../assets/demo/sole.png"),
        os.path.abspath("../assets/demo/back.png"),
        os.path.abspath("../assets/demo/front.png")
    ),
    os.path.abspath("result.basic.png"),
    algorithm = "destination_over",
    is_inline = True
)

pconvert.blend_multiple(
    (
        os.path.abspath("../assets/demo/sole.png"),
        os.path.abspath("../assets/demo/back.png"),
        os.path.abspath("../assets/demo/front.png")
    ),
    os.path.abspath("result.source_over.png"),
    algorithm = "destination_over",
    is_inline = True
)
