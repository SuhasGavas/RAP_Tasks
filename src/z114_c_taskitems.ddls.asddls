@EndUserText.label: 'Data definition for task items'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity Z114_C_TaskItems
  as projection on Z114_I_TaskItems
{
  key Uuid,
  key TaskUuid,
      SubtaskName,
      DueDate,
      Status,
      CreatedBy,
      CreateOn,
      LastChangedBy,
      LastChangeOn,
      LocalLastChangedAt,
      /* Associations */
      _Tasks : redirected to parent Z114_C_Tasks
}
