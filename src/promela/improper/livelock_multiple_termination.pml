bool e2;
ltl test { <> ((e2) && (len(Flow_12ha33e) == 0 && len(Flow_0gyi16t) == 0 && len(Flow_0q0fdtd) == 0 && len(Flow_1q5hr1g) == 0 && len(Flow_1qbeicj) == 0 && len(Flow_0ije8ln) == 0))}
chan Flow_12ha33e = [2] of { bit };
chan Flow_0gyi16t = [2] of { bit };
chan Flow_0q0fdtd = [2] of { bit };
chan Flow_1q5hr1g = [2] of { bit };
chan Flow_1qbeicj = [2] of { bit };
chan Flow_0ije8ln = [2] of { bit };

proctype Node_e1() {
  start_e1:
  atomic {
    Flow_12ha33e!1;
  }
}


proctype Node_Activity_19aoqgd() {
  task_Activity_19aoqgd:
  atomic {
    do
    :: Flow_0gyi16t?1 ->
       Flow_0q0fdtd!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_gx1() {
  parallel_gateway_gx1:
    atomic {
      do
      :: nempty(Flow_0q0fdtd) ->
        Flow_0q0fdtd?1;
        Flow_1q5hr1g!1;
        assert(len(Flow_1q5hr1g) < 2);
        Flow_1qbeicj!1;
        assert(len(Flow_1qbeicj) < 2);
      :: timeout -> break;
      od;
    }
}


proctype Node_Gateway_03vtrqi() {
  exclusive_gateway_Gateway_03vtrqi:
  atomic {
    do
    :: Flow_12ha33e?1 ->
       Flow_0gyi16t!1;
       assert(len(Flow_0gyi16t) < 2);
    :: Flow_1q5hr1g?1 ->
       Flow_0gyi16t!1;
       assert(len(Flow_0gyi16t) < 2);
    :: timeout -> break;
    od;
  }
}


proctype Node_e2() {
end_e2:
  atomic {
    Flow_0ije8ln?1;
    e2 = 1;
  }
}


proctype Node_Activity_1am59kx() {
  task_Activity_1am59kx:
  atomic {
    do
    :: Flow_1qbeicj?1 ->
       Flow_0ije8ln!1;
    :: timeout -> break;
    od;
  }
}


init {
  atomic {
    run Node_Activity_19aoqgd();
    run Node_gx1();
    run Node_Gateway_03vtrqi();
    run Node_e2();
    run Node_Activity_1am59kx();
    run Node_e1();
  }
}
