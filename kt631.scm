
;; Defined Parameters:

;; Contact Sets:

;; Work Planes:
(sde:workplanes-init-scm-binding)

;; Defined ACIS Refinements:
(sde:refinement-init-scm-binding)

;; Reference/Evaluation Windows:
(sdedr:define-refeval-window "RefEvalWin_1" "Line" (position 31.6 0 0) (position 50.4 0 0))
(sdedr:define-refeval-window "RefEvalWin_2" "Line" (position 34 0 0) (position 463 0 0))

;; Restore GUI session parameters:
(sde:set-window-position 0 27)
(sde:set-window-size 1920 983)
(sde:set-window-style "Windows")
(sde:set-background-color 0 127 178 204 204 204)
(sde:scmwin-set-prefs "Liberation Sans" "Normal" 8 100 )
