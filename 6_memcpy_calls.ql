import cpp

from Function f, FunctionCall fc
where fc.getTarget().getName() = "memcpy"
//and f.getName() = "memcpy"
select fc, "memcpy was called here"