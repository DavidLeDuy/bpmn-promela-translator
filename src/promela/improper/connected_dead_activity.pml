bool Event_1uushxv;
ltl test { <> ((Event_1uushxv) && (len(Flow_0ckbmbp) == 0 && len(Flow_1w30amw) == 0 && len(Flow_0hey1xg) == 0 && len(Flow_0hzzaf9) == 0 && len(_9A7BA64F_2F2E_410B_BD98_6FFA48F943DA) == 0 && len(Flow_14p4q5r) == 0 && len(Flow_1byutdj) == 0 && len(Flow_09nopbi) == 0))}
chan Flow_0ckbmbp = [2] of { bit };
chan Flow_1w30amw = [2] of { bit };
chan Flow_0hey1xg = [2] of { bit };
chan Flow_0hzzaf9 = [2] of { bit };
chan _9A7BA64F_2F2E_410B_BD98_6FFA48F943DA = [2] of { bit };
chan Flow_14p4q5r = [2] of { bit };
chan Flow_1byutdj = [2] of { bit };
chan Flow_09nopbi = [2] of { bit };

proctype Node_FlowNode_1() {
  start_FlowNode_1:
  atomic {
    Flow_0ckbmbp!1;
  }
}


proctype Node_Activity_0ke9inj() {
  task_Activity_0ke9inj:
  atomic {
    do
    :: Flow_0ckbmbp?1 ->
       Flow_1w30amw!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Gateway_0dcifmn() {
  exclusive_gateway_Gateway_0dcifmn:
  atomic {
    do
    :: Flow_1w30amw?1 ->
       Flow_0hey1xg!1;
       assert(len(Flow_0hey1xg) < 2);
    :: Flow_0hzzaf9?1 ->
       Flow_0hey1xg!1;
       assert(len(Flow_0hey1xg) < 2);
    :: timeout -> break;
    od;
  }
}


proctype Node_Event_1uushxv() {
end_Event_1uushxv:
  atomic {
    Flow_0hey1xg?1;
    Event_1uushxv = 1;
  }
}


proctype Node_Gateway_0exjytb() {
  exclusive_gateway_Gateway_0exjytb:
  atomic {
    do
    :: _9A7BA64F_2F2E_410B_BD98_6FFA48F943DA?1 ->
        if
        :: Flow_0hzzaf9!1;
        :: Flow_09nopbi!1;
        fi;
    :: Flow_14p4q5r?1 ->
        if
        :: Flow_0hzzaf9!1;
        :: Flow_09nopbi!1;
        fi;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_03czb35() {
  task_Activity_03czb35:
  atomic {
    do
    :: Flow_1byutdj?1 ->
       _9A7BA64F_2F2E_410B_BD98_6FFA48F943DA!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_0llc9ag() {
  task_Activity_0llc9ag:
  atomic {
    do
    :: Flow_09nopbi?1 ->
       Flow_1byutdj!1;
    :: timeout -> break;
    od;
  }
}


init {
  atomic {
    run Node_Activity_0ke9inj();
    run Node_Gateway_0dcifmn();
    run Node_Event_1uushxv();
    run Node_Gateway_0exjytb();
    run Node_Activity_03czb35();
    run Node_Activity_0llc9ag();
    run Node_FlowNode_1();
  }
}
