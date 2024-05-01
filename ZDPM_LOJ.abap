*&---------------------------------------------------------------------*
*& Report ZDPM_JOINA
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
*JOINS FOR 3 TABLES
REPORT zdpm_loj.
TYPES: BEGIN OF ty_vbak ,
         vbeln TYPE vbak-vbeln, audat TYPE vbak-audat,
         vbtyp TYPE vbak-vbtyp, trvog TYPE vbak-trvog,
         auart TYPE vbak-auart,  posnr TYPE vbap-posnr,
         matnr TYPE vbap-matnr, matwa TYPE vbap-matwa,
         etenr TYPE vbep-etenr, ettyp TYPE vbep-ettyp,
       END OF ty_vbak.
DATA : lv_vb  TYPE vbak-vbeln,
       it_tab TYPE STANDARD TABLE OF ty_vbak,
       wa_tab TYPE ty_vbak.
SELECT-OPTIONS s_vbeln FOR lv_vb.
START-OF-SELECTION.
SELECT vbak~vbeln vbak~audat vbak~vbtyp vbak~trvog
    vbak~auart vbap~posnr vbap~matnr vbap~matwa
    vbep~etenr vbep~ettyp
   INTO TABLE
   it_tab FROM vbak
  INNER JOIN vbap ON
  vbak~vbeln = vbap~vbeln
  INNER JOIN vbep ON
   vbap~vbeln = vbep~vbeln
  WHERE vbak~vbeln IN s_vbeln .
IF sy-subrc EQ 0.
  WRITE : /'SALES ORDER INFO',sy-dbcnt.
ENDIF.
END-OF-SELECTION.
*WRITE : / 'VBELN       AUDAT        VBTYP      TRVOG                                          AUART                           POSNR     MATNR     MATWA           ETENR ETTTYP'.
LOOP AT it_tab INTO wa_tab.
  WRITE : /  wa_tab-vbeln , wa_tab-audat ,wa_tab-vbtyp , wa_tab-trvog,
          wa_tab-auart,wa_tab-posnr,wa_tab-matnr,wa_tab-matwa ,
           wa_tab-etenr , wa_tab-ettyp.
ENDLOOP.