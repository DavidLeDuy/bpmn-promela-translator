bool Event_0er1rer;
ltl test { <> ((Event_0er1rer) && (len(Flow_18hry6m) == 0 && len(Flow_0k243p1) == 0 && len(Flow_1q12yo1) == 0 && len(Flow_0msbshj) == 0 && len(Flow_19hhf86) == 0 && len(Flow_1lrtpjz) == 0))}
chan Flow_18hry6m = [2] of { bit };
chan Flow_0k243p1 = [2] of { bit };
chan Flow_1q12yo1 = [2] of { bit };
chan Flow_0msbshj = [2] of { bit };
chan Flow_19hhf86 = [2] of { bit };
chan Flow_1lrtpjz = [2] of { bit };

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
    :: Flow_0k243p1?1 ->
       Flow_0msbshj!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Event_0er1rer() {
end_Event_0er1rer:
  atomic {
    Flow_0msbshj?1;
    Event_0er1rer = 1;
  }
}


proctype Node_Gateway_19m1xkh() {
  parallel_gateway_Gateway_19m1xkh:
    atomic {
      do
      :: nempty(Flow_18hry6m) ->
        Flow_18hry6m?1;
        Flow_0k243p1!1;
        assert(len(Flow_0k243p1) < 2);
        Flow_1q12yo1!1;
        assert(len(Flow_1q12yo1) < 2);
      :: timeout -> break;
      od;
    }
}


proctype Node_Gateway_0r75bcf() {
  exclusive_gateway_Gateway_0r75bcf:
  atomic {
    do
    :: Flow_1q12yo1?1 ->
       Flow_19hhf86!1;
       assert(len(Flow_19hhf86) < 2);
    :: Flow_1lrtpjz?1 ->
       Flow_19hhf86!1;
       assert(len(Flow_19hhf86) < 2);
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_0gsruuk() {
  task_Activity_0gsruuk:
  atomic {
    do
    :: Flow_19hhf86?1 ->
       Flow_1lrtpjz!1;
    :: timeout -> break;
    od;
  }
}


init {
  atomic {
    run Node_Activity_1k9hlq7();
    run Node_Event_0er1rer();
    run Node_Gateway_19m1xkh();
    run Node_Gateway_0r75bcf();
    run Node_Activity_0gsruuk();
    run Node_FlowNode_1();
  }
}
