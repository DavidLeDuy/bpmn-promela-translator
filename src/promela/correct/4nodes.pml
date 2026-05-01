bool Event_1sdloo5;
ltl reach_all_end_events { <> (Event_1sdloo5)};
ltl no_token_left_behind { [] ((Event_1sdloo5) -> (len(Flow_18hry6m) == 0 && len(Flow_176mcd0) == 0 && len(Flow_0mmh39s) == 0 && len(Flow_0fceg8u) == 0 && len(Flow_09oputu) == 0))}
ltl test { <> ((Event_1sdloo5) && (len(Flow_18hry6m) == 0 && len(Flow_176mcd0) == 0 && len(Flow_0mmh39s) == 0 && len(Flow_0fceg8u) == 0 && len(Flow_09oputu) == 0))}
chan Flow_18hry6m = [2] of { bit };
chan Flow_176mcd0 = [2] of { bit };
chan Flow_0mmh39s = [2] of { bit };
chan Flow_0fceg8u = [2] of { bit };
chan Flow_09oputu = [2] of { bit };

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
       Flow_09oputu!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Event_1sdloo5() {
end_Event_1sdloo5:
  atomic {
    Flow_09oputu?1;
    Event_1sdloo5 = 1;
  }
}


init {
  atomic {
    run Node_Activity_1k9hlq7();
    run Node_Activity_15m1t5w();
    run Node_Activity_0agjrb8();
    run Node_Activity_05kcl1w();
    run Node_Event_1sdloo5();
    run Node_FlowNode_1();
  }
}
