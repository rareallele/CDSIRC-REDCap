-- SQL TO REPAIR REDCAP TABLES
USE `redcap`;
SET SESSION SQL_SAFE_UPDATES = 0;
SET FOREIGN_KEY_CHECKS = 0;
ALTER TABLE `redcap_form_display_logic_conditions` ADD FOREIGN KEY (`project_id`) REFERENCES `redcap_projects` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `redcap_form_display_logic_targets` ADD FOREIGN KEY (`control_id`) REFERENCES `redcap_form_display_logic_conditions` (`control_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `redcap_form_display_logic_targets` ADD FOREIGN KEY (`event_id`) REFERENCES `redcap_events_metadata` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `redcap_multilanguage_config` ADD FOREIGN KEY (`project_id`) REFERENCES `redcap_projects` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `redcap_multilanguage_config_temp` ADD FOREIGN KEY (`project_id`) REFERENCES `redcap_projects` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `redcap_multilanguage_metadata` ADD FOREIGN KEY (`project_id`) REFERENCES `redcap_projects` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `redcap_multilanguage_metadata_temp` ADD FOREIGN KEY (`project_id`) REFERENCES `redcap_projects` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `redcap_multilanguage_snapshots` ADD FOREIGN KEY (`created_by`) REFERENCES `redcap_user_information` (`ui_id`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `redcap_multilanguage_snapshots` ADD FOREIGN KEY (`deleted_by`) REFERENCES `redcap_user_information` (`ui_id`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `redcap_multilanguage_snapshots` ADD FOREIGN KEY (`edoc_id`) REFERENCES `redcap_edocs_metadata` (`doc_id`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `redcap_multilanguage_snapshots` ADD FOREIGN KEY (`project_id`) REFERENCES `redcap_projects` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `redcap_multilanguage_ui` ADD FOREIGN KEY (`project_id`) REFERENCES `redcap_projects` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `redcap_multilanguage_ui_temp` ADD FOREIGN KEY (`project_id`) REFERENCES `redcap_projects` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `redcap_projects` ADD FOREIGN KEY (`protected_email_mode_logo`) REFERENCES `redcap_edocs_metadata` (`doc_id`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `redcap_twilio_error_log` ADD FOREIGN KEY (`alert_sent_log_id`) REFERENCES `redcap_alerts_sent_log` (`alert_sent_log_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `redcap_twilio_error_log` ADD FOREIGN KEY (`ssq_id`) REFERENCES `redcap_surveys_scheduler_queue` (`ssq_id`) ON DELETE CASCADE ON UPDATE CASCADE;
SET FOREIGN_KEY_CHECKS = 1;