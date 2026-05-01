bool Event_1b9lrr8;
ltl reach_all_end_events { <> (Event_1b9lrr8)};
ltl no_token_left_behind { [] ((Event_1b9lrr8) -> (len(Flow_0adhm0f) == 0 && len(Flow_0rlxvg9) == 0 && len(Flow_01e6afb) == 0 && len(Flow_04mw7pp) == 0 && len(Flow_18uw2hp) == 0 && len(Flow_10zyoyz) == 0 && len(Flow_1ayh8c4) == 0 && len(Flow_1mh1bh6) == 0 && len(Flow_1swjyuy) == 0 && len(Flow_1gjd5a1) == 0 && len(Flow_0jxefuz) == 0 && len(Flow_1c51s48) == 0 && len(Flow_1tny128) == 0 && len(Flow_1u7wxvo) == 0 && len(Flow_00dw5rj) == 0 && len(Flow_1dl4kcq) == 0 && len(Flow_00pap6x) == 0 && len(Flow_1xk6w8w) == 0 && len(Flow_1oov1le) == 0 && len(Flow_1kz3wt4) == 0 && len(Flow_1dynh9x) == 0 && len(Flow_0wuzm5d) == 0 && len(Flow_0y1ojdp) == 0))}
ltl test { <> ((Event_1b9lrr8) && (len(Flow_0adhm0f) == 0 && len(Flow_0rlxvg9) == 0 && len(Flow_01e6afb) == 0 && len(Flow_04mw7pp) == 0 && len(Flow_18uw2hp) == 0 && len(Flow_10zyoyz) == 0 && len(Flow_1ayh8c4) == 0 && len(Flow_1mh1bh6) == 0 && len(Flow_1swjyuy) == 0 && len(Flow_1gjd5a1) == 0 && len(Flow_0jxefuz) == 0 && len(Flow_1c51s48) == 0 && len(Flow_1tny128) == 0 && len(Flow_1u7wxvo) == 0 && len(Flow_00dw5rj) == 0 && len(Flow_1dl4kcq) == 0 && len(Flow_00pap6x) == 0 && len(Flow_1xk6w8w) == 0 && len(Flow_1oov1le) == 0 && len(Flow_1kz3wt4) == 0 && len(Flow_1dynh9x) == 0 && len(Flow_0wuzm5d) == 0 && len(Flow_0y1ojdp) == 0))}
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
chan Flow_0jxefuz = [2] of { bit };
chan Flow_1c51s48 = [2] of { bit };
chan Flow_1tny128 = [2] of { bit };
chan Flow_1u7wxvo = [2] of { bit };
chan Flow_00dw5rj = [2] of { bit };
chan Flow_1dl4kcq = [2] of { bit };
chan Flow_00pap6x = [2] of { bit };
chan Flow_1xk6w8w = [2] of { bit };
chan Flow_1oov1le = [2] of { bit };
chan Flow_1kz3wt4 = [2] of { bit };
chan Flow_1dynh9x = [2] of { bit };
chan Flow_0wuzm5d = [2] of { bit };
chan Flow_0y1ojdp = [2] of { bit };

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
       Flow_00pap6x!1;
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
       Flow_1xk6w8w!1;
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
       Flow_1oov1le!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_0bj49qk() {
  task_Activity_0bj49qk:
  atomic {
    do
    :: Flow_00pap6x?1 ->
       Flow_0jxefuz!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_142kfkv() {
  task_Activity_142kfkv:
  atomic {
    do
    :: Flow_1xk6w8w?1 ->
       Flow_1c51s48!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_1l8wr5v() {
  task_Activity_1l8wr5v:
  atomic {
    do
    :: Flow_1oov1le?1 ->
       Flow_1tny128!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_1wz4sts() {
  task_Activity_1wz4sts:
  atomic {
    do
    :: Flow_1c51s48?1 ->
       Flow_00dw5rj!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_1ifqgpy() {
  task_Activity_1ifqgpy:
  atomic {
    do
    :: Flow_1dl4kcq?1 ->
       Flow_1kz3wt4!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_1g499tu() {
  task_Activity_1g499tu:
  atomic {
    do
    :: Flow_00dw5rj?1 ->
       Flow_0wuzm5d!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_0674vtb() {
  task_Activity_0674vtb:
  atomic {
    do
    :: Flow_1u7wxvo?1 ->
       Flow_1dynh9x!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_0gpvzzz() {
  task_Activity_0gpvzzz:
  atomic {
    do
    :: Flow_1tny128?1 ->
       Flow_1u7wxvo!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_1q51710() {
  task_Activity_1q51710:
  atomic {
    do
    :: Flow_0jxefuz?1 ->
       Flow_1dl4kcq!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Gateway_0r7hfq9() {
  parallel_gateway_Gateway_0r7hfq9:
    atomic {
      do
      :: nempty(Flow_1kz3wt4) && nempty(Flow_1dynh9x) && nempty(Flow_0wuzm5d) ->
        Flow_1kz3wt4?1;
        Flow_1dynh9x?1;
        Flow_0wuzm5d?1;
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
    run Node_Activity_0m6szil();
    run Node_Activity_11wluol();
    run Node_Activity_0eigoc0();
    run Node_Activity_1ykk3qb();
    run Node_Activity_1drvqsu();
    run Node_Activity_0g0rekm();
    run Node_Activity_0lybxzc();
    run Node_Activity_0bj49qk();
    run Node_Activity_142kfkv();
    run Node_Activity_1l8wr5v();
    run Node_Activity_1wz4sts();
    run Node_Activity_1ifqgpy();
    run Node_Activity_1g499tu();
    run Node_Activity_0674vtb();
    run Node_Activity_0gpvzzz();
    run Node_Activity_1q51710();
    run Node_Gateway_0r7hfq9();
    run Node_Event_1b9lrr8();
    run Node_Event_0narmgo();
  }
}
