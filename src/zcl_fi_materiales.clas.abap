class ZCL_FI_MATERIALES definition
  public
  final
  create public .

public section.

  class-methods GET_FACTURAS .
protected section.
private section.
ENDCLASS.



CLASS ZCL_FI_MATERIALES IMPLEMENTATION.


  METHOD GET_FACTURAS.

    SELECT SINGLE *
      FROM makt
      INTO @DATA(l_es_makt)
     WHERE matnr EQ '000000000000000003'
       AND spras EQ @sy-langu.

  ENDMETHOD.
ENDCLASS.
