@AbapCatalog.sqlViewName: 'ZPROM1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Material Details'
define view ZPRO_MARA as select from mara as a
{
  a.matnr as matnr,
  a.mtart as mtart
}
where (a.mtart = 'ZBUL' or a.mtart = 'ZROH') 
