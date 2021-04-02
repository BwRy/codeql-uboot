import cpp

class NetworkByteSwap extends Expr {
    NetworkByteSwap() {
        exists(MacroInvocation mc |
            mc.getExpr() = this and
            mc.getMacroName().matches("ntoh%")
        )
    }
}

from NetworkByteSwap n, Expr e
select n, "Network byte swap"