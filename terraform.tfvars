name        = "Customized Dashboard"
permissions = "public_read_only"

dashboard = {

  pagename = "TF-dashboard"


  title1  = "widget1"
  row1    = 1
  column1 = 1
  width1  = 5
  height1 = 3
  text1   = <<-EOT
Data represent a snapshot every 60s, not an average of that duration      
90th percentile of 10 minutes, eliminates the highest value in that period  
Does System vs User Percentage matter? Servers holding the tag CT_spc_MID_SQL are excluded
 
---
 
# Configuration according to Alert Policies:
 
Windows:
- WARN: >75% for 30 minutes (#fcf142, yellow line)
- CRIT: >95% for 60 minutes (#114242, red line)
 
Linux:
 
- WARN: >75% for 20 minutes
- CRIT: >95% for 60 minutes
EOT



  title2  = "widget2"
  row2    = 2
  column2 = 1
  width2  = 12
  height2 = 5
  text2   = <<-EOT
  1. Customer enters tier cara details ana proceeds to pay.
2. New Checkout makes a can to the Payment Service via the erapoint. Cach payment methOd has its own gateway and it is per storenamc.`initpayment=Intialise`
3. It the payment gateway successtuny authorises the payment. a response is sent back to the Payment Service saying success: true. TNs happens real-time and mt via a caUback. Options are Accepted, Not Accepted. Manual Review.
4. If Accepted or h Review, Payment Service rakes a request to MESH Platform via Internal API ana aSkS MESH to create the order with the correct Status (Paid. In Review, etc.)
5. MESH Platform creates the order and also writes it to RabbitMQ which sits on the Kubernetes RabbitMQ is written to so that data can be sent to various systems such as MESH Metrics and ClastiSearch (used by MESH Control).
6. MESH Platform then respmas back to the Payment Service via Internal API to confirm that the order has been created.
7. Payment Service then tells the new Checkout that the order has been created and the customer won be Shown the Order Cmfimation Page.
8. It was in review in step 3, once review is comoted, Adyen will send callback to Kubernetes endpoint ana NOT the new payment service. This message then goes to the SCS queue and those messages Will be sent to the notifications endpoint on the Payment Serviceto be ncessed. That win then
---
#### Note: Desktop and Mobile sites talk to the Payment Service via the Internal API. Apps go through the same process but talk to Payment Service directly via the hostname https://paymentservice.eks.jdgroupmesh.cloud which is public.
 
---
#### At point 6. the payment service and the new checkout only wait for 25 seconds for a response from MESH Platform. Any longer than this and the customer will see a 'Redirection Error' error message and point 7 will never happen.
 
---
#### Other points to note
• NO gerwire reuests to endpoint Stnuid be blOCked. This endpoint is used by the Payment Inqestor Service (SCS Queue) which can be seen here to notify the Pavrent Ot any Adyen and Mdpay/Razerpay CaUböCkS. It these are blOCked Ot error (IEn-200). it could kad to orders notoroarcssna. requestsqoinqtothis A Koolic exists in Ceauence called Pavant service it win mean no reauests to oe blocked.
EOT
}
