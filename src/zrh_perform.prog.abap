*&---------------------------------------------------------------------*
*& Report  ZRH_PERFORM
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zrh_perform.

INCLUDE: zrh_perform_v,
         zrh_perform_f.



START-OF-SELECTION.

*Guardo en memoria de ABAP el parametro
  FREE MEMORY ID 'ZHR_EMP_ID'.
  EXPORT p_id_emp TO MEMORY ID 'ZHR_EMP_ID'.
  CLEAR p_id_emp.

*Guardo en memoria SAP el parametro
  SET PARAMETER ID: 'MEMORIASAP' FIELD p_id_emp.


  CLEAR gv_flag_exito.

  PERFORM buscar_datos TABLES   te_emp
                       USING    p_id_emp
                       CHANGING gv_flag_exito.




END-OF-SELECTION.

  IF gv_flag_exito IS NOT INITIAL.
    PERFORM imprimir_datos TABLES te_emp.
  ELSE.
    WRITE:/ 'No se encontraron valores para la busqueda.' .
  ENDIF.
