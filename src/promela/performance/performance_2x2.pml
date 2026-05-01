bool Event_1b9lrr8;
ltl reach_all_end_events { <> (Event_1b9lrr8)};
ltl no_token_left_behind { [] ((Event_1b9lrr8) -> (len(Flow_0adhm0f) == 0 && len(Flow_0rlxvg9) == 0 && len(Flow_01e6afb) == 0 && len(Flow_18uw2hp) == 0 && len(Flow_1ayh8c4) == 0 && len(Flow_0y1ojdp) == 0 && len(Flow_1pyv1kf) == 0 && len(Flow_0cz6etv) == 0))}
ltl test { <> ((Event_1b9lrr8) && (len(Flow_0adhm0f) == 0 && len(Flow_0rlxvg9) == 0 && len(Flow_01e6afb) == 0 && len(Flow_18uw2hp) == 0 && len(Flow_1ayh8c4) == 0 && len(Flow_0y1ojdp) == 0 && len(Flow_1pyv1kf) == 0 && len(Flow_0cz6etv) == 0))}
chan Flow_0adhm0f = [2] of { bit };
chan Flow_0rlxvg9 = [2] of { bit };
chan Flow_01e6afb = [2] of { bit };
chan Flow_18uw2hp = [2] of { bit };
chan Flow_1ayh8c4 = [2] of { bit };
chan Flow_0y1ojdp = [2] of { bit };
chan Flow_1pyv1kf = [2] of { bit };
chan Flow_0cz6etv = [2] of { bit };

proctype Node_Event_0narmgo() {
  start_Event_0narmgo:
  atomic {
    Flow_0adhm0f!1;
  }
}


proctype Node_Gateway_15yxp1d() {
  parallel_gateway_Gateway_15yxp1d:
    atomic {
      do
      :: nempty(Flow_0adhm0f) ->
        Flow_0adhm0f?1;
        Flow_0rlxvg9!1;
        assert(len(Flow_0rlxvg9) < 2);
        Flow_01e6afb!1;
        assert(len(Flow_01e6afb) < 2);
      :: timeout -> break;
      od;
    }
}


proctype Node_Activity_176wcvn() {
  task_Activity_176wcvn:
  atomic {
    do
    :: Flow_0rlxvg9?1 ->
       Flow_18uw2hp!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_0ubz3vm() {
  task_Activity_0ubz3vm:
  atomic {
    do
    :: Flow_01e6afb?1 ->
       Flow_1ayh8c4!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_11wluol() {
  task_Activity_11wluol:
  atomic {
    do
    :: Flow_18uw2hp?1 ->
       Flow_1pyv1kf!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_1ykk3qb() {
  task_Activity_1ykk3qb:
  atomic {
    do
    :: Flow_1ayh8c4?1 ->
       Flow_0cz6etv!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Gateway_0r7hfq9() {
  parallel_gateway_Gateway_0r7hfq9:
    atomic {
      do
      :: nempty(Flow_1pyv1kf) && nempty(Flow_0cz6etv) ->
        Flow_1pyv1kf?1;
        Flow_0cz6etv?1;
        Flow_0y1ojdp!1;
      :: timeout -> break;
      od;
    }
}


proctype Node_Event_1b9lrr8() {
end_Event_1b9lrr8:
  atomic {
    Flow_0y1ojdp?1;
    Event_1b9lrr8 = 1;
  }
}


init {
  atomic {
    run Node_Gateway_15yxp1d();
    run Node_Activity_176wcvn();
    run Node_Activity_0ubz3vm();
    run Node_Activity_11wluol();
    run Node_Activity_1ykk3qb();
    run Node_Gateway_0r7hfq9();
    run Node_Event_1b9lrr8();
    run Node_Event_0narmgo();
  }
}
