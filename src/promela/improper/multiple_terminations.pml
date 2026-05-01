bool e2;
ltl reach_all_end_events { <> (e2)};
ltl no_token_left_behind { [] ((e2) -> (len(Flow_0q0fdtd) == 0 && len(Flow_12ha33e) == 0 && len(Flow_0g7xl2n) == 0 && len(Flow_0yomg7c) == 0 && len(Flow_1y5t056) == 0 && len(Flow_1ryjv5k) == 0))}
ltl test { <> ((e2) && (len(Flow_0q0fdtd) == 0 && len(Flow_12ha33e) == 0 && len(Flow_0g7xl2n) == 0 && len(Flow_0yomg7c) == 0 && len(Flow_1y5t056) == 0 && len(Flow_1ryjv5k) == 0))}
chan Flow_0q0fdtd = [2] of { bit };
chan Flow_12ha33e = [2] of { bit };
chan Flow_0g7xl2n = [2] of { bit };
chan Flow_0yomg7c = [2] of { bit };
chan Flow_1y5t056 = [2] of { bit };
chan Flow_1ryjv5k = [2] of { bit };

proctype Node_Activity_19aoqgd() {
  task_Activity_19aoqgd:
  atomic {
    do
    :: Flow_1ryjv5k?1 ->
       Flow_0q0fdtd!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_0hgxxro() {
  task_Activity_0hgxxro:
  atomic {
    do
    :: Flow_1y5t056?1 ->
       Flow_0yomg7c!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_e2() {
end_e2:
  atomic {
    Flow_0g7xl2n?1;
    e2 = 1;
  }
}


proctype Node_e1() {
  start_e1:
  atomic {
    Flow_12ha33e!1;
  }
}


proctype Node_Gateway_16lz908() {
  parallel_gateway_Gateway_16lz908:
    atomic {
      do
      :: nempty(Flow_12ha33e) ->
        Flow_12ha33e?1;
        Flow_1y5t056!1;
        assert(len(Flow_1y5t056) < 2);
        Flow_1ryjv5k!1;
        assert(len(Flow_1ryjv5k) < 2);
      :: timeout -> break;
      od;
    }
}


proctype Node_gx1() {
  exclusive_gateway_gx1:
  atomic {
    do
    :: Flow_0q0fdtd?1 ->
       Flow_0g7xl2n!1;
       assert(len(Flow_0g7xl2n) < 2);
    :: Flow_0yomg7c?1 ->
       Flow_0g7xl2n!1;
       assert(len(Flow_0g7xl2n) < 2);
    :: timeout -> break;
    od;
  }
}


init {
  atomic {
    run Node_Activity_19aoqgd();
    run Node_Activity_0hgxxro();
    run Node_e2();
    run Node_Gateway_16lz908();
    run Node_gx1();
    run Node_e1();
  }
}
