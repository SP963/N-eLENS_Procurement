@AbapCatalog.sqlViewName: 'ZIPROCAGE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #CUBE
@EndUserText.label: 'Ageing Analysis'
define view ZI_PROC_AGEING_ANLY
  as select distinct from lfa1                    as _LFA1
    left outer join       ZPRO_AGE_ANALYSIS_POGRN as _Ageing  on _LFA1.lifnr = _Ageing.lifnr
    left outer join       ZI_PROC_DATE            as _po_date on _po_date.lifnr = _LFA1.lifnr
{
  _LFA1.lifnr,
  ( coalesce(_Ageing.AgeingDays, 0) - coalesce(_po_date.days_po, 0) ) as Ageing_analysis
}
