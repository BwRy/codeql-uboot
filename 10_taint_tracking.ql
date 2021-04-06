/**
* @kind path-problem
*/

import cpp
import semmle.code.cpp.dataflow.TaintTracking
import DataFlow::PathGraph
 
class NetworkByteSwap extends Expr {
    NetworkByteSwap() {
        exists(MacroInvocation mc |
            mc.getExpr() = this and
            mc.getMacroName().matches("ntoh%")
        )
    }
}
 
class Config extends TaintTracking::Configuration {
  Config() { this = "NetworkToMemFuncLength" }

  override predicate isSource(DataFlow::Node source) {
      source.asExpr() instanceof NetworkByteSwap
  }

  override predicate isSink(DataFlow::Node sink) {
    exists(FunctionCall fc |
        fc.getTarget().getQualifiedName() = "memcpy" and
        sink.asExpr() = fc.getArgument(2)
    )
  }

}

from Config cfg, DataFlow::PathNode source, DataFlow::PathNode sink
where cfg.hasFlowPath(source, sink)
select sink, source, sink, "Network byte swap flows to memcpy"