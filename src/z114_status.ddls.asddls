@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data definition for status'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel.resultSet.sizeCategory: #XS
define view entity Z114_Status as select from DDCDS_CUSTOMER_DOMAIN_VALUE( p_domain_name: 'Z114_STATUS' )
{
    key domain_name,
    key value_position,
    value_low,
    value_high
}
