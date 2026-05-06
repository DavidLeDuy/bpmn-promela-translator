bool Event_0z828wa;
ltl test { <> ((Event_0z828wa) && (len(Flow_0itp0jh) == 0 && len(Flow_05lconz) == 0 && len(Flow_0socqr3) == 0 && len(Flow_014o5z6) == 0 && len(Flow_10ekyzb) == 0))}
chan Flow_0itp0jh = [2] of { bit };
chan Flow_05lconz = [2] of { bit };
chan Flow_0socqr3 = [2] of { bit };
chan Flow_014o5z6 = [2] of { bit };
chan Flow_10ekyzb = [2] of { bit };

proctype Node_StartEvent_1uy4ti3() {
  start_StartEvent_1uy4ti3:
  atomic {
    Flow_0itp0jh!1;
  }
}


proctype Node_Gateway_0cbmcoj() {
  exclusive_gateway_Gateway_0cbmcoj:
  atomic {
    do
    :: Flow_0itp0jh?1 ->
       Flow_05lconz!1;
       assert(len(Flow_05lconz) < 2);
    :: Flow_10ekyzb?1 ->
       Flow_05lconz!1;
       assert(len(Flow_05lconz) < 2);
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_1ihr6n8() {
  task_Activity_1ihr6n8:
  atomic {
    do
    :: Flow_05lconz?1 ->
       Flow_0socqr3!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Gateway_1qbjdlm() {
  exclusive_gateway_Gateway_1qbjdlm:
  atomic {
    do
    :: Flow_0socqr3?1 ->
        if
        :: Flow_014o5z6!1;
        :: Flow_10ekyzb!1;
        fi;
    :: timeout -> break;
    od;
  }
}


proctype Node_Event_0z828wa() {
end_Event_0z828wa:
  atomic {
    Flow_014o5z6?1;
    Event_0z828wa = 1;
  }
}


init {
  atomic {
    run Node_Gateway_0cbmcoj();
    run Node_Activity_1ihr6n8();
    run Node_Gateway_1qbjdlm();
    run Node_Event_0z828wa();
    run Node_StartEvent_1uy4ti3();
  }
}
