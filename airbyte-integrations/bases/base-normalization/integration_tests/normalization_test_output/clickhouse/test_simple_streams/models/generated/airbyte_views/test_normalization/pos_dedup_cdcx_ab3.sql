{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_test_normalization",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
select
    {{ dbt_utils.surrogate_key([
        'id',
        'name',
        '_ab_cdc_lsn',
        '_ab_cdc_updated_at',
        '_ab_cdc_deleted_at',
        '_ab_cdc_log_pos',
    ]) }} as _airbyte_pos_dedup_cdcx_hashid,
    tmp.*
from {{ ref('pos_dedup_cdcx_ab2') }} tmp
-- pos_dedup_cdcx
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at') }}

