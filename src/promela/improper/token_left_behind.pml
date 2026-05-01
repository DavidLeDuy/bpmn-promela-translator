bool Event_0omf2ig;
ltl reach_all_end_events { <> (Event_0omf2ig)};
ltl no_token_left_behind { [] ((Event_0omf2ig) -> (len(Flow_0651tg3) == 0 && len(Flow_0h66a89) == 0 && len(Flow_1hwufg1) == 0 && len(Flow_1sm036u) == 0 && len(Flow_0nl7dp7) == 0 && len(Flow_1bd97xv) == 0 && len(Flow_1ke0qs4) == 0 && len(Flow_1xc8t18) == 0 && len(Flow_1g656d8) == 0 && len(Flow_0u72ccs) == 0 && len(Flow_0xy1ton) == 0 && len(Flow_1yk0wy5) == 0))}
ltl test { <> ((Event_0omf2ig) && (len(Flow_0651tg3) == 0 && len(Flow_0h66a89) == 0 && len(Flow_1hwufg1) == 0 && len(Flow_1sm036u) == 0 && len(Flow_0nl7dp7) == 0 && len(Flow_1bd97xv) == 0 && len(Flow_1ke0qs4) == 0 && len(Flow_1xc8t18) == 0 && len(Flow_1g656d8) == 0 && len(Flow_0u72ccs) == 0 && len(Flow_0xy1ton) == 0 && len(Flow_1yk0wy5) == 0))}
chan Flow_0651tg3 = [2] of { bit };
chan Flow_0h66a89 = [2] of { bit };
chan Flow_1hwufg1 = [2] of { bit };
chan Flow_1sm036u = [2] of { bit };
chan Flow_0nl7dp7 = [2] of { bit };
chan Flow_1bd97xv = [2] of { bit };
chan Flow_1ke0qs4 = [2] of { bit };
chan Flow_1xc8t18 = [2] of { bit };
chan Flow_1g656d8 = [2] of { bit };
chan Flow_0u72ccs = [2] of { bit };
chan Flow_0xy1ton = [2] of { bit };
chan Flow_1yk0wy5 = [2] of { bit };

proctype Node_FlowNode_1() {
  start_FlowNode_1:
  atomic {
    Flow_0651tg3!1;
  }
}


proctype Node_Activity_0x4hd7x() {
  task_Activity_0x4hd7x:
  atomic {
    do
    :: Flow_0651tg3?1 ->
       Flow_0u72ccs!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_0j1wpr5() {
  task_Activity_0j1wpr5:
  atomic {
    do
    :: Flow_0xy1ton?1 ->
       Flow_0h66a89!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Event_0omf2ig() {
end_Event_0omf2ig:
  atomic {
    Flow_1hwufg1?1;
    Event_0omf2ig = 1;
  }
}


proctype Node_Activity_04cg2zp() {
  task_Activity_04cg2zp:
  atomic {
    do
    :: Flow_1yk0wy5?1 ->
       Flow_1sm036u!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Gateway_0kzt77d() {
  exclusive_gateway_Gateway_0kzt77d:
  atomic {
    do
    :: Flow_0h66a89?1 ->
       Flow_1hwufg1!1;
       assert(len(Flow_1hwufg1) < 2);
    :: Flow_1g656d8?1 ->
       Flow_1hwufg1!1;
       assert(len(Flow_1hwufg1) < 2);
    :: timeout -> break;
    od;
  }
}


proctype Node_Gateway_1kzg4y7() {
  exclusive_gateway_Gateway_1kzg4y7:
  atomic {
    do
    :: Flow_1sm036u?1 ->
        if
        :: Flow_0nl7dp7!1;
        :: Flow_1bd97xv!1;
        fi;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_0nyl2gj() {
  task_Activity_0nyl2gj:
  atomic {
    do
    :: Flow_0nl7dp7?1 ->
       Flow_1ke0qs4!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_0nblycj() {
  task_Activity_0nblycj:
  atomic {
    do
    :: Flow_1bd97xv?1 ->
       Flow_1xc8t18!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Gateway_0ul0g5u() {
  parallel_gateway_Gateway_0ul0g5u:
    atomic {
      do
      :: nempty(Flow_0u72ccs) ->
        Flow_0u72ccs?1;
        Flow_0xy1ton!1;
        assert(len(Flow_0xy1ton) < 2);
        Flow_1yk0wy5!1;
        assert(len(Flow_1yk0wy5) < 2);
      :: timeout -> break;
      od;
    }
}


proctype Node_Gateway_1rmiu42() {
  parallel_gateway_Gateway_1rmiu42:
    atomic {
      do
      :: nempty(Flow_1ke0qs4) && nempty(Flow_1xc8t18) ->
        Flow_1ke0qs4?1;
        Flow_1xc8t18?1;
        Flow_1g656d8!1;
      :: timeout -> break;
      od;
    }
}


init {
  atomic {
    run Node_Activity_0x4hd7x();
    run Node_Activity_0j1wpr5();
    run Node_Event_0omf2ig();
    run Node_Activity_04cg2zp();
    run Node_Gateway_0kzt77d();
    run Node_Gateway_1kzg4y7();
    run Node_Activity_0nyl2gj();
    run Node_Activity_0nblycj();
    run Node_Gateway_0ul0g5u();
    run Node_Gateway_1rmiu42();
    run Node_FlowNode_1();
  }
}
