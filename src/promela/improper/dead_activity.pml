bool Event_142iq0a;
ltl reach_all_end_events { <> (Event_142iq0a)};
ltl no_token_left_behind { [] ((Event_142iq0a) -> (len(Flow_0n9vknp) == 0 && len(Flow_04ju504) == 0 && len(Flow_17gwp5i) == 0 && len(Flow_1sj90jw) == 0 && len(Flow_1iru2dn) == 0))}
ltl test { <> ((Event_142iq0a) && (len(Flow_0n9vknp) == 0 && len(Flow_04ju504) == 0 && len(Flow_17gwp5i) == 0 && len(Flow_1sj90jw) == 0 && len(Flow_1iru2dn) == 0))}
chan Flow_0n9vknp = [2] of { bit };
chan Flow_04ju504 = [2] of { bit };
chan Flow_17gwp5i = [2] of { bit };
chan Flow_1sj90jw = [2] of { bit };
chan Flow_1iru2dn = [2] of { bit };

proctype Node_Event_0vaqaf3() {
  start_Event_0vaqaf3:
  atomic {
    Flow_0n9vknp!1;
  }
}


proctype Node_Gateway_0jozlxk() {
  exclusive_gateway_Gateway_0jozlxk:
  atomic {
    do
    :: Flow_0n9vknp?1 ->
       Flow_04ju504!1;
       assert(len(Flow_04ju504) < 2);
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_0v4txpp() {
  task_Activity_0v4txpp:
  atomic {
    do
    :: Flow_04ju504?1 ->
       Flow_17gwp5i!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Gateway_1ygqqy0() {
  exclusive_gateway_Gateway_1ygqqy0:
  atomic {
    do
    :: Flow_17gwp5i?1 ->
       Flow_1sj90jw!1;
       assert(len(Flow_1sj90jw) < 2);
    :: Flow_1iru2dn?1 ->
       Flow_1sj90jw!1;
       assert(len(Flow_1sj90jw) < 2);
    :: timeout -> break;
    od;
  }
}


proctype Node_Event_142iq0a() {
end_Event_142iq0a:
  atomic {
    Flow_1sj90jw?1;
    Event_142iq0a = 1;
  }
}


proctype Node_Activity_0ahojhq() {
  task_Activity_0ahojhq:
  atomic {
    do
       Flow_1iru2dn!1;
    :: timeout -> break;
    od;
  }
}


init {
  atomic {
    run Node_Gateway_0jozlxk();
    run Node_Activity_0v4txpp();
    run Node_Gateway_1ygqqy0();
    run Node_Event_142iq0a();
    run Node_Activity_0ahojhq();
    run Node_Event_0vaqaf3();
  }
}
