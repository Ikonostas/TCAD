
;; Defined Parameters:

;; Contact Sets:
(sdegeo:define-contact-set "koll_c0" 4 (color:rgb 1 0 0 )"##" )
(sdegeo:define-contact-set "baze" 4 (color:rgb 1 0 0 )"##" )
(sdegeo:define-contact-set "emit" 4 (color:rgb 1 0 0 )"##" )

;; Work Planes:
(sde:workplanes-init-scm-binding)

;; Defined ACIS Refinements:
(sde:refinement-init-scm-binding)

;; Reference/Evaluation Windows:
(sdedr:define-refeval-window "RefEvalWin_baze" "Line" (position 32.2 204.29 0) (position 247.8 204.29 0))
(sdedr:define-refeval-window "RefEvalWin_emit" "Line" (position 134.52 204.29 0) (position 145.48 204.29 0))
(sdedr:define-refeval-window "RefEvalWin_1" "Rectangle" (position 0 0 0) (position 280 160 0))
(sdedr:define-refeval-window "RefEvalWin_2" "Rectangle" (position 0 160 0) (position 280 200 0))
(sdedr:define-refeval-window "RefEvalWin_3" "Rectangle" (position 0 160 0) (position 280 200 0))

;; Restore GUI session parameters:
(sde:set-window-position 0 0)
(sde:set-window-size 1264 957)
(sde:set-window-style "Windows")
(sde:set-background-color 0 127 178 204 204 204)
(sde:scmwin-set-prefs "Arial" "Normal" 8 103 )
