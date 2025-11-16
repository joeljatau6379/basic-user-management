Basic User Management Smart Contract

Overview
`basic-user-management` is a Clarity smart contract designed for the Stacks blockchain.  
It provides a foundational system for user registration, profile data storage, admin oversight,  
and secure user data management.

This contract can serve as a starting point for decentralized applications (dApps) that require  
user onboarding, identity storage, permission systems, or account-level configuration.

---

Features

✔ User Registration  
Users can register themselves with custom profile data.

✔ User Data Update  
Registered users can update their own information.

✔ Admin Oversight  
The contract admin can reset or clear any user’s data when necessary.

✔ Read-Only Queries  
Retrieve user profiles, check registration status, and view admin details.

✔ Modular & Extendable  
Designed to be extended to support:
- Permissions/roles  
- Token interactions  
- dApp user profiles  
- Access control logic  
- Voting or participation systems  

---

Data Structures

**Users Map**
Stores user profiles keyed by principal:
```clarity
(define-map users
  ((user principal))
  ((data (string-ascii 100))))
