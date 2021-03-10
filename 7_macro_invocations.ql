
import cpp

from Macro m, MacroInvocation mc
where m.getName().matches("ntoh%") and
mc.getMacroName() = m.getName()
select mc, "matching function"