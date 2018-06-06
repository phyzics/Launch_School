/* closuresGC.js - How Closures Affect Garbage Collection
1) `a` won't be GCed since it can always be access at the global scope
      - technically it will be once the program finishes
   `b` will be after `add()` finishes executing within `run()`
   `c` will be after `run()` finishes executing

2) Once the program finishes running
*/
