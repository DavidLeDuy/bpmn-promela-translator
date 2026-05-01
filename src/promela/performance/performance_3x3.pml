bool Event_0dj6tnp;
ltl reach_all_end_events { <> (Event_0dj6tnp)};
ltl no_token_left_behind { [] ((Event_0dj6tnp) -> (len(Flow_0adhm0f) == 0 && len(Flow_0rlxvg9) == 0 && len(Flow_01e6afb) == 0 && len(Flow_04mw7pp) == 0 && len(Flow_18uw2hp) == 0 && len(Flow_10zyoyz) == 0 && len(Flow_1ayh8c4) == 0 && len(Flow_1mh1bh6) == 0 && len(Flow_1swjyuy) == 0 && len(Flow_1gjd5a1) == 0 && len(Flow_0t8ir75) == 0 && len(Flow_1sq8o3v) == 0 && len(Flow_0tob8dw) == 0 && len(Flow_0eeg6a5) == 0))}
ltl test { <> ((Event_0dj6tnp) && (len(Flow_0adhm0f) == 0 && len(Flow_0rlxvg9) == 0 && len(Flow_01e6afb) == 0 && len(Flow_04mw7pp) == 0 && len(Flow_18uw2hp) == 0 && len(Flow_10zyoyz) == 0 && len(Flow_1ayh8c4) == 0 && len(Flow_1mh1bh6) == 0 && len(Flow_1swjyuy) == 0 && len(Flow_1gjd5a1) == 0 && len(Flow_0t8ir75) == 0 && len(Flow_1sq8o3v) == 0 && len(Flow_0tob8dw) == 0 && len(Flow_0eeg6a5) == 0))}
chan Flow_0adhm0f = [2] of { bit };
chan Flow_0rlxvg9 = [2] of { bit };
chan Flow_01e6afb = [2] of { bit };
chan Flow_04mw7pp = [2] of { bit };
chan Flow_18uw2hp = [2] of { bit };
chan Flow_10zyoyz = [2] of { bit };
chan Flow_1ayh8c4 = [2] of { bit };
chan Flow_1mh1bh6 = [2] of { bit };
chan Flow_1swjyuy = [2] of { bit };
chan Flow_1gjd5a1 = [2] of { bit };
chan Flow_0t8ir75 = [2] of { bit };
chan Flow_1sq8o3v = [2] of { bit };
chan Flow_0tob8dw = [2] of { bit };
chan Flow_0eeg6a5 = [2] of { bit };

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
        Flow_04mw7pp!1;
        assert(len(Flow_04mw7pp) < 2);
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


proctype Node_Activity_0m6szil() {
  task_Activity_0m6szil:
  atomic {
    do
    :: Flow_04mw7pp?1 ->
       Flow_1swjyuy!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_11wluol() {
  task_Activity_11wluol:
  atomic {
    do
    :: Flow_18uw2hp?1 ->
       Flow_10zyoyz!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_0eigoc0() {
  task_Activity_0eigoc0:
  atomic {
    do
    :: Flow_10zyoyz?1 ->
       Flow_0t8ir75!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_1ykk3qb() {
  task_Activity_1ykk3qb:
  atomic {
    do
    :: Flow_1ayh8c4?1 ->
       Flow_1mh1bh6!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_1drvqsu() {
  task_Activity_1drvqsu:
  atomic {
    do
    :: Flow_1mh1bh6?1 ->
       Flow_1sq8o3v!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_0g0rekm() {
  task_Activity_0g0rekm:
  atomic {
    do
    :: Flow_1swjyuy?1 ->
       Flow_1gjd5a1!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_0lybxzc() {
  task_Activity_0lybxzc:
  atomic {
    do
    :: Flow_1gjd5a1?1 ->
       Flow_0tob8dw!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Gateway_1mr75g8() {
  parallel_gateway_Gateway_1mr75g8:
    atomic {
      do
      :: nempty(Flow_0t8ir75) && nempty(Flow_1sq8o3v) && nempty(Flow_0tob8dw) ->
        Flow_0t8ir75?1;
        Flow_1sq8o3v?1;
        Flow_0tob8dw?1;
        Flow_0eeg6a5!1;
      :: timeout -> break;
      od;
    }
}


proctype Node_Event_0dj6tnp() {
end_Event_0dj6tnp:
  atomic {
    Flow_0eeg6a5?1;
    Event_0dj6tnp = 1;
  }
}


init {
  atomic {
    run Node_Gateway_15yxp1d();
    run Node_Activity_176wcvn();
    run Node_Activity_0ubz3vm();
    run Node_Activity_0m6szil();
    run Node_Activity_11wluol();
    run Node_Activity_0eigoc0();
    run Node_Activity_1ykk3qb();
    run Node_Activity_1drvqsu();
    run Node_Activity_0g0rekm();
    run Node_Activity_0lybxzc();
    run Node_Gateway_1mr75g8();
    run Node_Event_0dj6tnp();
    run Node_Event_0narmgo();
  }
}
