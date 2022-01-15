insur<-read.table("insurance.csv",header=T,sep=",")
attach(insur)
str(insur)
'data.frame':	2182 obs. of  7 variables:
  $ Kilometres: int  1 1 1 1 1 1 1 1 1 1 ...
$ Zone      : int  1 1 1 1 1 1 1 1 1 1 ...
$ Bonus     : int  1 1 1 1 1 1 1 1 1 2 ...
$ Make      : int  1 2 3 4 5 6 7 8 9 1 ...
$ Insured   : num  455.1 69.2 72.9 1292.4 191 ...
$ Claims    : int  108 19 13 124 40 57 23 14 1704 45 ...
$ Payment   : int  392491 46221 15694 422201 119373 170913 56940 77487 6805992 214011 ...

# 1.-Obtain a visualization that explains with an image the distribution of each of the variables

#a)Kilometres

plot_ly(x=insur$Kilometres, type="histogram", histnorm="probability") % > %
 layout(title="Histogram of Kilometers", xaxis=list(title="Kilometres"), yaxis=list(title="Observations"))

#b)Zones

plot_ly(x=insur$Zone, type="histogram", histnorm="probability")%>%
  layout(title="Histograma of Zones", xaxis=n,list(title="Zones"), yaxis=list(title="Observations"))
#c)Bonus

plot_ly(x=insur$Bonus, type="histogram", histnorm="probability")%>%
  +     layout(title="Histogram of Bonus", xaxis=list(title="Bonus"), yaxis=list(title="Observations"))

#d)Models

plot_ly(x=insur$Make, type="histogram", histnorm="probability")%>%
  +     layout(title="Histogram of Model", xaxis=list(title="Model"), yaxis=list(title="Observations"))

#e)Insured

plot_ly(x=insur$Insured, type="histogram", histnorm="probability")%>%
  +     layout(title="Histogram of Insured", xaxis=list(title="Insured"), yaxis=list(title="Observations"))

#f)Claims

plot_ly(x=insur$Claims, type="histogram", histnorm="probability")%>%
  +     layout(title="Histograma de Reclamos", xaxis=list(title="Reclamos"), yaxis=list(title="Observaciones"))

#g)Payments
plot_ly(x=insur$Payment, type="histogram", histnorm="probability")%>%
  +     layout(title="Histogram of Payments", xaxis=list(title="Payments"), yaxis=list(title="Observations"))


# 2. Create categories based on the number of claims, severity, risk etc

a) Kilometres

insurance_data_kilometres<-insur %>% group_by(Kilometres)

insurance_data_kilometres<-insur %>% group_by(Kilometres) %>% 
  summarise(sum_insured=sum(Insured), sum_claims=sum(Claims),
            sum_payments=sum(Payment))

insurance_data_kilometres<-data.frame(insurance_data_kilometres) 

plot_ly(insurance_data_kilometres, x=~Kilometres, y=~sum_insured, type='bar', name='Sum Insured per Kilometers')
plot_ly(insurance_data_kilometres, x=~Kilometres, y=~sum_claims, type='bar', name='Sum Insured per Kilometers')
plot_ly(insurance_data_kilometres, x=~Kilometres, y=~sum_payments, type='bar', name='Sum Insured per Kilometers')

b) Zones

insurance_data_zones<-insur %>% group_by(Zone) %>% 
  summarise(sum_insured=sum(Insured), sum_claims=sum(Claims),
            sum_payments=sum(Payment))

insurance_data_zones<-data.frame(insurance_data_zones)

plot_ly(insurance_data_zones, x=~Zone, y=~sum_insured, type='bar', name='Sum Insured per Zones')
plot_ly(insurance_data_zones, x=~Zone, y=~sum_reclamaciones, type='bar', name='Sum Insured per Zones')
plot_ly(insurance_data_zones, x=~Zone, y=~sum_pagos, type='bar', name='Sum Insured per Zones')
