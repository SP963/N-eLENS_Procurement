@AbapCatalog.sqlViewName: 'ZPRO2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #CUBE
@EndUserText.label: 'Purchase Details'
define view ZPRO_PUR_ACT_PRICE2 as select from ekpo as a 
inner join ekko as b on a.ebeln = b.ebeln
inner join ekbe as c on b.ebeln = c.ebeln and a.ebelp = c.ebelp

{
  a.ebeln as ebeln,
  a.ebelp as ebelp,
  a.menge as menge,
  a.netpr as netpr,
  b.ekorg as ekorg,
  b.ekgrp as ekgrp,
  b.waers as waers,
  c.bwart as bwart
  
}
  
