(set-info :status unsat)
(declare-fun invariant_7_n () Real)
(declare-fun invariant_8_0 () Real)
(declare-fun invariant_9_0 () Real)
(declare-fun invariant_12_0 () Bool)
(declare-fun invariant_12_n () Bool)
(declare-fun invariant_5_0 () Real)
(declare-fun invariant_5_n () Real)
(declare-fun invariant_2_0 () Real)
(declare-fun invariant_2_n () Real)
(declare-fun invariant_0_0 () Real)
(declare-fun invariant_0_n () Real)
(declare-fun invariant_8_n () Real)
(declare-fun invariant_3_0 () Bool)
(declare-fun invariant_3_n () Bool)
(declare-fun invariant_6_0 () Real)
(declare-fun invariant_6_n () Real)
(declare-fun invariant_9_n () Real)
(declare-fun invariant_11_0 () Real)
(declare-fun invariant_11_n () Real)
(declare-fun invariant_13_0 () Real)
(declare-fun invariant_13_n () Real)
(declare-fun invariant_1_0 () Bool)
(declare-fun invariant_1_n () Bool)
(declare-fun invariant_10_0 () Real)
(declare-fun invariant_10_n () Real)
(declare-fun invariant_7_0 () Real)
(declare-fun invariant_4_0 () Real)
(declare-fun invariant_4_n () Real)
(declare-fun |vsolver#1| () Bool)
(declare-fun invariant__tr1 () Bool)
(declare-fun invariant__tr0 () Bool)
(declare-fun |invariant#level_0!2| () Bool)
(declare-fun |invariant#reach_tag_0_0| () Bool)
(declare-fun spacer_proxy!0 () Bool)
(declare-fun spacer_proxy!1 () Bool)
(declare-fun |invariant#level_1!5| () Bool)
(declare-fun spacer_proxy!2 () Bool)
(declare-fun spacer_proxy!3 () Bool)
(declare-fun spacer_proxy!4 () Bool)
(declare-fun spacer_proxy!5 () Bool)
(declare-fun spacer_proxy!6 () Bool)
(declare-fun spacer_proxy!7 () Bool)
(declare-fun spacer_proxy!8 () Bool)
(declare-fun spacer_proxy!9 () Bool)
(declare-fun spacer_proxy!10 () Bool)
(declare-fun spacer_proxy!11 () Bool)
(declare-fun spacer_proxy!12 () Bool)
(declare-fun spacer_proxy!13 () Bool)
(declare-fun spacer_proxy!14 () Bool)
(declare-fun spacer_proxy!15 () Bool)
(declare-fun spacer_proxy!16 () Bool)
(declare-fun spacer_proxy!17 () Bool)
(declare-fun invariant_ext0_n () Bool)
(declare-fun |invariant#level_2!6| () Bool)
(declare-fun |invariant#level_3!8| () Bool)
(declare-fun |invariant#level_4!10| () Bool)
(assert (let ((a!1 (not (or invariant_1_0
                    (not invariant_12_0)
                    (not (= invariant_4_0 1.0))
                    (not (= invariant_10_0 (- 1.0))))))
      (a!3 (not (or invariant_1_0
                    invariant_12_n
                    (not invariant_1_n)
                    (not invariant_12_0)
                    (not (= invariant_4_0 1.0))
                    (not (= invariant_10_0 (- 1.0)))
                    (not (= invariant_10_n invariant_7_0)))))
      (a!4 (not (or (not invariant_3_0)
                    (not (= invariant_0_n 0.0))
                    (not (= invariant_2_n 0.0))
                    (not (= invariant_5_0 1.0))
                    (not (= invariant_5_n 2.0)))))
      (a!5 (not (or (= invariant_4_0 1.0)
                    (not (= invariant_5_0 0.0))
                    (not (= invariant_0_n 0.0))
                    (not (= invariant_2_n 0.0))
                    (not (= invariant_5_n 0.0)))))
      (a!6 (not (or (not (= invariant_0_n 0.0))
                    (not (= invariant_2_n 1.0))
                    (not (= invariant_4_0 1.0))
                    (not (= invariant_5_0 0.0))
                    (not (= invariant_5_n 1.0)))))
      (a!7 (not (or (not (= invariant_0_n 0.0))
                    (not (= invariant_2_n 2.0))
                    (not (= invariant_4_0 2.0))
                    (not (= invariant_5_0 2.0))
                    (not (= invariant_5_n 0.0)))))
      (a!8 (not (or (= invariant_4_0 2.0)
                    (not (= invariant_0_n 0.0))
                    (not (= invariant_2_n 0.0))
                    (not (= invariant_5_n 2.0))
                    (not (= invariant_5_0 2.0)))))
      (a!9 (not (= (+ invariant_0_0 (* (- 1.0) invariant_0_n)) (- 1.0))))
      (a!11 (not (or invariant_3_0
                     (not (>= invariant_0_0 1.0))
                     (not (= invariant_0_n 0.0))
                     (not (= invariant_5_0 1.0))
                     (not (= invariant_5_n 0.0))
                     (not (= invariant_2_n 2.0)))))
      (a!12 (not (>= (+ invariant_7_0 (* (- 1.0) invariant_8_n)) (- 20.0))))
      (a!13 (not (<= (+ invariant_7_0 (* (- 1.0) invariant_8_n)) (- 20.0))))
      (a!15 (not (or (not invariant_1_0)
                     (<= invariant_13_0 0.0)
                     (not (= invariant_11_0 (- 1.0))))))
      (a!17 (not (or (not invariant_1_0)
                     (<= invariant_13_0 0.0)
                     (not (= invariant_11_0 (- 1.0)))
                     (not (= invariant_11_n invariant_7_0)))))
      (a!18 (not (or invariant_3_n
                     (= invariant_2_0 1.0)
                     (not (= invariant_6_0 0.0))
                     (not (= invariant_13_n 0.0))
                     (not (= invariant_6_n 0.0)))))
      (a!19 (not (or invariant_3_n
                     (not (= invariant_2_0 2.0))
                     (not (= invariant_13_n 0.0))
                     (not (= invariant_6_n 0.0))
                     (not (= invariant_6_0 1.0)))))
      (a!20 (not (or (not invariant_3_n)
                     (not (= invariant_2_0 1.0))
                     (<= invariant_13_n 0.0)
                     (not (= invariant_6_0 0.0))
                     (>= invariant_13_n 5.0)
                     (not (= invariant_6_n 1.0)))))
      (a!21 (not (or (not invariant_3_n)
                     (= invariant_2_0 2.0)
                     (<= invariant_13_n 0.0)
                     (>= invariant_13_n 5.0)
                     (not (= invariant_6_0 1.0))
                     (not (= invariant_6_n 1.0)))))
      (a!22 (not (>= (+ invariant_7_0 (* (- 1.0) invariant_9_n)) (- 20.0))))
      (a!23 (not (<= (+ invariant_7_0 (* (- 1.0) invariant_9_n)) (- 20.0))))
      (a!26 (not (>= (+ invariant_9_0 (* (- 1.0) invariant_7_n)) 0.0)))
      (a!27 (not (>= (+ invariant_8_0 (* (- 1.0) invariant_7_n)) 0.0))))
(let ((a!2 (not (or (not (= invariant_10_n invariant_10_0))
                    a!1
                    (= (not invariant_1_n) invariant_1_0))))
      (a!10 (not (or invariant_3_0
                     (>= invariant_0_0 1.0)
                     (not (= invariant_5_0 1.0))
                     (not (= invariant_2_n 1.0))
                     (not (= invariant_5_n 1.0))
                     a!9)))
      (a!16 (not (or (not (= invariant_11_n invariant_11_0)) a!15)))
      (a!28 (or (>= (+ invariant_7_0 (* (- 1.0) invariant_9_0)) 0.0)
                (>= (+ invariant_7_0 (* (- 1.0) invariant_8_0)) 0.0)
                (not (= invariant_10_n invariant_10_0))
                (= (not invariant_1_n) invariant_1_0)
                (not (= invariant_13_n invariant_13_0))
                (not (= invariant_11_n invariant_11_0))
                (not (= invariant_9_n invariant_9_0))
                (not (= invariant_6_n invariant_6_0))
                (= (not invariant_3_n) invariant_3_0)
                (not (= invariant_8_n invariant_8_0))
                (not (= invariant_0_n invariant_0_0))
                (not (= invariant_2_n invariant_2_0))
                (not (= invariant_5_n invariant_5_0))
                (= (not invariant_12_n) invariant_12_0)
                (not (or (= invariant_7_n invariant_9_0)
                         (= invariant_7_n invariant_8_0)))
                a!26
                a!27)))
(let ((a!14 (not (or (not (or a!2 a!3))
                     (not (or a!4 a!5 a!6 a!7 a!8 a!10 a!11))
                     a!12
                     a!13
                     (not (= invariant_13_n invariant_13_0))
                     (not (= invariant_11_n invariant_11_0))
                     (not (= invariant_9_n invariant_9_0))
                     (not (= invariant_7_0 invariant_8_0))
                     (not (= invariant_6_n invariant_6_0))
                     (= (not invariant_3_n) invariant_3_0))))
      (a!24 (not (or (not (= invariant_10_n invariant_10_0))
                     (= (not invariant_1_n) invariant_1_0)
                     (not (or a!16 a!17))
                     (not (or a!18 a!19 a!20 a!21))
                     a!22
                     a!23
                     (not (= invariant_8_n invariant_8_0))
                     (not (= invariant_7_0 invariant_9_0))
                     (not (= invariant_0_n invariant_0_0))
                     (not (= invariant_2_n invariant_2_0))
                     (not (= invariant_5_n invariant_5_0))
                     (= (not invariant_12_n) invariant_12_0)))))
(let ((a!25 (not (or (not (or a!14 a!24)) (not (= invariant_7_n invariant_7_0))))))
(let ((a!29 (or (not (or (= invariant_4_0 0.0)
                         (= invariant_4_0 1.0)
                         (= invariant_4_0 2.0)))
                (not (or (= invariant_5_n 0.0)
                         (= invariant_5_n 1.0)
                         (= invariant_5_n 2.0)))
                (not (or (= invariant_5_0 0.0)
                         (= invariant_5_0 1.0)
                         (= invariant_5_0 2.0)))
                (not (or (= invariant_4_n 0.0)
                         (= invariant_4_n 1.0)
                         (= invariant_4_n 2.0)))
                (not (or (= invariant_2_n 0.0)
                         (= invariant_2_n 1.0)
                         (= invariant_2_n 2.0)))
                (not (or (= invariant_2_0 0.0)
                         (= invariant_2_0 1.0)
                         (= invariant_2_0 2.0)))
                (not (or (= invariant_6_0 0.0) (= invariant_6_0 1.0)))
                (not (or (= invariant_6_n 0.0) (= invariant_6_n 1.0)))
                (not (or a!25 (not a!28))))))
  (or (not invariant__tr1) (not |vsolver#1|) (not a!29))))))))
(assert (let ((a!1 (or invariant_1_n
               invariant_3_n
               (>= invariant_8_n 20.0)
               (>= invariant_9_n 20.0)
               (not (= invariant_0_n 0.0))
               (not (= invariant_2_n 0.0))
               (not (= invariant_5_n 0.0))
               (not (= invariant_13_n 0.0))
               (not (= invariant_6_n 0.0))
               (not (or (= invariant_4_n 0.0)
                        (= invariant_4_n 1.0)
                        (= invariant_4_n 2.0)))
               (not (= invariant_7_n 0.0))
               (not (= invariant_10_n (- 1.0)))
               (not (= invariant_11_n (- 1.0)))
               (not (>= invariant_8_n 0.0))
               (not (>= invariant_9_n 0.0)))))
  (or (not invariant__tr0) (not |vsolver#1|) (not a!1))))
(assert (or (not invariant__tr1) |invariant#level_0!2| (not |vsolver#1|)))
(assert (let ((a!1 (or invariant_1_0
               invariant_3_0
               (not (= invariant_10_0 (- 1.0)))
               (not (= invariant_11_0 (- 1.0)))
               (>= invariant_8_0 20.0)
               (>= invariant_9_0 20.0)
               (not (= invariant_0_0 0.0))
               (not (= invariant_2_0 0.0))
               (not (= invariant_5_0 0.0))
               (not (= invariant_6_0 0.0))
               (not (= invariant_7_0 0.0))
               (not (= invariant_13_0 0.0))
               (not (>= invariant_8_0 0.0))
               (not (>= invariant_9_0 0.0))
               (not (or (= invariant_4_0 0.0)
                        (= invariant_4_0 1.0)
                        (= invariant_4_0 2.0))))))
  (or (not invariant__tr1)
      |invariant#reach_tag_0_0|
      (not a!1)
      (not |vsolver#1|))))
(assert (or (not spacer_proxy!0)
    (<= (+ invariant_10_n (* (- 1.0) invariant_11_n)) (- 41.0))
    (not |vsolver#1|)))
(assert (or (not invariant__tr1) (not |vsolver#1|) (not spacer_proxy!1)))
(assert (let ((a!1 (not (<= (+ invariant_10_n (* (- 1.0) invariant_11_n)) (- 41.0)))))
  (or |invariant#level_0!2| (not |vsolver#1|) a!1)))
(assert (let ((a!1 (not (<= (+ invariant_10_0 (* (- 1.0) invariant_11_0)) (- 41.0)))))
  (or (not invariant__tr1) |invariant#level_1!5| (not |vsolver#1|) a!1)))
(assert (or (= invariant_2_n 2.0) (not |vsolver#1|) (not spacer_proxy!2)))
(assert (or (not |vsolver#1|)
    (not spacer_proxy!3)
    (>= (+ invariant_7_n (* (- 1.0) invariant_10_n)) 41.0)))
(assert (or (= invariant_4_n 0.0) (not |vsolver#1|) (not spacer_proxy!4)))
(assert (or (= invariant_6_n 1.0) (not |vsolver#1|) (not spacer_proxy!5)))
(assert (or (= invariant_5_n 1.0) (not |vsolver#1|) (not spacer_proxy!6)))
(assert (or (not |vsolver#1|)
    (= (+ invariant_7_n (* (- 1.0) invariant_9_n)) 0.0)
    (not spacer_proxy!7)))
(assert (or (not (<= invariant_13_n 0.0)) (not |vsolver#1|) (not spacer_proxy!8)))
(assert (or (= invariant_11_n (- 1.0)) (not |vsolver#1|) (not spacer_proxy!9)))
(assert (or (not invariant_1_n) |invariant#level_0!2| (not |vsolver#1|)))
(assert (or (not invariant_1_0)
    (not invariant__tr1)
    |invariant#level_1!5|
    (not |vsolver#1|)))
(assert (or (not |vsolver#1|)
    (<= (+ invariant_7_n (* (- 1.0) invariant_11_n)) (- 41.0))
    (not spacer_proxy!10)))
(assert (or (= invariant_2_n 1.0) (not |vsolver#1|) (not spacer_proxy!11)))
(assert (or (not |vsolver#1|) (>= invariant_0_n 1.0) (not spacer_proxy!12)))
(assert (or (= invariant_10_n (- 1.0)) (not |vsolver#1|) (not spacer_proxy!13)))
(assert (or (= invariant_4_n 1.0) (not |vsolver#1|) (not spacer_proxy!14)))
(assert (or (not |vsolver#1|)
    (= (+ invariant_7_n (* (- 1.0) invariant_8_n)) 0.0)
    (not spacer_proxy!15)))
(assert (or |invariant#level_0!2| (not |vsolver#1|) (not (= invariant_5_n 1.0))))
(assert (or (not invariant__tr1)
    |invariant#level_1!5|
    (not |vsolver#1|)
    (not (= invariant_5_0 1.0))))
(assert (or (= invariant_5_n 0.0) (not |vsolver#1|) (not spacer_proxy!16)))
(assert (or (not (= invariant_2_0 1.0))
    (not invariant__tr1)
    (not (= invariant_5_0 0.0))
    (not |vsolver#1|)
    (not spacer_proxy!17)))
;; extra clause
(assert (or invariant_ext0_n invariant__tr0 invariant__tr1 ))
(check-sat |vsolver#1|
 spacer_proxy!17
 (not invariant_ext0_n)
 (not |invariant#level_0!2|)
 (not |invariant#level_1!5|)
 (not |invariant#level_2!6|)
 (not |invariant#level_3!8|)
 (not |invariant#level_4!10|)
 spacer_proxy!11
 spacer_proxy!16
)
(exit)
(:added-eqs                      588
 :arith-eq-adapter               104
 :arith-bound-propagations-cheap 51
 :arith-bound-propagations-lp    53
 :arith-conflicts                2
 :arith-diseq                    97
 :arith-lower                    150
 :arith-make-feasible            86
 :arith-max-columns              40
 :arith-max-rows                 22
 :arith-propagations             51
 :arith-rows                     358
 :arith-upper                    172
 :conflicts                      32
 :decisions                      385
 :del-clause                     127
 :final-checks                   7
 :minimized-lits                 8
 :mk-bool-var                    450
 :mk-clause                      590
 :num-checks                     15
 :propagations                   1395)
(params arith.solver 6 random_seed 0 dump_benchmarks true dump_threshold -10 mbqi true arith.ignore_int true array.weak true)
(act-lvl -1)
(ind-gen (not (>= invariant_8_n (- 1.0)))
)
