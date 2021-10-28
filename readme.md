Satnat
======
Satnat stands for "saturated natural number"
It's loosely based on this paper: https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.56.3442&rep=rep1&type=pdf

Main reasoning of such type is usage in enclosed systems where each possible value should strictly correspond to something concrete
It's opposed to allowing ranges to have "illogical" states to signal errors or invalid access, which functions only on user agreement and could easily introduce bugs

1. *+* *-* *\** */* assume that limits are uint limits (uint.low..uint.high)
2. *sadd* *ssub* *smul* *sdiv* allow user to specify concrete range to which values should be clamped and not wrap
