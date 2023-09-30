CLASS zcl_114_tasks_test_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_114_tasks_test_class IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lv_op TYPE char5.

    CASE lv_op.
      WHEN 'R'.
        READ ENTITIES OF Z114_C_Tasks
            ENTITY Tasks
            ALL FIELDS WITH VALUE #( ( %key-Uuid = '7EF32398BA8C1EDE97EFE4B3D183D7CE' ) )
            RESULT DATA(lt_result_r)
            FAILED DATA(lt_failed_r)
            REPORTED DATA(lt_reported_r).

      WHEN 'RBA'.
        READ ENTITIES OF Z114_C_Tasks
            ENTITY Tasks
            BY \_TaskItems
            ALL FIELDS WITH VALUE #( ( %key-Uuid = '7EF32398BA8C1EDE97EFF9C7F8CDD7EB' ) )
            RESULT DATA(lt_result_rba)
            FAILED DATA(lt_failed_rba)
            REPORTED DATA(lt_reported_rba).

      WHEN 'C'.
        DATA : lt_tasks TYPE TABLE FOR CREATE Z114_C_Tasks.

        lt_tasks = VALUE #( ( %cid              = 'task'
                              TaskName          = 'T55'
                              %control-TaskName = if_abap_behv=>mk-on ) ).

        MODIFY ENTITIES OF Z114_C_Tasks
        ENTITY Tasks
        CREATE FROM lt_tasks
        MAPPED DATA(lt_mapped_c)
        FAILED DATA(lt_failed_c)
        REPORTED DATA(lt_reported_c).

        IF lt_failed_c-tasks[] IS INITIAL.
          COMMIT ENTITIES.
        ENDIF.

        WHEN 'CBA'.
        DATA : lt_tasks_cba TYPE TABLE FOR CREATE Z114_C_Tasks,
               lt_taskitems_cba TYPE TABLE FOR CREATE Z114_C_Tasks\_TaskItems,
               wa_taskitems_cba like LINE OF lt_taskitems_cba,
               lt_target like wa_taskitems_cba-%target.


        lt_tasks_cba = VALUE #( (   %cid              = 'task'
                                    TaskName          = 'T55'
                                    %control-TaskName = if_abap_behv=>mk-on ) ).

        lt_target = VALUE #( (   %cid              = 'taskitem'
                                 SubtaskName       = 'SI55'
                                 %control-SubtaskName = if_abap_behv=>mk-on ) ).

        lt_taskitems_cba = VALUE #( ( %cid_ref = 'task' %target = lt_target ) ).

        MODIFY ENTITIES OF Z114_C_Tasks
        ENTITY Tasks
        CREATE FROM lt_tasks
        CREATE BY \_TaskItems FROM lt_taskitems_cba
        MAPPED DATA(lt_mapped_cba)
        FAILED DATA(lt_failed_cba)
        REPORTED DATA(lt_reported_cba).

        IF lt_failed_c-tasks[] IS INITIAL.
          COMMIT ENTITIES.
        ENDIF.
      WHEN OTHERS.
    ENDCASE.


  ENDMETHOD.
ENDCLASS.
