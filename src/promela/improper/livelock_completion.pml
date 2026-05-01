bool e6;
ltl reach_all_end_events { <> (e6)};
ltl no_token_left_behind { [] ((e6) -> (len(Flow_0p0hb5v) == 0 && len(Flow_0m2k79s) == 0 && len(Flow_1bqhctg) == 0 && len(Flow_16lgv9r) == 0 && len(Flow_0lsxb0c) == 0 && len(f3) == 0))}
ltl test { <> ((e6) && (len(Flow_0p0hb5v) == 0 && len(Flow_0m2k79s) == 0 && len(Flow_1bqhctg) == 0 && len(Flow_16lgv9r) == 0 && len(Flow_0lsxb0c) == 0 && len(f3) == 0))}
chan Flow_0p0hb5v = [2] of { bit };
chan Flow_0m2k79s = [2] of { bit };
chan Flow_1bqhctg = [2] of { bit };
chan Flow_16lgv9r = [2] of { bit };
chan Flow_0lsxb0c = [2] of { bit };
chan f3 = [2] of { bit };

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


proctype Node_Activity_1lk81qh() {
  task_Activity_1lk81qh:
  atomic {
    do
    :: Flow_0m2k79s?1 ->
       Flow_1bqhctg!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Gateway_1dzoys7() {
  exclusive_gateway_Gateway_1dzoys7:
  atomic {
    do
    :: Flow_1bqhctg?1 ->
       Flow_0m2k79s!1;
       assert(len(Flow_0m2k79s) < 2);
    :: Flow_16lgv9r?1 ->
       Flow_0m2k79s!1;
       assert(len(Flow_0m2k79s) < 2);
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
        Flow_16lgv9r!1;
        assert(len(Flow_16lgv9r) < 2);
        Flow_0lsxb0c!1;
        assert(len(Flow_0lsxb0c) < 2);
      :: timeout -> break;
      od;
    }
}


init {
  atomic {
    run Node_e3();
    run Node_e6();
    run Node_Activity_1lk81qh();
    run Node_Gateway_1dzoys7();
    run Node_e4();
    run Node_e1();
  }
}
