CLASS lhc_taskitems DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS valTaskItemStatus FOR VALIDATE ON SAVE
      IMPORTING keys FOR TaskItems~valTaskItemStatus.
    METHODS detTaskItemStatus FOR DETERMINE ON SAVE
      IMPORTING keys FOR TaskItems~detTaskItemStatus.

ENDCLASS.

CLASS lhc_taskitems IMPLEMENTATION.

  METHOD valTaskItemStatus.
    READ ENTITIES OF Z114_C_Tasks
  ENTITY TaskItems
  ALL FIELDS WITH CORRESPONDING #( keys )
  RESULT DATA(lt_result)
  FAILED DATA(lt_failed)
  REPORTED DATA(lt_reported).


    IF lt_result[ 1 ]-Status = 'N' OR
       lt_result[ 1 ]-Status = 'I' OR
       lt_result[ 1 ]-Status = 'C'.

    ELSE.
      failed-taskitems = VALUE #( ( %key-Uuid = lt_result[ 1 ]-Uuid ) ).
      reported-taskitems = VALUE #( ( %key-Uuid = lt_result[ 1 ]-Uuid
                                      %msg      = new_message_with_text(
                                    severity = if_abap_behv_message=>severity-error
                                    text     = 'Only N, I and C are allowed'
                                    ) ) ).
    ENDIF.
  ENDMETHOD.

  METHOD detTaskItemStatus.

    MODIFY ENTITIES OF Z114_C_Tasks
    ENTITY TaskItems
    UPDATE FROM VALUE #( ( %key-Uuid       = keys[ 1 ]-Uuid
                           %key-TaskUuid   = keys[ 1 ]-TaskUuid
                           Status          = 'N'
                           %control-Status = if_abap_behv=>mk-on ) )
    MAPPED DATA(lt_mapped)
    FAILED DATA(lt_failed)
    REPORTED DATA(lt_reported).

  ENDMETHOD.

ENDCLASS.

CLASS lhc_Tasks DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Tasks RESULT result.
    METHODS valtaskstatus FOR VALIDATE ON SAVE
      IMPORTING keys FOR tasks~valtaskstatus.
    METHODS dettaskstatus FOR DETERMINE ON SAVE
      IMPORTING keys FOR tasks~detTaskStatus.

ENDCLASS.

CLASS lhc_Tasks IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD valTaskStatus.

    READ ENTITIES OF Z114_C_Tasks
    ENTITY Tasks
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_result)
    FAILED DATA(lt_failed)
    REPORTED DATA(lt_reported).


    IF lt_result[ 1 ]-OverallStatus = 'N' OR
       lt_result[ 1 ]-OverallStatus = 'I' OR
       lt_result[ 1 ]-OverallStatus = 'C'.

    ELSE.
      failed-tasks = VALUE #( ( %key-Uuid = lt_result[ 1 ]-Uuid ) ).
      reported-tasks = VALUE #( ( %key-Uuid = lt_result[ 1 ]-Uuid
                                  %msg      = new_message_with_text(
                                severity = if_abap_behv_message=>severity-error
                                text     = 'Only N, I and C are allowed'
                                ) ) ).
    ENDIF.
  ENDMETHOD.

  METHOD detTaskStatus.
    MODIFY ENTITIES OF Z114_C_Tasks
  ENTITY Tasks
  UPDATE FROM VALUE #( ( %key-Uuid              = keys[ 1 ]-Uuid
                         OverallStatus          = 'N'
                         %control-OverallStatus = if_abap_behv=>mk-on ) )
  MAPPED DATA(lt_mapped)
  FAILED DATA(lt_failed)
  REPORTED DATA(lt_reported).
  ENDMETHOD.

ENDCLASS.
