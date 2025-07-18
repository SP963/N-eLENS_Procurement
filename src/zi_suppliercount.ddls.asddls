@AbapCatalog.sqlViewName: 'ZSUPPLIER'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SUPPLIER COUNT'
@Analytics.dataCategory: #CUBE
define view ZI_SUPPLIERCOUNT as select from lfa1 as a
  association [0..1] to t005t as b on  a.land1 = b.land1
                                   and b.spras = $session.system_language
{

  a.regio as Region,
  
  b.landx50 as Country_Name,
  
  @DefaultAggregation: #SUM
  count( distinct a.lifnr ) as SupplierCount
}
group by a.regio, b.landx50
