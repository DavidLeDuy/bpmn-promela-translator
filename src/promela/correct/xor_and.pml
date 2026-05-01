bool e2;
ltl reach_all_end_events { <> (e2)};
ltl no_token_left_behind { [] ((e2) -> (len(Flow_12ha33e) == 0 && len(_061F9FD1_EA93_49B2_9598_3AE067EDF500) == 0 && len(Flow_1y5t056) == 0 && len(_65E3D146_9292_4915_B70D_1867E439D5BB) == 0 && len(Flow_1ryjv5k) == 0 && len(Flow_12zh6se) == 0 && len(Flow_0irq30q) == 0 && len(Flow_1j5a3cl) == 0 && len(Flow_0y02zda) == 0 && len(Flow_0mwclbe) == 0 && len(Flow_1f0cfmi) == 0))}
ltl test { <> ((e2) && (len(Flow_12ha33e) == 0 && len(_061F9FD1_EA93_49B2_9598_3AE067EDF500) == 0 && len(Flow_1y5t056) == 0 && len(_65E3D146_9292_4915_B70D_1867E439D5BB) == 0 && len(Flow_1ryjv5k) == 0 && len(Flow_12zh6se) == 0 && len(Flow_0irq30q) == 0 && len(Flow_1j5a3cl) == 0 && len(Flow_0y02zda) == 0 && len(Flow_0mwclbe) == 0 && len(Flow_1f0cfmi) == 0))}
chan Flow_12ha33e = [2] of { bit };
chan _061F9FD1_EA93_49B2_9598_3AE067EDF500 = [2] of { bit };
chan Flow_1y5t056 = [2] of { bit };
chan _65E3D146_9292_4915_B70D_1867E439D5BB = [2] of { bit };
chan Flow_1ryjv5k = [2] of { bit };
chan Flow_12zh6se = [2] of { bit };
chan Flow_0irq30q = [2] of { bit };
chan Flow_1j5a3cl = [2] of { bit };
chan Flow_0y02zda = [2] of { bit };
chan Flow_0mwclbe = [2] of { bit };
chan Flow_1f0cfmi = [2] of { bit };

proctype Node_e1() {
  start_e1:
  atomic {
    Flow_12ha33e!1;
  }
}


proctype Node_e2() {
end_e2:
  atomic {
    Flow_1f0cfmi?1;
    e2 = 1;
  }
}


proctype Node_Activity_0hgxxro() {
  task_Activity_0hgxxro:
  atomic {
    do
    :: Flow_1y5t056?1 ->
       _061F9FD1_EA93_49B2_9598_3AE067EDF500!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_19aoqgd() {
  task_Activity_19aoqgd:
  atomic {
    do
    :: Flow_1ryjv5k?1 ->
       _65E3D146_9292_4915_B70D_1867E439D5BB!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Gateway_16lz908() {
  exclusive_gateway_Gateway_16lz908:
  atomic {
    do
    :: Flow_12ha33e?1 ->
        if
        :: Flow_1y5t056!1;
        :: Flow_1ryjv5k!1;
        fi;
    :: timeout -> break;
    od;
  }
}


proctype Node__3E888BD8_C2F4_4DB1_BB60_9085D090ECA6() {
  exclusive_gateway__3E888BD8_C2F4_4DB1_BB60_9085D090ECA6:
  atomic {
    do
    :: _061F9FD1_EA93_49B2_9598_3AE067EDF500?1 ->
       Flow_0mwclbe!1;
       assert(len(Flow_0mwclbe) < 2);
    :: _65E3D146_9292_4915_B70D_1867E439D5BB?1 ->
       Flow_0mwclbe!1;
       assert(len(Flow_0mwclbe) < 2);
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_07o232y() {
  task_Activity_07o232y:
  atomic {
    do
    :: Flow_0irq30q?1 ->
       Flow_1j5a3cl!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Activity_11e1f24() {
  task_Activity_11e1f24:
  atomic {
    do
    :: Flow_12zh6se?1 ->
       Flow_0y02zda!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_Gateway_0vxjijz() {
  parallel_gateway_Gateway_0vxjijz:
    atomic {
      do
      :: nempty(Flow_0mwclbe) ->
        Flow_0mwclbe?1;
        Flow_12zh6se!1;
        assert(len(Flow_12zh6se) < 2);
        Flow_0irq30q!1;
        assert(len(Flow_0irq30q) < 2);
      :: timeout -> break;
      od;
    }
}


proctype Node_Gateway_1tnd8k0() {
  parallel_gateway_Gateway_1tnd8k0:
    atomic {
      do
      :: nempty(Flow_1j5a3cl) && nempty(Flow_0y02zda) ->
        Flow_1j5a3cl?1;
        Flow_0y02zda?1;
        Flow_1f0cfmi!1;
      :: timeout -> break;
      od;
    }
}


init {
  atomic {
    run Node_e2();
    run Node_Activity_0hgxxro();
    run Node_Activity_19aoqgd();
    run Node_Gateway_16lz908();
    run Node__3E888BD8_C2F4_4DB1_BB60_9085D090ECA6();
    run Node_Activity_07o232y();
    run Node_Activity_11e1f24();
    run Node_Gateway_0vxjijz();
    run Node_Gateway_1tnd8k0();
    run Node_e1();
  }
}
