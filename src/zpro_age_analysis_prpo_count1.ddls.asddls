@AbapCatalog.sqlViewName: 'ZPROPOC1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #CUBE
@EndUserText.label: 'PR PO Details'
define view ZPRO_AGE_ANALYSIS_PRPO_COUNT1 as select from ZPRO_AGE_ANALYSIS_PRPO_COUNT as a
{

  a.banfn,
//  a.count1,
  avg(a.count2) as count2
} group by a.banfn

