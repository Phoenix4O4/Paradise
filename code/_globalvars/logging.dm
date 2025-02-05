// Everything in this file should be protected
GLOBAL_VAR(log_directory)
GLOBAL_PROTECT(log_directory)
GLOBAL_VAR(world_game_log)
GLOBAL_PROTECT(world_game_log)
GLOBAL_VAR(config_error_log)
GLOBAL_PROTECT(config_error_log)
GLOBAL_VAR(world_runtime_log)
GLOBAL_PROTECT(world_runtime_log)
GLOBAL_VAR(world_qdel_log)
GLOBAL_PROTECT(world_qdel_log)
GLOBAL_VAR(world_href_log)
GLOBAL_PROTECT(world_href_log)
GLOBAL_VAR(world_asset_log)
GLOBAL_PROTECT(world_asset_log)
GLOBAL_VAR(runtime_summary_log)
GLOBAL_PROTECT(runtime_summary_log)
GLOBAL_VAR(tgui_log)
GLOBAL_PROTECT(tgui_log)
GLOBAL_VAR(http_log)
GLOBAL_PROTECT(http_log)
GLOBAL_VAR(sql_log)
GLOBAL_PROTECT(sql_log)
GLOBAL_VAR(round_id)
GLOBAL_PROTECT(round_id)

#ifdef REFERENCE_TRACKING
GLOBAL_VAR(gc_log)
GLOBAL_PROTECT(gc_log)
#endif

GLOBAL_LIST_EMPTY(jobMax)
GLOBAL_PROTECT(jobMax)
GLOBAL_LIST_EMPTY(admin_log)
GLOBAL_PROTECT(admin_log)
GLOBAL_LIST_EMPTY(lastsignalers)
GLOBAL_PROTECT(lastsignalers)
GLOBAL_LIST_EMPTY(lawchanges)
GLOBAL_PROTECT(lawchanges)

GLOBAL_LIST_EMPTY(combatlog)
GLOBAL_PROTECT(combatlog)
GLOBAL_LIST_EMPTY(IClog)
GLOBAL_PROTECT(IClog)
GLOBAL_LIST_EMPTY(OOClog)
GLOBAL_PROTECT(OOClog)

GLOBAL_DATUM_INIT(logging, /datum/logging, new /datum/logging())

GLOBAL_LIST_INIT(investigate_log_subjects, list("notes", "watchlist", "hrefs"))
