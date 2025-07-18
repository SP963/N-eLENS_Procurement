@AbapCatalog.sqlViewName: 'ZPROPOC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #CUBE
@EndUserText.label: 'PR PO Details'
define view ZPRO_AGE_ANALYSIS_PRPO_COUNT as select from ZPRO_AGE_ANALYSIS_PRPO as a
{

  a.banfn,
  count(*) as count1,
  count(distinct a.banfn) as count2
} group by a.banfn

