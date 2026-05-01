bool e2;
ltl reach_all_end_events { <> (e2)};
ltl no_token_left_behind { [] ((e2) -> (len(f4) == 0 && len(f5) == 0 && len(f7) == 0 && len(Flow_0neqag2) == 0 && len(Flow_0asvkzx) == 0 && len(Flow_0nkzu79) == 0 && len(Flow_1tvypv3) == 0 && len(Flow_188xqlc) == 0 && len(Flow_1la0beq) == 0 && len(Flow_05fh046) == 0))}
ltl test { <> ((e2) && (len(f4) == 0 && len(f5) == 0 && len(f7) == 0 && len(Flow_0neqag2) == 0 && len(Flow_0asvkzx) == 0 && len(Flow_0nkzu79) == 0 && len(Flow_1tvypv3) == 0 && len(Flow_188xqlc) == 0 && len(Flow_1la0beq) == 0 && len(Flow_05fh046) == 0))}
chan f4 = [2] of { bit };
chan f5 = [2] of { bit };
chan f7 = [2] of { bit };
chan Flow_0neqag2 = [2] of { bit };
chan Flow_0asvkzx = [2] of { bit };
chan Flow_0nkzu79 = [2] of { bit };
chan Flow_1tvypv3 = [2] of { bit };
chan Flow_188xqlc = [2] of { bit };
chan Flow_1la0beq = [2] of { bit };
chan Flow_05fh046 = [2] of { bit };

proctype Node_t4() {
  task_t4:
  atomic {
    do
    :: f5?1 ->
       f7!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_gx2() {
  parallel_gateway_gx2:
    atomic {
      do
      :: nempty(f7) && nempty(Flow_05fh046) ->
        f7?1;
        Flow_05fh046?1;
        Flow_0nkzu79!1;
      :: timeout -> break;
      od;
    }
}


proctype Node_gx1() {
  parallel_gateway_gx1:
    atomic {
      do
      :: nempty(Flow_0asvkzx) ->
        Flow_0asvkzx?1;
        f4!1;
        assert(len(f4) < 2);
        f5!1;
        assert(len(f5) < 2);
      :: timeout -> break;
      od;
    }
}


proctype Node_e1() {
  start_e1:
  atomic {
    Flow_0neqag2!1;
  }
}


proctype Node_Activity_006vpdf() {
  task_Activity_006vpdf:
  atomic {
    do
    :: Flow_0neqag2?1 ->
       Flow_0asvkzx!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_02sidgy() {
  task_Activity_02sidgy:
  atomic {
    do
    :: Flow_0nkzu79?1 ->
       Flow_1tvypv3!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_e2() {
end_e2:
  atomic {
    Flow_188xqlc?1;
    e2 = 1;
  }
}


proctype Node_Activity_03qqm2t() {
  task_Activity_03qqm2t:
  atomic {
    do
    :: Flow_1tvypv3?1 ->
       Flow_188xqlc!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_t3() {
  task_t3:
  atomic {
    do
    :: f4?1 ->
       Flow_1la0beq!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_1qup3sw() {
  task_Activity_1qup3sw:
  atomic {
    do
    :: Flow_1la0beq?1 ->
       Flow_05fh046!1;
    :: timeout -> break;
    od;
  }
}


init {
  atomic {
    run Node_t4();
    run Node_gx2();
    run Node_gx1();
    run Node_Activity_006vpdf();
    run Node_Activity_02sidgy();
    run Node_e2();
    run Node_Activity_03qqm2t();
    run Node_t3();
    run Node_Activity_1qup3sw();
    run Node_e1();
  }
}
