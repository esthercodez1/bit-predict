;; Title: BitPredict - Decentralized Prediction Markets on Stacks
;; 
;; Summary: A trustless prediction market platform for Bitcoin price movements
;; built on Stacks Layer 2, enabling users to stake STX on market outcomes
;; with transparent oracle resolution and fair reward distribution.
;;

;; Constants
(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u100))
(define-constant err-not-found (err u101))
(define-constant err-invalid-prediction (err u102))
(define-constant err-market-closed (err u103))
(define-constant err-already-claimed (err u104))
(define-constant err-insufficient-balance (err u105))
(define-constant err-invalid-parameter (err u106))

;; Data Variables
(define-data-var oracle-address principal 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM)
(define-data-var minimum-stake uint u1000000)  ;; 1 STX minimum (1,000,000 microSTX)
(define-data-var fee-percentage uint u2)        ;; 2% platform fee
(define-data-var market-counter uint u0)

;; Data Maps
(define-map markets
  uint
  {
    start-price: uint,
    end-price: uint,
    total-up-stake: uint,
    total-down-stake: uint,
    start-block: uint,
    end-block: uint,
    resolved: bool
  }
)

(define-map user-predictions
  {market-id: uint, user: principal}
  {prediction: (string-ascii 4), stake: uint, claimed: bool}
)