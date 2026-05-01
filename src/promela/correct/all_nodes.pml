bool e2, me1;
ltl reach_all_end_events { <> (e2 && me1)};
ltl no_token_left_behind { [] ((e2 && me1) -> (len(Flow_1k1shj7) == 0 && len(Flow_1p85p97) == 0 && len(f1) == 0 && len(f2) == 0 && len(f4) == 0 && len(f5) == 0 && len(f6) == 0 && len(f7) == 0 && len(f8) == 0 && len(f9) == 0 && len(f10) == 0 && len(f11) == 0 && len(f12) == 0 && len(f13) == 0 && len(f14) == 0 && len(f15) == 0 && len(f16) == 0 && len(f17) == 0 && len(f18) == 0 && len(f19) == 0 && len(f20) == 0 && len(f22) == 0 && len(f26) == 0 && len(f27) == 0 && len(Flow_02odx4p) == 0 && len(Flow_0lmjyde) == 0 && len(Flow_0o35r59) == 0 && len(Flow_0y6lfb8) == 0 && len(Flow_0gpaogy) == 0))}
ltl test { <> ((e2 || me1) && (len(Flow_1k1shj7) == 0 && len(Flow_1p85p97) == 0 && len(f1) == 0 && len(f2) == 0 && len(f4) == 0 && len(f5) == 0 && len(f6) == 0 && len(f7) == 0 && len(f8) == 0 && len(f9) == 0 && len(f10) == 0 && len(f11) == 0 && len(f12) == 0 && len(f13) == 0 && len(f14) == 0 && len(f15) == 0 && len(f16) == 0 && len(f17) == 0 && len(f18) == 0 && len(f19) == 0 && len(f20) == 0 && len(f22) == 0 && len(f26) == 0 && len(f27) == 0 && len(Flow_02odx4p) == 0 && len(Flow_0lmjyde) == 0 && len(Flow_0o35r59) == 0 && len(Flow_0y6lfb8) == 0 && len(Flow_0gpaogy) == 0))}
chan Flow_1k1shj7 = [2] of { bit };
chan Flow_1p85p97 = [2] of { bit };
chan f1 = [2] of { bit };
chan f2 = [2] of { bit };
chan f4 = [2] of { bit };
chan f5 = [2] of { bit };
chan f6 = [2] of { bit };
chan f7 = [2] of { bit };
chan f8 = [2] of { bit };
chan f9 = [2] of { bit };
chan f10 = [2] of { bit };
chan f11 = [2] of { bit };
chan f12 = [2] of { bit };
chan f13 = [2] of { bit };
chan f14 = [2] of { bit };
chan f15 = [2] of { bit };
chan f16 = [2] of { bit };
chan f17 = [2] of { bit };
chan f18 = [2] of { bit };
chan f19 = [2] of { bit };
chan f20 = [2] of { bit };
chan f22 = [2] of { bit };
chan f26 = [2] of { bit };
chan f27 = [2] of { bit };
chan Flow_02odx4p = [2] of { bit };
chan Flow_0lmjyde = [2] of { bit };
chan Flow_0o35r59 = [2] of { bit };
chan Flow_0y6lfb8 = [2] of { bit };
chan Flow_0gpaogy = [2] of { bit };

