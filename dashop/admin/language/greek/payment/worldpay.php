<?php
// Heading
$_['heading_title']                      = 'WorldPay';

// Text
$_['text_payment']                       = 'Πληρωμή';
$_['text_success']                       = 'Επιτυχία: Έχετε επεξεργαστεί τις πληροφορίες λογαριασμού του WorldPay!';
$_['text_worldpay']                      = '<a href="https://online.worldpay.com/signup/ee48b6e6-d3e3-42aa-a80e-cbee3f4f8b09" target="_blank"><img src="view/image/payment/worldpay.png" alt="Worldpay" title="Worldpay" style="border: 1px solid #EEEEEE;" /></a>';
$_['text_test']                          = 'Δοκιμαστική λειτουργία';
$_['text_live']                          = 'Κανονική λειτουργία (Live)';
$_['text_authenticate']                  = 'Ταυτοποίηση';
$_['text_release_ok']                    = 'Η αποδέσμευση ήταν επιτυχημένη.';
$_['text_release_ok_order']              = 'Η αποδέσμευση ήταν επιτυχημένη και η κατάσταση παραγγελίας ανανεώθηκε σε επιτυχημένη - τακτοποιήθηκε.';
$_['text_refund_ok']                     = 'Η επιστροφή ήταν επιτυχημένη.';
$_['text_refund_ok_order']               = 'Η επιστροφή ήταν επιτυχημένη και η κατάσταση παραγγελίας ανανεώθηκε σε επιστραμμένη.';
$_['text_void_ok']                       = 'Η ακύρωση ήταν επιτυχημένη και η κατάσταση παραγγελίας ανανεώθηκε σε ακυρωμένη.';

// Entry
$_['entry_service_key']                  = 'Κλειδί Υπηρεσίας (Service Key)';
$_['entry_client_key']                   = 'Κλειδί Πελάτη (Client Key)';
$_['entry_total']                        = 'Σύνολο';
$_['entry_order_status']                 = 'Κατάσταση Παραγγελίας';
$_['entry_geo_zone']                     = 'Γεωγραφική Ζώνη';
$_['entry_status']                       = 'Κατάσταση';
$_['entry_sort_order']                   = 'Σειρά Ταξινόμησης';
$_['entry_debug']                        = 'Λειτουργία Εντοπισμού Σφαλμάτων';
$_['entry_card']                         = 'Αποθήκευση Καρτών';
$_['entry_secret_token']                 = 'Μυστικό διακριτικό (token)';
$_['entry_webhook_url']                  = 'Διεύθυνση URL Webhook:';
$_['entry_cron_job_url']                 = 'Διεύθυνση URL των Cron Job:';
$_['entry_last_cron_job_run']            = 'Χρόνος εκτέλεσης τελευταίου Cron Job:';
$_['entry_success_status']               = 'Κατάσταση επιτυχίας:';
$_['entry_failed_status']                = 'Κατάσταση Απέτυχε (Failed):';
$_['entry_settled_status']               = 'Κατάσταση διευθετημένου:';
$_['entry_refunded_status']              = 'Κατάσταση Επιστροφή Χρημάτων (Refunded):';
$_['entry_partially_refunded_status']    = 'Κατάσταση Εν μέρει επιστροφής χρημάτων:';
$_['entry_charged_back_status']          = 'Επαναχρέωση:';
$_['entry_information_requested_status'] = 'Κατάσταση ζητούμενων πληροφοριών:';
$_['entry_information_supplied_status']  = 'Κατάσταση παρεχόμενων πληροφοριών:';
$_['entry_chargeback_reversed_status']   = 'Κατάσταση επιστροφής επαναχρέωσης:';


$_['entry_reversed_status']              = 'Κατάσταση Αντιστροφή χρέωσης (Reversed):';
$_['entry_voided_status']                = 'Κατάσταση Ακυρώθηκε (Voided):';

// Help
$_['help_total']                         = 'Το συνολικό ποσό που πρέπει να φτάσει η παραγγελία για να ενεργοποιηθεί η μέθοδος πληρωμής.';
$_['help_debug']                         = 'Η ενεργοποίηση εντοπισμού σφαλμάτων θα γράψει ευαίσθητα δεδομένα σε ένα αρχείο καταγραφής. Θα πρέπει πάντα να την έχετε απενεργοποιημένη εκτός αν σας δοθούν διαφορετικές οδηγίες.';
$_['help_secret_token']                  = 'Κάντε το μακρύ και δύσκολο να μαντέψει κανείς';
$_['help_webhook_url']                   = 'Ορίστε το Worldpay webhooks να καλέσει αυτήν τη διεύθυνση';
$_['help_cron_job_url']                  = 'Ορίστε ένα Cron Job για να καλέσετε αυτήν τη διεύθυνση';

// Tab
$_['tab_settings']                       = 'Ρυθμίσεις';
$_['tab_order_status']                   = 'Κατάσταση Παραγγελίας';

// Error
$_['error_permission']                   = 'Ειδοποίηση: Δεν έχετε άδεια να επεξεργαστείτε αυτο το module!';
$_['error_service_key']                  = 'Απαιτείται το κλειδί Υπηρεσίας (Service Key)!';
$_['error_client_key']                   = 'Απαιτείται το κλειδί Πελάτη (Client Key)!';

// Order page - payment tab
$_['text_payment_info']                  = 'Πληροφορίες πληρωμής';
$_['text_refund_status']                 = 'Επιστροφή πληρωμής';
$_['text_order_ref']                     = 'Αριθμός παραγγελίας';
$_['text_order_total']                   = 'Σύνολο εγκεκριμένων';
$_['text_total_released']                = 'Σύνολο αποδεσμευμένων';
$_['text_transactions']                  = 'Συναλλαγές';
$_['text_column_amount']                 = 'Ποσό';
$_['text_column_type']                   = 'Τύπος';
$_['text_column_date_added']             = 'Δημιουργήθηκε';

$_['text_confirm_refund']                = 'Είστε βέβαιοι ότι θέλετε να επιστρέψετε την πληρωμή;';

$_['btn_refund']                         = 'Έκπτωση / επιστροφή χρημάτων';

