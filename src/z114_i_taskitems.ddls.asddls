@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data definition for task items'
define view entity Z114_I_TaskItems
  as select from z114_task_items
  association to parent Z114_I_Tasks as _Tasks on $projection.TaskUuid = _Tasks.Uuid
{
      @EndUserText.label: 'UUID'
  key uuid                  as Uuid,

      @EndUserText.label: 'Task UUID'
  key task_uuid             as TaskUuid,

      @EndUserText.label: 'Subtask'
      subtask_name          as SubtaskName,

      @EndUserText.label: 'Due Date'
      due_date              as DueDate,

      @EndUserText.label: 'Status'
      status                as Status,

      @Semantics.user.createdBy: true
      @EndUserText.label: 'Create By'
      created_by            as CreatedBy,

      @Semantics.systemDateTime.createdAt: true

      @EndUserText.label: 'Created On'
      create_on             as CreateOn,

      @Semantics.user.lastChangedBy: true
      @EndUserText.label: 'Last Changed By'
      last_changed_by       as LastChangedBy,

      @Semantics.systemDateTime.lastChangedAt: true
      @EndUserText.label: 'Last Changed At'
      last_change_on        as LastChangeOn,

      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      @EndUserText.label: 'Local Last Changed At'
      local_last_changed_at as LocalLastChangedAt,
      _Tasks
}
