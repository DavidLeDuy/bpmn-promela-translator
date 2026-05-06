bool e6, Event_1ahudz4;
ltl test { <> ((e6 || Event_1ahudz4) && (len(f3) == 0 && len(Flow_0p0hb5v) == 0 && len(Flow_0lsxb0c) == 0 && len(Flow_1hengsd) == 0 && len(Flow_15zbjr7) == 0))}
chan f3 = [2] of { bit };
chan Flow_0p0hb5v = [2] of { bit };
chan Flow_0lsxb0c = [2] of { bit };
chan Flow_1hengsd = [2] of { bit };
chan Flow_15zbjr7 = [2] of { bit };

proctype Node_e1() {
  start_e1:
  atomic {
    Flow_0p0hb5v!1;
  }
}


proctype Node_e3() {
  task_e3:
  atomic {
    do
    :: Flow_0p0hb5v?1 ->
       f3!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_e6() {
end_e6:
  atomic {
    Flow_0lsxb0c?1;
    e6 = 1;
  }
}


proctype Node_Activity_0zsx5rx() {
  task_Activity_0zsx5rx:
  atomic {
    do
    :: Flow_15zbjr7?1 ->
       Flow_1hengsd!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_e4() {
  parallel_gateway_e4:
    atomic {
      do
      :: nempty(f3) ->
        f3?1;
        Flow_0lsxb0c!1;
        assert(len(Flow_0lsxb0c) < 2);
        Flow_15zbjr7!1;
        assert(len(Flow_15zbjr7) < 2);
      :: timeout -> break;
      od;
    }
}


proctype Node_Event_1ahudz4() {
end_Event_1ahudz4:
  atomic {
    Flow_1hengsd?1;
    Event_1ahudz4 = 1;
  }
}


init {
  atomic {
    run Node_e3();
    run Node_e6();
    run Node_Activity_0zsx5rx();
    run Node_e4();
    run Node_Event_1ahudz4();
    run Node_e1();
  }
}