proctype Node_t1() {
  task_t1:
  atomic {
    do
    :: f1?1 ->
       Flow_1k1shj7!1;
       f2!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_gx1() {
  exclusive_gateway_gx1:
  atomic {
    do
    :: f2?1 ->
        if
        :: f4!1;
        :: f5!1;
        fi;
    :: timeout -> break;
    od;
  }
}


proctype Node_t3() {
  task_t3:
  atomic {
    do
    :: f4?1 ->
       f6!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_t4() {
  task_t4:
  atomic {
    do
    :: f5?1 ->
       f7!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_gx2() {
  exclusive_gateway_gx2:
  atomic {
    do
    :: f6?1 ->
       f8!1;
       assert(len(f8) < 2);
    :: f7?1 ->
       f8!1;
       assert(len(f8) < 2);
    :: timeout -> break;
    od;
  }
}


proctype Node_gp1() {
  parallel_gateway_gp1:
    atomic {
      do
      :: nempty(f8) ->
        f8?1;
        f9!1;
        assert(len(f9) < 2);
        f10!1;
        assert(len(f10) < 2);
      :: timeout -> break;
      od;
    }
}


proctype Node_t5() {
  task_t5:
  atomic {
    do
    :: f9?1 ->
       f11!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_t6() {
  task_t6:
  atomic {
    do
    :: f10?1 ->
       f12!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_gp2() {
  parallel_gateway_gp2:
    atomic {
      do
      :: nempty(f11) && nempty(f12) ->
        f11?1;
        f12?1;
        f13!1;
      :: timeout -> break;
      od;
    }
}


proctype Node_t7() {
  task_t7:
  atomic {
    do
    :: f14?1 ->
       f16!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_t8() {
  task_t8:
  atomic {
    do
    :: f15?1 ->
       f17!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_ice1() {
  catch_ice1:
  atomic {
    do
      :: nempty(f18) ->
       f18?1;
       f19!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_ite1() {
  throw_ite1:
  atomic {
  do
    :: f19?1 ->
       f20!1;
    :: timeout -> break;
  od;
  }
}


proctype Node_t9() {
  task_t9:
  atomic {
    do
    :: f20?1 ->
       Flow_1p85p97!1;
       f22!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_e2() {
end_e2:
  atomic {
    f22?1;
    e2 = 1;
  }
}


proctype Node_go1() {
  exclusive_gateway_go1:
  atomic {
    do
    :: f13?1 ->
        if
        :: f14!1;
        :: f15!1;
        fi;
    :: timeout -> break;
    od;
  }
}


proctype Node_go2() {
  exclusive_gateway_go2:
  atomic {
    do
    :: f16?1 ->
       f18!1;
       assert(len(f18) < 2);
    :: f17?1 ->
       f18!1;
       assert(len(f18) < 2);
    :: timeout -> break;
    od;
  }
}


proctype Node_e1() {
  start_e1:
  atomic {
    f1!1;
  }
}


proctype Node_mt1() {
  throw_mt1:
  atomic {
  do
    :: f26?1 ->
       f27!1;
    :: timeout -> break;
  od;
  }
}


proctype Node_me1() {
end_me1:
  atomic {
    f27?1;
    me1 = 1;
  }
}


proctype Node_t10() {
  task_t10:
  atomic {
    do
    :: Flow_02odx4p?1 ->
       f26!1;
    :: timeout -> break;
    od;
  }
}


proctype Node_ms1() {
  start_ms1:
  atomic {
    Flow_1k1shj7?1;
    Flow_0lmjyde!1;
  }
}


proctype Node_Gateway_12y4zbw() {
  parallel_gateway_Gateway_12y4zbw:
    atomic {
      do
      :: nempty(Flow_0o35r59) && nempty(Flow_0gpaogy) ->
        Flow_0o35r59?1;
        Flow_0gpaogy?1;
        Flow_02odx4p!1;
      :: timeout -> break;
      od;
    }
}


proctype Node_Gateway_1wt7e0d() {
  parallel_gateway_Gateway_1wt7e0d:
    atomic {
      do
      :: nempty(Flow_0lmjyde) ->
        Flow_0lmjyde?1;
        Flow_0o35r59!1;
        assert(len(Flow_0o35r59) < 2);
        Flow_0y6lfb8!1;
        assert(len(Flow_0y6lfb8) < 2);
      :: timeout -> break;
      od;
    }
}


proctype Node_Event_14r87pq() {
  catch_Event_14r87pq:
  atomic {
    do
      :: nempty(Flow_0y6lfb8) && nempty(Flow_1p85p97) ->
       Flow_0y6lfb8?1;
       Flow_1p85p97?1;
       Flow_0gpaogy!1;
    :: timeout -> break;
    od;
  }
}


init {
  atomic {
    run Node_t1();
    run Node_gx1();
    run Node_t3();
    run Node_t4();
    run Node_gx2();
    run Node_gp1();
    run Node_t5();
    run Node_t6();
    run Node_gp2();
    run Node_t7();
    run Node_t8();
    run Node_ice1();
    run Node_ite1();
    run Node_t9();
    run Node_e2();
    run Node_go1();
    run Node_go2();
    run Node_mt1();
    run Node_me1();
    run Node_t10();
    run Node_Gateway_12y4zbw();
    run Node_Gateway_1wt7e0d();
    run Node_Event_14r87pq();
    run Node_e1();
    run Node_ms1();
  }
}
