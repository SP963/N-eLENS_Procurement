@AbapCatalog.sqlViewName: 'ZIPROCVENDOR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #CUBE
@EndUserText.label: 'Procurement Vendor Data'
define view ZI_PROC_VENDOR
  as select distinct from lfa1  as _LFA1
    left outer join       lfb1  as _LFB1  on _LFA1.lifnr = _LFB1.lifnr
  //  inner join  lfb1  as _LFB1  on _LFA1.lifnr = _LFB1.lifnr
    left outer join       t005t as _T005T on _T005T.land1 = _LFA1.land1
    left outer join       t005u as _T005U on  _T005U.land1 = _T005T.land1
                                          and _T005U.spras = $session.system_language

{
  _LFB1.bukrs                                      as CompanyCode,
  _LFB1.lifnr                                      as Vendor,
  _LFA1.name1                                      as Vendor_Name,
  _LFA1.land1                                      as Country,
  _T005T.landx                                     as Country_Name,
  _LFA1.regio                                      as Region,
  _T005U.bezei                                     as Region_Name,
  cast(substring(_LFA1.erdat,1,4) as abap.numc(4)) as CalYear
}
