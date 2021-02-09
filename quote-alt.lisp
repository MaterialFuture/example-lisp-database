;; Create Quotes
;; Data is stored, then parsed with an exception for first and last name being concatenated
;; This is supposed to model a somewhat real-world scenario where you might need to partse user data from a data source

;; Initial getting 
(defun create-user (fname lname email addr phone taxex)
  "Create a vector based on user info.
(vector full-name email address phone tax-exemption)"
  ((vector
    ((lambda (x y) (concatenate 'string x " " y)) fname lname) ;cancat fname+lname)
    email ;use outside function to verify valid
    phone ;remove '-'
    addr
    taxex))) ;Bool val for tax exemption

;; Parse the data received
(defun parse-email (em)
  "Check to see if the email is valid"
  (print "Not yet implemented"))

(defun parse-phone (ph)
  "Check to see if the phone number is valid"
  (print "Not yet implemented"))

(defun check-taxex (x)
  "Return something if user is tax exempt"
  (print "Not yet implemented"))
