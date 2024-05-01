*&---------------------------------------------------------------------*
*& Report ZDPM_SUBROT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZDPM_SUBROT.


INCLUDE ZINCLUDES.
* CALL BY VALUE
*DATA A TYPE I VALUE 20.
*
*
*PERFORM SUB USING A.
*WRITE : A.
*
*
*FORM SUB USING VALUE(P_A) .
*  P_A = 50.
*  ENDFORM.
"CALL BY REFERENCE"
*
*DATA A TYPE I VALUE 20.
*
*PERFORM SUB CHANGING A.
*WRITE A.
*
*FORM SUB CHANGING P_A.
*  P_A = 50.
*ENDFORM.

" CALL BY VALUE AND RETURN"

*DATA A TYPE I VALUE 20.
*PERFORM SUB CHANGING A.
*WRITE A.
*FORM SUB CHANGING VALUE(P_A).
*  P_A = 50.
*ENDFORM.

PERFORM DATA_SELECT.
PERFORM DATA_DISPLAY.
*&---------------------------------------------------------------------*
*& Form DATA_SELECT
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM data_select .
SELECT vbak~vbeln vbak~audat vbak~vbtyp vbak~trvog
    vbak~auart vbap~posnr vbap~matnr vbap~matwa
   INTO TABLE
   it_tab FROM vbak
  LEFT OUTER JOIN
  "INNER JOIN
  vbap ON vbak~vbeln = vbap~vbeln WHERE vbak~vbeln IN s_vbeln.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form DATA_DISPLAY
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM data_display .
IF sy-subrc EQ 0.
  WRITE : /'SALES ORDER INFO',sy-dbcnt.
ENDIF.
LOOP AT it_tab INTO wa_tab.
  WRITE : /  wa_tab-vbeln , wa_tab-audat ,wa_tab-vbtyp , wa_tab-trvog,wa_tab-auart,wa_tab-posnr,wa_tab-matnr,wa_tab-matwa.
ENDLOOP.
ENDFORM.