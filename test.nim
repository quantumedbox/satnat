import std/unittest
import satnat

suite "test":
  test "sadd":
    check(sadd(5.Satnat, 6.Satnat, 0.Satnat..10.Satnat) == 10.Satnat)
    check(sadd(5.Satnat, Satnat.high) == Satnat.high)

  test "ssub":
    check(ssub(5.Satnat, 6.Satnat, 1.Satnat..Satnat.high) == 1.Satnat)
    check(ssub(5.Satnat, 6.Satnat) == Satnat.low)

  test "smul":
    check(smul(5.Satnat, 2.Satnat, 0.Satnat..5.Satnat) == 5.Satnat)
    check(smul(5.Satnat, Satnat.high) == Satnat.high)
    check(smul(5.Satnat, 0.Satnat, 87.Satnat..Satnat.high) == 87.Satnat)
    check(smul(5.Satnat, 0.Satnat) == Satnat.low)

  test "sdiv":
    check(sdiv(5.Satnat, 2.Satnat, 4.Satnat..Satnat.high) == 4.Satnat)
    check(sdiv(5.Satnat, Satnat.high) == Satnat.low)
    check(sdiv(5.Satnat, 0.Satnat, 87.Satnat..Satnat.high) == 87.Satnat)
    check(sdiv(5.Satnat, 0.Satnat) == Satnat.low)

  test "+":
    check(5.Satnat + 2.Satnat == 7.Satnat)
    check(5.Satnat + Satnat.high == Satnat.high)

  test "-":
    check(5.Satnat - 2.Satnat == 3.Satnat)
    check(5.Satnat - 8.Satnat == Satnat.low)

  test "*":
    check(5.Satnat * 2.Satnat == 10.Satnat)
    check(5.Satnat * Satnat.high == Satnat.high)
    check(5.Satnat * 0.Satnat == Satnat.low)

  test "/":
    check(5.Satnat / 2.Satnat == 2.Satnat)
    check(5.Satnat / Satnat.high == Satnat.low)
    check(5.Satnat / 0.Satnat == Satnat.low)
