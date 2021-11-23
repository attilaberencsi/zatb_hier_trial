@EndUserText.label: 'Hierarchy Trial'
define table function ZATB_TF_TrialHierarchy

  with parameters
    @Environment.systemField: #CLIENT
    p_clnt  : abap.clnt,
    p_begda : sydatum,
    p_endda : sydatum
returns
{
  client                : abap.clnt;
  parent_id             : abap.char(20);
  node_id               : abap.char(20);
  hierarchy_level       : abap.numc(2);
  hierarchy_rank        : abap.numc(8);
  hierarchy_parent_rank : abap.numc(8);
  hierarchy_tree_size   : abap.char(20);

}
implemented by method
  zcl_atb_hier_trial_amdp=>get_chains;
