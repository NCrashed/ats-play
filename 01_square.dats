#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

fn square (x:double): double = x * x

val v = square (42.0)
val _ = print (v)
//
implement main0 () = () // a dummy for [main]
//
