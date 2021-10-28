version       = "0.1"
author        = "quantumedbox https://github.com/quantumedbox"
description   = "Saturation arithmetic and closed operations on natural numbers via Sat type"
license       = "WTFPL"

requires "nim >= 1.00.0"

task docgen, "Generate HTML documentation":
  exec "nim doc -o:doc/satnat.html satnat"
