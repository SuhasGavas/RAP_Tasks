@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data definition for tasks'
define root view entity Z114_I_Tasks
  as select from z114_tasks
  composition [0..*] of Z114_I_TaskItems as _TaskItems
{
      @EndUserText.label: 'UUID'
  key uuid                  as Uuid,

      @EndUserText.label: 'Task'
      task_name             as TaskName,

      @EndUserText.label: 'Overall Status'
      overall_status        as OverallStatus,

      @Semantics.user.createdBy: true
      @EndUserText.label: 'Create By'
      created_by            as CreatedBy,

      @Semantics.systemDateTime.createdAt: true
      @EndUserText.label: 'Create On'
      create_on             as CreateOn,

      @Semantics.user.lastChangedBy: true
      @EndUserText.label: 'Last Changed By'
      last_changed_by       as LastChangedBy,

      @Semantics.systemDateTime.lastChangedAt: true
      @EndUserText.label: 'Last Changed On'
      last_change_on        as LastChangeOn,

      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      @EndUserText.label: 'LOcal Last Changed At'
      local_last_changed_at as LocalLastChangedAt,
      _TaskItems
}
