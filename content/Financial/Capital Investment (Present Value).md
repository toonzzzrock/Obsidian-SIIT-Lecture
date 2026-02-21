---
title: "Capital Investment (Present Value)"
created_date: "2026-02-10"
tags: []
relates: 
source: 
status: To_process
Note_types:
  - Permanent_note
---
> [!note]
> Salvage value is the estimated resale value at the end of its useful life.
# Capital Investment (Present Value)

Capital Budgeting use **annual net cash flow**: Depreciation is not a cash outflow.

![[Pasted image 20260210223231.png]]

## Depreciation

The **straight-line depreciation** method allocates an equal amount of depreciation expense each year over the useful life of the asset.

$$\text{Annual Depreciation} = \frac{\text{Initial Investment} - \text{Salvage Value}}{\text{Useful Life (years)}}$$
## Payback Period

The **payback period** is the length of time required to recover the cost of an investment.

$$\text{Payback Period} = \frac{\text{Initial Investment}}{\text{Annual Net Cash Inflow}}$$

## Return on Average Investment

The **return on average investment** measures the profitability of an investment as a percentage of the average investment over its useful life.

$$\text{ROI} = \frac{\text{Average Annual Net Income}}{\text{Average Investment}}$$
where:
- $\text{Average Investment} = (\text{Initial Investment} + \text{Salvage Value})/2$

 
## Discounting Future Cash Flows

To account for the time value of money, future cash flows are discounted to their present value using a discount rate. Then calculate the present value of cash inflows and cash outflows. Net present value (NPV) is the difference between the present value of cash inflows and outflows.

$$\text{NPV} = \text{Present Value of Cash Inflows} - \text{Present Value of Cash Outflows}$$

When NPV is :
- positive: Accept the project
- zero: Indifferent
- negative: Reject the project
### PV Factor

For Salvage Value, it tells you what $1 received $n$ years from now is worth today.

Ex. with 15% interest rate

$$\text{PV Factor} = \frac{1}{(1 + r)^n}$$

where:
- $r$ = discount rate (15% = 0.15)
- $n$ = number of years

| Year | PV Factor (15%) |
| ---- | --------------- |
| 1    | 0.8696          |
| 2    | 0.7561          |
| 3    | 0.6575          |
| 4    | 0.5718          |
| 5    | 0.4972          |

## Annuity Factor

For Annual Net Cash Inflow, it tells you what a series of $1 payments received over $n$ years is worth today.

Ex. with 15% interest rate

$$\text{Annuity Factor} = \frac{1 - (1 + r)^{-n}}{r}$$
where:
- $r$ = discount rate (15% = 0.15)
- $n$ = number of years

| Year | Annuity Factor (15%) |
| ---- | -------------------- |
| 1    | 0.8696               |
| 2    | 1.5887               |
| 3    | 2.2832               |
| 4    | 2.8550               |
| 5    | 3.3522               |
![[Pasted image 20260210225855.png]]

![[Pasted image 20260210230047.png]]
