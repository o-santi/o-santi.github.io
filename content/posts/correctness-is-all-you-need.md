+++
title = "correctness is all you need"
author = ["santi"]
lastmod = 2024-05-09T23:35:32-03:00
tags = ["coq", "rust"]
draft = false
+++

```python
>>> 0.1 + 0.2
0.30000000000000004
```

which of course is an annoying encounter for the unitiated in floats, but there's a much bigger problem, that usually isn't noticed at all until much later, that float addition itself isn't even associative:

```python
>>> (0.1 + 0.2) + 0.3
0.6000000000000001
>>> 0.1 + (0.2 + 0.3)
0.6
>>> 0.1 + (0.2 + 0.3) == (0.1 + 0.2) + 0.3
False
>>>
```

and this is a problem, because associativity is a big underlying assumption that we commonly have for numbers, when, for example, summing a list in reverse. other common pitfalls include:

-   not all numbers have an additive inverse, ie. for some number `n`, `n + (-n) != n`.
-   not all numbers different than 0 have a multiplicative inverse, ie. for some number `n`, `n / n != 1`.
-   addition is not commutative, ie. for numbers `a` `b`, `a + b != b + a`.

and the list goes you on, you get the idea. this usually isn't thought of the main problems in
