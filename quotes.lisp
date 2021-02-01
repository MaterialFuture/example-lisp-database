;;;; Quotes/Invoices Generation
;;;; Use MySQL db records to create invoice for whatever
;;;; This is an example app testing the functionality of CLOS and mito for a (somewhat) realword application

(mito:connect-toplevel :sqlite3
                       :database-name "Quotes"
                       :username "admin-db"
                       :password "pass12345!@##$")

(mito:deftable user ()
  ((name :col-type (:varchar 64))
   (email :col-type (or (:varchar 128) :null))))
