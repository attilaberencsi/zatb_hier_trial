class ZCL_ATB_HIER_TRIAL_MPC_EXT definition
  public
  inheriting from ZCL_ATB_HIER_TRIAL_MPC
  create public .

public section.
  methods define REDEFINITION.
protected section.
private section.
ENDCLASS.



CLASS ZCL_ATB_HIER_TRIAL_MPC_EXT IMPLEMENTATION.
  METHOD DEFINE.
    super->define( ).
        " Deactivate cached request processing (CRP) for the entity sets that need custom query option handling
    model->get_entity_set( 'ZATB_I_TrialHierarchy' )->set_use_crp( abap_false ) ##NO_TEXT.   " deactivate due to custom query option handling
    model->get_entity_set( 'ZATB_I_TrialHierarchySet' )->set_use_crp( abap_false ) ##NO_TEXT.   " deactivate due to custom query option handling
  ENDMETHOD.

ENDCLASS.
