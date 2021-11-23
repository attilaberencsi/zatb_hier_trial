@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Hierarchy Trial'
@Metadata.ignorePropagatedAnnotations: true
@AbapCatalog: { sqlViewName: 'ZATB_HIER_BIF' }

@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
@Metadata: {
  allowExtensions: true
}
@OData.publish: true
define view ZATB_I_TrialHierarchy
  with parameters
    p_begda : sydatum,
    p_endda : sydatum

  as select from ZATB_TF_TrialHierarchy(
                   p_clnt : $session.client,
                   p_begda :$parameters.p_begda,
                   p_endda :$parameters.p_endda )
{
  key hierarchy_rank,
      hierarchy_parent_rank,
      parent_id,
      node_id,
      hierarchy_level,
      hierarchy_tree_size,
      parent_id as ProcessIdLookup
}
