*&---------------------------------------------------------------------*
*& Report ZDPM_SUBROT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZDPM_SUBROT NO STANDARD PAGE HEADING LINE-COUNT 20(3) LINE-SIZE 500 MESSAGE-ID ZD_404.

LOAD-OF-PROGRAM.
INCLUDE ZINCLUDES.
SELECT-OPTIONS S_VBELN FOR WA_TAB-VBELN OBLIGATORY.
INITIALIZATION.
S_VBELN-LOW = '1'.
S_VBELN-HIGH = '50'.
APPEND S_VBELN.
AT SELECTION-SCREEN ON S_VBELN .
  SELECT SINGLE VBELN INTO LV_VB FROM VBAK WHERE VBELN IN S_VBELN.
    IF SY-SUBRC = 0.
      MESSAGE S000.
    ELSE.
      MESSAGE S001.
      ENDIF.
  START-OF-SELECTION.
  PERFORM GET_DATA.
  END-OF-SELECTION.
  PERFORM DISPLAY_DATA.
TOP-OF-PAGE.
ULINE.
WRITE : / 'VBELN' ,
       'AUDAT' , 'VBTYP' ,'TRVOG' , 'AURAT' , 'POSNR' , 'MATNR' , 'MATWA'.

END-OF-PAGE.
write :/ 'current list page no:' , sy-pagno,
          'Date: ', sy-datum,
          'Time:', sy-uzeit.



FORM get_data .
    SELECT vbak~vbeln vbak~audat vbak~vbtyp vbak~trvog
    vbak~auart vbap~posnr vbap~matnr vbap~matwa
   INTO TABLE
   it_tab FROM vbak
  LEFT OUTER JOIN
  "INNER JOIN
  vbap ON vbak~vbeln = vbap~vbeln WHERE vbak~vbeln IN s_vbeln.
      IF SY-SUBRC = 0.
        MESSAGE S000.
      ELSE.
        MESSAGE S001.
      ENDIF.
ENDFORM.







FORM DISPLAY_DATA.
  IF sy-subrc EQ 0.
  WRITE : /'SALES ORDER INFO',sy-dbcnt.
ENDIF.
LOOP AT it_tab INTO wa_tab.
  WRITE : /  wa_tab-vbeln , wa_tab-audat ,wa_tab-vbtyp , wa_tab-trvog,wa_tab-auart,wa_tab-posnr,wa_tab-matnr,wa_tab-matwa.
ENDLOOP.

  ENDFORM.