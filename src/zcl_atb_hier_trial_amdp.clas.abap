"! <p class="shorttext synchronized" lang="en">AMDP for Hierarchy Retrieval</p>
CLASS zcl_atb_hier_trial_amdp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_amdp_marker_hdb.
    CLASS-METHODS get_chains FOR TABLE FUNCTION ZATB_TF_TrialHierarchy.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_atb_hier_trial_amdp IMPLEMENTATION.
  METHOD get_chains BY DATABASE FUNCTION FOR HDB LANGUAGE SQLSCRIPT OPTIONS READ-ONLY.
    declare source_items table (
      parent_object_id nvarchar(20),
      object_id  nvarchar(20)
    );
    declare i integer;
    declare j integer;
    declare k integer;

    --level1
    FOR i IN 1..9 DO
      :source_items.insert(( null, 'OBJECT_' || i ));
    END for;

    --level2
    FOR I IN 1..9 DO
      FOR j IN 1..9 DO
        :source_items.insert(( 'OBJECT_' || i, 'OBJECT_' || i || '_' || j ));
      END for;
    END for;

    --level3
    FOR I IN 1..9 DO
      FOR j IN 1..9 DO
        FOR k IN 1..9 DO
          :source_items.insert(('OBJECT_' || i || '_' || j, 'OBJECT_' || i || '_' || j || '_' || k ));
        END for;
      END for;
    END for;

    chains = select :p_clnt as client,
                    parent_id,
                    node_id,
                    lpad(hierarchy_level, 2,'0'  ) as hierarchy_level,
                    lpad(hierarchy_rank, 8,'0' ) as hierarchy_rank,
                    lpad(hierarchy_parent_rank, 8,'0' ) as hierarchy_parent_rank,
                    hierarchy_tree_size
             from  hierarchy ( source ( select parent_object_id as parent_id,
                                               object_id as node_id
                                        from :source_items order by node_id
                                      ) )  order by hierarchy_rank;

      RETURN :chains;

  ENDMETHOD.

ENDCLASS.
