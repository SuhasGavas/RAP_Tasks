@EndUserText.label: 'Data definition for tasks'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity Z114_C_Tasks
  as projection on Z114_I_Tasks
{
  key Uuid,
      TaskName,
      OverallStatus,
      CreatedBy,
      CreateOn,
      LastChangedBy,
      LastChangeOn,
      LocalLastChangedAt,
      /* Associations */
      _TaskItems : redirected to composition child Z114_C_TaskItems
}
