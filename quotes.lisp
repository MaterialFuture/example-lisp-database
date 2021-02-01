;;;; Quotes/Orders Generation
;;;; Use MySQL db records to create invoice for whatever
;;;; This is an example app testing the functionality of CLOS and mito for a (somewhat) realword application
;;;; Very WIP

(mito:connect-toplevel :sqlite3
                       :database-name "mystore")

;; Create Table for Users
(mito:deftable user ()
  ((fname :col-type (:varchar 64))
   (lname :col-type (:varchar 64))
   (email :col-type (:varchar 128))
   (phone :col-type (or (:varchar 128) :null))
   (billaddr :col-type (or (:text) :null))
   (shipaddr :col-type (or (:text) :null))
   (taxex :col-type (:boolean))
   (review :col-type (:boolean))
   (notes :col-type (or (:text) :null))))
(mito:table-definition 'user)

;; Create Table for Items
(mito:deftable item ()
  ((name :col-type (:varchar 256))
   (desc :col-type (or (:text) :null))
   (stock :col-type (:smallint))
   (type :col-type (:smallint))
   (eol  :col-type (:boolean))
   (notes :col-type (or (:text) :null))))
(mito:table-definition 'item)

;; Create Table for Orders
(mito:deftable order ()
  ((user-id :references (user id))
   (item-id :references (item id)) ;;WIP - turn into a one-to-many
   (quote :col-type (:boolean))
   (notes :col-type (:text))))
(mito:table-definition 'order)

;; Create Test user and test item for testing
(let* ((user  (create-dao 'user :fname "Test"
                                :lname "User"
                                :email "test@test.user"
                                :taxex 0
                                :review 0))
       (user  (create-dao 'item :name "DMB-THNG-0404J"
                                :desc "Dumb Thing #404J - Processor"
                                :stock 12
                                :type 0
                                :eol 0)))
      (user item))
