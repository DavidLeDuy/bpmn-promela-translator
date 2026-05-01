bool Event_0nu7zzn;
ltl reach_all_end_events { <> (Event_0nu7zzn)};
ltl no_token_left_behind { [] ((Event_0nu7zzn) -> (len(Flow_18hry6m) == 0 && len(Flow_176mcd0) == 0 && len(Flow_0mmh39s) == 0 && len(Flow_0fceg8u) == 0 && len(Flow_1dgybby) == 0 && len(Flow_1dvk7e5) == 0 && len(Flow_0oxfkvk) == 0 && len(Flow_1ft0ix3) == 0 && len(Flow_07la5lp) == 0 && len(Flow_01wxx0c) == 0 && len(Flow_05ulgmy) == 0 && len(Flow_0h3np34) == 0 && len(Flow_03kyzij) == 0))}
ltl test { <> ((Event_0nu7zzn) && (len(Flow_18hry6m) == 0 && len(Flow_176mcd0) == 0 && len(Flow_0mmh39s) == 0 && len(Flow_0fceg8u) == 0 && len(Flow_1dgybby) == 0 && len(Flow_1dvk7e5) == 0 && len(Flow_0oxfkvk) == 0 && len(Flow_1ft0ix3) == 0 && len(Flow_07la5lp) == 0 && len(Flow_01wxx0c) == 0 && len(Flow_05ulgmy) == 0 && len(Flow_0h3np34) == 0 && len(Flow_03kyzij) == 0))}
chan Flow_18hry6m = [2] of { bit };
chan Flow_176mcd0 = [2] of { bit };
chan Flow_0mmh39s = [2] of { bit };
chan Flow_0fceg8u = [2] of { bit };
chan Flow_1dgybby = [2] of { bit };
chan Flow_1dvk7e5 = [2] of { bit };
chan Flow_0oxfkvk = [2] of { bit };
chan Flow_1ft0ix3 = [2] of { bit };
chan Flow_07la5lp = [2] of { bit };
chan Flow_01wxx0c = [2] of { bit };
chan Flow_05ulgmy = [2] of { bit };
chan Flow_0h3np34 = [2] of { bit };
chan Flow_03kyzij = [2] of { bit };

proctype Node_FlowNode_1() {
  start_FlowNode_1:
  atomic {
    Flow_18hry6m!1;
  }
}


proctype Node_Activity_1k9hlq7() {
  task_Activity_1k9hlq7:
  atomic {
    do
    :: Flow_18hry6m?1 ->
       Flow_176mcd0!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_15m1t5w() {
  task_Activity_15m1t5w:
  atomic {
    do
    :: Flow_176mcd0?1 ->
       Flow_0mmh39s!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_0agjrb8() {
  task_Activity_0agjrb8:
  atomic {
    do
    :: Flow_0mmh39s?1 ->
       Flow_0fceg8u!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_05kcl1w() {
  task_Activity_05kcl1w:
  atomic {
    do
    :: Flow_0fceg8u?1 ->
       Flow_1dgybby!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_0qu9np4() {
  task_Activity_0qu9np4:
  atomic {
    do
    :: Flow_1dgybby?1 ->
       Flow_1dvk7e5!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_1u9owoz() {
  task_Activity_1u9owoz:
  atomic {
    do
    :: Flow_1dvk7e5?1 ->
       Flow_0oxfkvk!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_0chzdqa() {
  task_Activity_0chzdqa:
  atomic {
    do
    :: Flow_0oxfkvk?1 ->
       Flow_1ft0ix3!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_0yuy4k8() {
  task_Activity_0yuy4k8:
  atomic {
    do
    :: Flow_1ft0ix3?1 ->
       Flow_07la5lp!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_1w7j49y() {
  task_Activity_1w7j49y:
  atomic {
    do
    :: Flow_07la5lp?1 ->
       Flow_01wxx0c!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_137foj0() {
  task_Activity_137foj0:
  atomic {
    do
    :: Flow_01wxx0c?1 ->
       Flow_05ulgmy!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_0rk7zf5() {
  task_Activity_0rk7zf5:
  atomic {
    do
    :: Flow_05ulgmy?1 ->
       Flow_0h3np34!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Event_0nu7zzn() {
end_Event_0nu7zzn:
  atomic {
    Flow_03kyzij?1;
    Event_0nu7zzn = 1;
  }
}


proctype Node_Activity_14586ao() {
  task_Activity_14586ao:
  atomic {
    do
    :: Flow_0h3np34?1 ->
       Flow_03kyzij!1;
    :: timeout -> break;
    od;
  }
}


init {
  atomic {
    run Node_Activity_1k9hlq7();
    run Node_Activity_15m1t5w();
    run Node_Activity_0agjrb8();
    run Node_Activity_05kcl1w();
    run Node_Activity_0qu9np4();
    run Node_Activity_1u9owoz();
    run Node_Activity_0chzdqa();
    run Node_Activity_0yuy4k8();
    run Node_Activity_1w7j49y();
    run Node_Activity_137foj0();
    run Node_Activity_0rk7zf5();
    run Node_Event_0nu7zzn();
    run Node_Activity_14586ao();
    run Node_FlowNode_1();
  }
}
