# Loosely based on this paper: https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.56.3442&rep=rep1&type=pdf

# todo: we should probably prefix/suffix operands to clearly say when saturated arithmetic happens

from math import clamp

type
  Satnat* = distinct uint

{.push inline.}

# todo: workaround for allowing operators that are implemented for uint, probably could raise some issues
converter toUint(a: Satnat): uint = a.uint

func `sadd`*(a: Satnat, b: Satnat, limits: HSlice[Satnat, Satnat] = Satnat.low..Satnat.high): Satnat =
  ## Saturated addition with specific limit
  if a > Satnat.high - b:
    limits.b
  else:
    clamp (a.uint + b.uint).Satnat, limits

func `ssub`*(a: Satnat, b: Satnat, limits: HSlice[Satnat, Satnat] = Satnat.low..Satnat.high): Satnat =
  ## Saturated subtraction with specific limit
  if a < Satnat.low + b:
    limits.a
  else:
    clamp (a.uint - b.uint).Satnat, limits

func `smul`*(a: Satnat, b: Satnat, limits: HSlice[Satnat, Satnat] = Satnat.low..Satnat.high): Satnat =
  ## Saturated multiplication with specific limit
  if b == 0.Satnat:
    limits.a
  else:
    if a > Satnat.high div b:
      limits.b
    else:
      clamp (a.uint * b.uint).Satnat, limits

func `sdiv`*(a: Satnat, b: Satnat, limits: HSlice[Satnat, Satnat] = Satnat.low..Satnat.high): Satnat =
  ## Saturated division by 'slicing' the dividend with specific limit
  ## On division by zero returns minimal value
  if b == 0.Satnat:
    limits.a
  else:
    clamp (a.uint div b.uint).Satnat, limits

func `+`*(a: Satnat, b: Satnat): Satnat =
  ## Saturated addition without specifying upper boundary which defaults to system's maximum uint
  if a > Satnat.high - b:
    Satnat.high
  else:
    (a.uint + b.uint).Satnat

func `-`*(a: Satnat, b: Satnat): Satnat =
  ## Saturated subtraction without specifying lower boundary which defaults to uint.low (0u)
  if a < Satnat.low + b:
    Satnat.low
  else:
    (a.uint - b.uint).Satnat

func `*`*(a: Satnat, b: Satnat): Satnat =
  ## Saturated multiplication without specifying upper boundary which defaults to system's maximum uint
  if b == 0.Satnat:
    Satnat.low
  else:
    if a > Satnat.high div b:
      Satnat.high
    else:
      (a.uint * b.uint).Satnat

# todo: it's more of a `div` that `/`, probably should rename?
func `/`*(a: Satnat, b: Satnat): Satnat =
  ## Saturated division 'slicing' the dividend with lower boundary of uint.low (0u)
  ## This way division by 0.Satnat yield 0.Satnat
  if b == 0.Satnat:
    Satnat.low
  else:
    (a.uint div b.uint).Satnat

{.pop.}
