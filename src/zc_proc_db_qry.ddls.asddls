@ClientHandling.algorithm: #SESSION_VARIABLE
@AbapCatalog.sqlViewName: 'ZIPROCDBQRY'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@Analytics.query: true
@VDM.viewType: #CONSUMPTION
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Procurement DB Formula Query'
@Analytics.dataExtraction.delta.changeDataCapture.automatic: true
define view ZC_PROC_DB_QRY
  as select from ZI_PROCUREMENT
{
      @AnalyticsDetails.query.axis: #ROWS
  key Lifnr,
      //      Land1,
      Name1,
      Name2,
      Name3,
      Name4,
      Ort01,
      Ort02,
      Pfach,
      Pstl2,
      Pstlz,
      Regio,
      Sortl,
      Stras,
      Adrnr,
      //      Mcod1,
      //      Mcod2,
      //      Mcod3,
      Anred,
      Bahns,
      Bbbnr,
      Bbsnr,
      Begru,
      Brsch,
      Bubkz,
      Datlt,
      Dtams,
      Dtaws,
      Erdat,
      Ernam,
      Esrnr,
      Konzs,
      Ktokk,
      Kunnr,
      Lnrza,
      Loevm,
      Sperr,
      Sperm,
      Spras,
      Stcd1,
      Stcd2,
      Stkza,
      Stkzu,
      Telbx,
      Telf1,
      Telf2,
      Telfx,
      Teltx,
      Telx1,
      Xcpdk,
      Xzemp,
      Vbund,
      Fiskn,
      Stceg,
      Stkzn,
      Sperq,
      Gbort,
      Gbdat,
      Sexkz,
      Kraus,
      Revdb,
      Qssys,
      Ktock,
      Pfort,
      Werks,
      Ltsna,
      Werkr,
      Plkal,
      Duefl,
      Txjcd,
      Sperz,
      Scacd,
      Sfrgr,
      Lzone,
      Xlfza,
      Dlgrp,
      Fityp,
      Stcdt,
      Regss,
      Actss,
      Stcd3,
      Stcd4,
      Stcd5,
      Stcd6,
      Ipisp,
      Taxbs,
      Profs,
      Stgdl,
      Emnfr,
      Lfurl,
      J1kfrepre,
      J1kftbus,
      J1kftind,
      Confs,
      Updat,
      Uptim,
      Nodel,
      Qssysdat,
      Podkzb,
      Fisku,
      Stenr,
      CarrierConf,
      MinComp,
      TermLi,
      CrcNum,
      CvpXblck,
      Weora,
      Rg,
      Exp,
      Uf,
      Rgdate,
      Ric,
      Rne,
      Rnedate,
      Cnae,
      Legalnat,
      Crtn,
      Icmstaxpay,
      Indtyp,
      Tdt,
      Comsize,
      Decregpc,
      AllowanceType,
      Paytrsn,
      Lfa1EewSupp,
      DataCtrlr1,
      //      DataCtrlr2,
      //      DataCtrlr3,
      //      DataCtrlr4,
      //      DataCtrlr5,
      //      DataCtrlr6,
      //      DataCtrlr7,
      //      DataCtrlr8,
      //      DataCtrlr9,
      //      DataCtrlr10,
      Xdcset,
      DummyLfa1AddrInclEewPs,
      JScCapital,
      JScCurrency,
      Alc,
      PmtOffice,
      PpaRelevant,
      SamUeId,
      SamEftInd,
      Psofg,
      Psois,
      //      Pson1,
      //      Pson2,
      //      Pson3,
      //      Psovn,
      //      Psotl,
      //      Psohs,
      //      Psost,
      BorgrDatun,
      BorgrYeaun,
      AuCarryingEnt,
      AuIndUnder18,
      AuPaymentNotExceed75,
      AuWhollyInpTaxed,
      AuPartnerWithoutGain,
      AuNotEntitledAbn,
      AuPaymentExempt,
      AuPrivateHobby,
      AuDomesticNature,
      //      Addr2Street,
      //      Addr2HouseNum,
      //      Addr2Post,
      //      Addr2City,
      //      Addr2Country,
      Categ,
      PartnerName,
      PartnerUtr,
      Status,
      Vfnum,
      Vfnid,
      Crn,
      FrOccupation,
      J1iexcd,
      J1iexrn,
      J1iexrg,
      J1iexdi,
      J1iexco,
      J1icstno,
      J1ilstno,
      J1ipanno,
      J1iexcive,
      J1issist,
      J1ivtyp,
      J1ivencre,
      Aedat,
      Usnam,
      J1isern,
      J1ipanref,
      J1ipanvaldt,
      J1iCustoms,
      J1idedref,
      VenClass,
      Entpub,
      Escrit,
      Dvalss,
      Frmcss,
      Codcae,
      Ausdiv,
      //      ScCapital,
      //      ScCurrency,
      TransportChain,
      StagingTime,
      SchedulingType,
      SubmiRelevant,
      calenderMonth,
      CalendarYear,
      CalenderQuarter,
      Purchase_Order,
      Invoice,
      rhcur,
      Ageing_analysis,
      Net_Value,
      Gross_Value,
      Quantity,
      CalYear,
      CompanyCode,
      Country,
      Country_Name,
      Region,
      Region_Name,
      name1_lastname

}
