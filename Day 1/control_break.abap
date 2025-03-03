DATA: sflight_tab TYPE SORTED TABLE OF sflight
WITH UNIQUE KEY carrid connid fldate,
sflight_wa LIKE LINE OF sflight_tab.
SELECT *
FROM sflight
INTO TABLE sflight_tab.
LOOP AT sflight_tab INTO sflight_wa.
AT NEW connid.
WRITE: / sflight_wa-carrid,
sflight_wa-connid.
ULINE.
ENDAT.
WRITE: / sflight_wa-fldate,
sflight_wa-seatsocc.
AT END OF connid.
SUM.
ULINE.
WRITE: / 'Sum',
sflight_wa-seatsocc UNDER sflight_wa-seatsocc.
SKIP.
ENDAT.
AT END OF carrid.
SUM.
ULINE.
WRITE: / 'Carrier Sum',
sflight_wa-seatsocc UNDER sflight_wa-seatsocc.
NEW-PAGE.
ENDAT.
AT LAST.
SUM.
WRITE: / 'Overall Sum',
sflight_wa-seatsocc UNDER sflight_wa-seatsocc.
ENDAT.
ENDLOOP.
