@AbapCatalog.sqlViewName: 'ZSUPPLIERCOUNT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@Analytics.query: true
@VDM.viewType: #CONSUMPTION
@OData.publish: true
define view ZC_SUPPLIERCOUNT as select from ZI_SUPPLIERCOUNT as a
{
    @EndUserText.label:  'REGION'
    key a.Region,
    
    @EndUserText.label:  'Country Name'
    key a.Country_Name,
    
    @EndUserText.label:  'Supplier Count'
    a.SupplierCount
}
