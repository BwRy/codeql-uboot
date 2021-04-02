import cpp

class NetworkByteSwap extends Expr {
    NetworkByteSwap() {
        exists(MacroInvocation mc |
            mc.getExpr() = this and
            mc.getMacroName().matches("ntoh%")
            //this = mc.getExpr() and
            //this.isInMacroExpansion()
        )
    }
}

from NetworkByteSwap n, Expr e
select n, "Network byte swap"

/*
import cpp

from Macro m, MacroInvocation mc
where m.getName().matches("ntoh%") and
mc.getMacroName() = m.getName()
select mc.getExpr(), "matching function"

class Memcpy_shit extends FunctionCall {
    Memcpy_shit() {
        this.getTarget().getName() = "memcpy" and
        exists(Expr argOne |
            argOne = this.getArgument(0) and not
            //argOne.getUnderlyingType() instanceof PointerType
            argOne.getUnderlyingType() instanceof DerivedType and
            exists(argOne)
        )
    }
    Expr fuckYou() {
        this.getTarget().getName() = "memcpy" //and not
        //this.getArgument(0).getUnderlyingType() instanceof PointerType and
        //this.getArgument(0).getUnderlyingType() instanceof DerivedType and
        //result = this.getArgument(0)
    }

}

*/