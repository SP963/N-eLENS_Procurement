@AbapCatalog.sqlViewName: 'ZIPROCDATE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #CUBE
@EndUserText.label: 'Ageing Analysis'
define view ZI_PROC_DATE
  as select distinct from lfa1           as _lfa1
    left outer join       ekko           as _Ekko     on  _Ekko.lifnr = _lfa1.lifnr
                                                      and _Ekko.spras = $session.system_language
    left outer join       I_CalendarDate as _calendar on _calendar.CalendarDate = $session.system_date
{
  _lfa1.lifnr,
  abs(dats_days_between( _calendar.CalendarDate, _Ekko.bedat )) as days_po
}
