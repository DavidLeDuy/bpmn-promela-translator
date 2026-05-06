bool Event_0dj6tnp;
ltl test { <> ((Event_0dj6tnp) && (len(Flow_0adhm0f) == 0 && len(Flow_0rlxvg9) == 0 && len(Flow_01e6afb) == 0 && len(Flow_04mw7pp) == 0 && len(Flow_1az2v5z) == 0 && len(Flow_1eey4rd) == 0 && len(Flow_0leuggd) == 0 && len(Flow_18uw2hp) == 0 && len(Flow_10zyoyz) == 0 && len(Flow_1ayh8c4) == 0 && len(Flow_1mh1bh6) == 0 && len(Flow_1swjyuy) == 0 && len(Flow_1gjd5a1) == 0 && len(Flow_1m76h3m) == 0 && len(Flow_0rtqjs3) == 0 && len(Flow_18vuyjx) == 0 && len(Flow_0wkzv3d) == 0 && len(Flow_0sez82d) == 0 && len(Flow_1couisr) == 0 && len(Flow_0t8ir75) == 0 && len(Flow_1sq8o3v) == 0 && len(Flow_0tob8dw) == 0 && len(Flow_0xdr0ze) == 0 && len(Flow_1oli060) == 0 && len(Flow_10n58pc) == 0 && len(Flow_0eeg6a5) == 0))}
chan Flow_0adhm0f = [2] of { bit };
chan Flow_0rlxvg9 = [2] of { bit };
chan Flow_01e6afb = [2] of { bit };
chan Flow_04mw7pp = [2] of { bit };
chan Flow_1az2v5z = [2] of { bit };
chan Flow_1eey4rd = [2] of { bit };
chan Flow_0leuggd = [2] of { bit };
chan Flow_18uw2hp = [2] of { bit };
chan Flow_10zyoyz = [2] of { bit };
chan Flow_1ayh8c4 = [2] of { bit };
chan Flow_1mh1bh6 = [2] of { bit };
chan Flow_1swjyuy = [2] of { bit };
chan Flow_1gjd5a1 = [2] of { bit };
chan Flow_1m76h3m = [2] of { bit };
chan Flow_0rtqjs3 = [2] of { bit };
chan Flow_18vuyjx = [2] of { bit };
chan Flow_0wkzv3d = [2] of { bit };
chan Flow_0sez82d = [2] of { bit };
chan Flow_1couisr = [2] of { bit };
chan Flow_0t8ir75 = [2] of { bit };
chan Flow_1sq8o3v = [2] of { bit };
chan Flow_0tob8dw = [2] of { bit };
chan Flow_0xdr0ze = [2] of { bit };
chan Flow_1oli060 = [2] of { bit };
chan Flow_10n58pc = [2] of { bit };
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
        Flow_1az2v5z!1;
        assert(len(Flow_1az2v5z) < 2);
        Flow_1eey4rd!1;
        assert(len(Flow_1eey4rd) < 2);
        Flow_0leuggd!1;
        assert(len(Flow_0leuggd) < 2);
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


proctype Node_Activity_1g08n55() {
  task_Activity_1g08n55:
  atomic {
    do
    :: Flow_1az2v5z?1 ->
       Flow_1m76h3m!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_097ug2r() {
  task_Activity_097ug2r:
  atomic {
    do
    :: Flow_1eey4rd?1 ->
       Flow_18vuyjx!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_1n71a2c() {
  task_Activity_1n71a2c:
  atomic {
    do
    :: Flow_0leuggd?1 ->
       Flow_0sez82d!1;
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


proctype Node_Activity_12xie5s() {
  task_Activity_12xie5s:
  atomic {
    do
    :: Flow_1m76h3m?1 ->
       Flow_0rtqjs3!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_1ez4wcg() {
  task_Activity_1ez4wcg:
  atomic {
    do
    :: Flow_0rtqjs3?1 ->
       Flow_0xdr0ze!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_0a8bm8a() {
  task_Activity_0a8bm8a:
  atomic {
    do
    :: Flow_18vuyjx?1 ->
       Flow_0wkzv3d!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_19zu3y5() {
  task_Activity_19zu3y5:
  atomic {
    do
    :: Flow_0wkzv3d?1 ->
       Flow_1oli060!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_12d0385() {
  task_Activity_12d0385:
  atomic {
    do
    :: Flow_0sez82d?1 ->
       Flow_1couisr!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_032s9el() {
  task_Activity_032s9el:
  atomic {
    do
    :: Flow_1couisr?1 ->
       Flow_10n58pc!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Gateway_1mr75g8() {
  parallel_gateway_Gateway_1mr75g8:
    atomic {
      do
      :: nempty(Flow_0t8ir75) && nempty(Flow_1sq8o3v) && nempty(Flow_0tob8dw) && nempty(Flow_0xdr0ze) && nempty(Flow_1oli060) && nempty(Flow_10n58pc) ->
        Flow_0t8ir75?1;
        Flow_1sq8o3v?1;
        Flow_0tob8dw?1;
        Flow_0xdr0ze?1;
        Flow_1oli060?1;
        Flow_10n58pc?1;
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
    run Node_Activity_1g08n55();
    run Node_Activity_097ug2r();
    run Node_Activity_1n71a2c();
    run Node_Activity_11wluol();
    run Node_Activity_0eigoc0();
    run Node_Activity_1ykk3qb();
    run Node_Activity_1drvqsu();
    run Node_Activity_0g0rekm();
    run Node_Activity_0lybxzc();
    run Node_Activity_12xie5s();
    run Node_Activity_1ez4wcg();
    run Node_Activity_0a8bm8a();
    run Node_Activity_19zu3y5();
    run Node_Activity_12d0385();
    run Node_Activity_032s9el();
    run Node_Gateway_1mr75g8();
    run Node_Event_0dj6tnp();
    run Node_Event_0narmgo();
  }
}
