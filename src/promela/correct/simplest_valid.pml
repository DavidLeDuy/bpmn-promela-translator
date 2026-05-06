bool Event_1ukl08a;
ltl test { <> ((Event_1ukl08a) && (len(Flow_0dk7ot5) == 0 && len(Flow_0pm0tcb) == 0))}
chan Flow_0dk7ot5 = [2] of { bit };
chan Flow_0pm0tcb = [2] of { bit };

proctype Node_StartEvent_0m6sfia() {
  start_StartEvent_0m6sfia:
  atomic {
    Flow_0dk7ot5!1;
  }
}


proctype Node_Activity_0tivrv8() {
  task_Activity_0tivrv8:
  atomic {
    do
    :: Flow_0dk7ot5?1 ->
       Flow_0pm0tcb!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Event_1ukl08a() {
end_Event_1ukl08a:
  atomic {
    Flow_0pm0tcb?1;
    Event_1ukl08a = 1;
  }
}


init {
  atomic {
    run Node_Activity_0tivrv8();
    run Node_Event_1ukl08a();
    run Node_StartEvent_0m6sfia();
  }
}
