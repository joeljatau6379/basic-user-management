;; Basic User Management Contract

;; Added missing map definition - this was causing the "unresolved map" error
(define-map users {user: principal} {data: (string-ascii 100)})

;; Added missing admin variable definition
(define-data-var admin principal tx-sender)

;; Register a new user with some data
(define-public (register (user-data (string-ascii 100)))
  (begin
    (map-set users {user: tx-sender} {data: user-data})
    (ok true)
  )
)

;; Update data for the sender
(define-public (update-data (new-data (string-ascii 100)))
  (begin
    (map-set users {user: tx-sender} {data: new-data})
    (ok true)
  )
)

;; Admin-only function: reset a user's data
(define-public (reset-user (target principal))
  (if (is-eq tx-sender (var-get admin))
      (begin
        (map-set users {user: target} {data: ""})
        (ok true))
      (err u100) ;; Error: Not authorized
  )
)

;; Get data of a specific user
(define-read-only (get-user-data (user principal))
  (default-to "" (get data (map-get? users {user: user}))))
