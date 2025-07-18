@AbapCatalog.sqlViewName: 'ZPROYC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #CUBE
@EndUserText.label: 'Year Month Calculations'

define view ZPRO_YEAR_CALCULATION as select from I_FiscalCalendarDate as a                 
                        
 {
   a.CalendarDate as CalendarDate,
   a.FiscalPeriod,
   case a.FiscalPeriod
   when '001' then '10'
   when '002' then '11'
   when '003' then '12'
   when '004' then '01'
   when '005' then '02'
   when '006' then '03'
   when '007' then '04'
   when '008' then '05'
   when '009' then '06'
   when '010' then '07'
   when '011' then '08'
   when '012' then '09'
   else 'null' end as FiscalMonth,
   
   case a.FiscalPeriod
   when '001' then '01-JAN'
   when '002' then '02-FEB'
   when '003' then '03-MAR'
   when '004' then '04-APR'
   when '005' then '05-MAY'
   when '006' then '06-JUN'
   when '007' then '07-JUL'
   when '008' then '08-AUG'
   when '009' then '09-SEP'
   when '010' then '10-OCT'
   when '011' then '11-NOV'
   when '012' then '12-DEC'
   else 'null' end as
   FiscalMonthDate,  

   case a.FiscalPeriod
   when '001' then 'JAN'
   when '002' then 'FEB'
   when '003' then 'MAR'
   when '004' then 'APR'
   when '005' then 'MAY'
   when '006' then 'JUN'
   when '007' then 'JUL'
   when '008' then 'AUG'
   when '009' then 'SEP'
   when '010' then 'OCT'
   when '011' then 'NOV'
   when '012' then 'DEC'
   else 'null' end as
   FiscalMonthDesc  

   //case  
  // when a.CalendarMonth < '04' then (a.CurrentYear - 1 ) 
   //else a.CurrentYear end as FiscalYear

  } //where a.CalendarDate = $session.system_date
  
