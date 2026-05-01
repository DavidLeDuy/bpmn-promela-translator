bool e2;
ltl reach_all_end_events { <> (e2)};
ltl no_token_left_behind { [] ((e2) -> (len(f1) == 0 && len(Flow_16mdshq) == 0 && len(Flow_1c2dv16) == 0 && len(Flow_11nd0nb) == 0 && len(Flow_1j7zrff) == 0 && len(Flow_0m0fd5p) == 0 && len(Flow_11q6cia) == 0 && len(Flow_0muy6tt) == 0 && len(Flow_0t9s0eo) == 0))}
ltl test { <> ((e2) && (len(f1) == 0 && len(Flow_16mdshq) == 0 && len(Flow_1c2dv16) == 0 && len(Flow_11nd0nb) == 0 && len(Flow_1j7zrff) == 0 && len(Flow_0m0fd5p) == 0 && len(Flow_11q6cia) == 0 && len(Flow_0muy6tt) == 0 && len(Flow_0t9s0eo) == 0))}
chan f1 = [2] of { bit };
chan Flow_16mdshq = [2] of { bit };
chan Flow_1c2dv16 = [2] of { bit };
chan Flow_11nd0nb = [2] of { bit };
chan Flow_1j7zrff = [2] of { bit };
chan Flow_0m0fd5p = [2] of { bit };
chan Flow_11q6cia = [2] of { bit };
chan Flow_0muy6tt = [2] of { bit };
chan Flow_0t9s0eo = [2] of { bit };

proctype Node_gp1() {
  parallel_gateway_gp1:
    atomic {
      do
      :: nempty(f1) ->
        f1?1;
        Flow_16mdshq!1;
        assert(len(Flow_16mdshq) < 2);
        Flow_0muy6tt!1;
        assert(len(Flow_0muy6tt) < 2);
      :: timeout -> break;
      od;
    }
}


proctype Node_e1() {
  start_e1:
  atomic {
    f1!1;
  }
}


proctype Node_Gateway_0etcf6l() {
  exclusive_gateway_Gateway_0etcf6l:
  atomic {
    do
    :: Flow_16mdshq?1 ->
       Flow_1c2dv16!1;
       assert(len(Flow_1c2dv16) < 2);
    :: Flow_0t9s0eo?1 ->
       Flow_1c2dv16!1;
       assert(len(Flow_1c2dv16) < 2);
    :: timeout -> break;
    od;
  }
}


proctype Node_Gateway_1ijplab() {
  parallel_gateway_Gateway_1ijplab:
    atomic {
      do
      :: nempty(Flow_1c2dv16) ->
        Flow_1c2dv16?1;
        Flow_11nd0nb!1;
        assert(len(Flow_11nd0nb) < 2);
        Flow_1j7zrff!1;
        assert(len(Flow_1j7zrff) < 2);
      :: timeout -> break;
      od;
    }
}


proctype Node_Activity_1agxxng() {
  task_Activity_1agxxng:
  atomic {
    do
    :: Flow_11nd0nb?1 ->
       Flow_11q6cia!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_06cq56c() {
  task_Activity_06cq56c:
  atomic {
    do
    :: Flow_1j7zrff?1 ->
       Flow_0m0fd5p!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_e2() {
end_e2:
  atomic {
    Flow_0muy6tt?1;
    e2 = 1;
  }
}


proctype Node_Gateway_02fj044() {
  exclusive_gateway_Gateway_02fj044:
  atomic {
    do
    :: Flow_0m0fd5p?1 ->
       Flow_0t9s0eo!1;
       assert(len(Flow_0t9s0eo) < 2);
    :: Flow_11q6cia?1 ->
       Flow_0t9s0eo!1;
       assert(len(Flow_0t9s0eo) < 2);
    :: timeout -> break;
    od;
  }
}


init {
  atomic {
    run Node_gp1();
    run Node_Gateway_0etcf6l();
    run Node_Gateway_1ijplab();
    run Node_Activity_1agxxng();
    run Node_Activity_06cq56c();
    run Node_e2();
    run Node_Gateway_02fj044();
    run Node_e1();
  }
}
