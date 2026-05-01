bool e2;
ltl reach_all_end_events { <> (e2)};
ltl no_token_left_behind { [] ((e2) -> (len(Flow_12ha33e) == 0 && len(_0F838EC2_2DBD_4A87_BDDC_83870BE62BCA) == 0 && len(_061F9FD1_EA93_49B2_9598_3AE067EDF500) == 0 && len(Flow_1y5t056) == 0 && len(_65E3D146_9292_4915_B70D_1867E439D5BB) == 0 && len(Flow_1ryjv5k) == 0))}
ltl test { <> ((e2) && (len(Flow_12ha33e) == 0 && len(_0F838EC2_2DBD_4A87_BDDC_83870BE62BCA) == 0 && len(_061F9FD1_EA93_49B2_9598_3AE067EDF500) == 0 && len(Flow_1y5t056) == 0 && len(_65E3D146_9292_4915_B70D_1867E439D5BB) == 0 && len(Flow_1ryjv5k) == 0))}
chan Flow_12ha33e = [2] of { bit };
chan _0F838EC2_2DBD_4A87_BDDC_83870BE62BCA = [2] of { bit };
chan _061F9FD1_EA93_49B2_9598_3AE067EDF500 = [2] of { bit };
chan Flow_1y5t056 = [2] of { bit };
chan _65E3D146_9292_4915_B70D_1867E439D5BB = [2] of { bit };
chan Flow_1ryjv5k = [2] of { bit };

proctype Node_e1() {
  start_e1:
  atomic {
    Flow_12ha33e!1;
  }
}


proctype Node_e2() {
end_e2:
  atomic {
    _0F838EC2_2DBD_4A87_BDDC_83870BE62BCA?1;
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
       _0F838EC2_2DBD_4A87_BDDC_83870BE62BCA!1;
       assert(len(_0F838EC2_2DBD_4A87_BDDC_83870BE62BCA) < 2);
    :: _65E3D146_9292_4915_B70D_1867E439D5BB?1 ->
       _0F838EC2_2DBD_4A87_BDDC_83870BE62BCA!1;
       assert(len(_0F838EC2_2DBD_4A87_BDDC_83870BE62BCA) < 2);
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
    run Node_e1();
  }
}
