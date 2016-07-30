<?php
// Heading
$_['heading_title']                 = 'SagePay Server';

// Text
$_['text_payment']                  = 'Πληρωμή';
$_['text_success']                  = 'Επιτυχία: Έχετε επεξεργαστεί τις πληροφορίες λογαριασμού του SagePay!';
$_['text_edit']                     = 'Επεξεργασία SagePay Server';
$_['text_sagepay_server']           = '<a href="https://support.sagepay.com/apply/default.aspx?PartnerID=E511AF91-E4A0-42DE-80B0-09C981A3FB61" target="_blank"><img src="view/image/payment/sagepay.png" alt="SagePay" title="SagePay" style="border: 1px solid #EEEEEE;" /></a>';
$_['text_sim']                      = 'Προσομοιωτής';
$_['text_test']                     = 'Δοκιμαστική λειτουργία';
$_['text_live']                     = 'Κανονική λειτουργία';
$_['text_defered']                  = 'Αναβαλλόμενη';
$_['text_authenticate']             = 'Ταυτοποίηση';
$_['text_release_ok']               = 'Η αποδέσμευση ήταν επιτυχημένη.';
$_['text_release_ok_order']         = 'Η αποδέσμευση ήταν επιτυχημένη και η κατάσταση παραγγελίας ανανεώθηκε σε επιτυχημένη - τακτοποιήθηκε.';
$_['text_rebate_ok']                = 'Η επιστροφή ήταν επιτυχημένη.';
$_['text_rebate_ok_order']          = 'Η επιστροφή ήταν επιτυχημένη και η κατάσταση παραγγελίας ανανεώθηκε σε επιστραμμένη.';
$_['text_void_ok']                  = 'Η ακύρωση ήταν επιτυχημένη και η κατάσταση παραγγελίας ανανεώθηκε σε ακυρωμένη.';
$_['text_payment_info']             = 'Πληροφορίες πληρωμής';
$_['text_release_status']           = 'Αποδεσμευμένη πληρωμή';
$_['text_void_status']              = 'Ακυρωμένη πληρωμή';
$_['text_rebate_status']            = 'Επιστραμμένη πληρωμή';
$_['text_order_ref']                = 'Αριθμός παραγγελίας';
$_['text_order_total']              = 'Σύνολο εγκεκριμένων';
$_['text_total_released']           = 'Σύνολο αποδεσμευμένων';
$_['text_transactions']             = 'Συναλλαγές';
$_['text_column_amount']            = 'Ποσό';
$_['text_column_type']              = 'Τύπος';
$_['text_column_date_added']        = 'Δημιουργήθηκε';
$_['text_confirm_void']             = 'Είστε βέβαιοι ότι θέλετε να ακυρώσετε την πληρωμή;';
$_['text_confirm_release']          = 'Είστε βέβαιοι ότι θέλετε να αποδεσμεύσετε την πληρωμή;';
$_['text_confirm_rebate']           = 'Είστε βέβαιοι ότι θέλετε να επιστρέψετε την πληρωμή;';

// Entry
$_['entry_vendor']                  = 'Πωλητής';
$_['entry_test']                    = 'Λειτουργία';
$_['entry_transaction']             = 'Μέθοδος Συναλλαγής';
$_['entry_total']                   = 'Σύνολο';
$_['entry_order_status']            = 'Κατάσταση Παραγγελίας';
$_['entry_geo_zone']                = 'Γεωγραφική Ζώνη';
$_['entry_status']                  = 'Κατάσταση';
$_['entry_sort_order']              = 'Σειρά Ταξινόμησης';
$_['entry_debug']                   = 'Καταγραφή εντοπισμού σφαλμάτων';
$_['entry_card']                    = 'Αποθήκευση Καρτών';
$_['entry_cron_job_token']          = 'Μυστικό Πιστοποιητικό (Secret Token)';
$_['entry_cron_job_url']            = 'Διεύθυνση URL του Cron Job';
$_['entry_last_cron_job_run']       = 'Χρόνος εκτέλεσης τελευταίου Cron Job';

// Help
$_['help_total']                    = 'Το συνολικό ποσό που πρέπει να φτάσει η παραγγελία για να ενεργοποιηθεί η μέθοδος πληρωμής.';
$_['help_debug']                    = 'Η ενεργοποίηση εντοπισμού σφαλμάτων θα γράψει ευαίσθητα δεδομένα σε ένα αρχείο καταγραφής. Θα πρέπει πάντα να την έχετε απενεργοποιημένη εκτός αν σας δοθούν διαφορετικές οδηγίες.';
$_['help_transaction']              = 'ΠΡΕΠΕΙ στην πληρωμή να δηλωθεί η μέθοδος συναλλαγής για να επιτραπούν οι πληρωμές συνδρομής.';
$_['help_cron_job_token']           = 'Δημιουργήστε ένα μακρύ και δύσκολο να ανακαλυφθεί.';
$_['help_cron_job_url']             = 'Ορίστε ένα cron job που να καλεί αυτήν τη διεύθυνση.';

// Button
$_['btn_release']                   = 'Αποδέσμευση';
$_['btn_rebate']                    = 'Επιστροφή';
$_['btn_void']                      = 'Ακύρωση';

// Error
$_['error_permission']              = 'Ειδοποίηση: Δεν έχετε άδεια να επεξεργαστείτε την πληρωμή SagePay!';
$_['error_vendor']                  = 'Απαιτείται ο κωδικός πωλητή (Vendor ID)!';