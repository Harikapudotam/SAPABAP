*&---------------------------------------------------------------------*
*& Report ZDPM_GRADE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZDPM_GRADE.

PARAMETERS : P_RES TYPE p.
IF P_RES > 85 .
  WRITE : /'GRADEA'.
ELSEIF P_RES > 70 AND P_RES < 85.
  WRITE :/'GRADEB'.
ELSEIF P_RES > 60 AND P_RES < 70.
  WRITE:/'GRADEC'.
ELSE.
  WRITE:/'GRADED'.

ENDIF.