"! <p class="shorttext synchronized" lang="en">Data Provider Secondary Class</p>
CLASS zcl_atb_hier_trial_dpc_ext DEFINITION
  PUBLIC
  INHERITING FROM zcl_atb_hier_trial_dpc
  CREATE PUBLIC .

  PUBLIC SECTION.

  PROTECTED SECTION.
    METHODS zatb_i_trialhi01_get_entityset REDEFINITION.
    METHODS zatb_i_trialhier_get_entityset REDEFINITION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_atb_hier_trial_dpc_ext IMPLEMENTATION.
  METHOD zatb_i_trialhi01_get_entityset.
    if_sadl_gw_dpc_util~get_dpc( )->get_entityset( EXPORTING io_tech_request_context = io_tech_request_context
                                                   IMPORTING et_data                 = et_entityset
                                                             es_response_context     = es_response_context ).
  ENDMETHOD.



  METHOD zatb_i_trialhier_get_entityset.
    if_sadl_gw_dpc_util~get_dpc( )->get_entityset( EXPORTING io_tech_request_context = io_tech_request_context
                                                   IMPORTING et_data                 = et_entityset
                                                             es_response_context     = es_response_context ).
  ENDMETHOD.

ENDCLASS.
