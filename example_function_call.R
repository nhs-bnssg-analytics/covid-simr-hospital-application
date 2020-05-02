
setwd("...")

source("covid_simr-gamma.R")

cases_no_isolation<-read.csv("no-isolation.csv")
cases_isolation<-read.csv("isolation.csv")
cases_isolation_flattened<-read.csv("isolation-flattened.csv")

nreps=1000

galpha1<-1.660265
gbeta1<-0.205719
galpha75<-1.659735
gbeta75<-0.274203
galpha125<-1.660882
gbeta125<-0.164646


# scenario1: do nothing
covid_simr("scenario1",cases=cases_no_isolation,galpha=galpha1,gbeta=gbeta1,cap=45,pfat=0.99,nreps=nreps)

# scenario2: isolation strategy
covid_simr("scenario2",cases=cases_isolation,galpha=galpha1,gbeta=gbeta1,cap=45,pfat=0.99,nreps=nreps)

# scenario3: increase capacity to 76
covid_simr("scenario3",cases=cases_isolation,galpha=galpha1,gbeta=gbeta1,cap=76,pfat=0.99,nreps=nreps)

# scenario4: increase capacity to 100
covid_simr("scenario4",cases=cases_isolation,galpha=galpha1,gbeta=gbeta1,cap=100,pfat=0.99,nreps=nreps)

# scenario5: example mitigation - reduce LOS by 25%
covid_simr("scenario5",cases=cases_isolation,galpha=galpha75,gbeta=gbeta75,cap=45,pfat=0.99,nreps=nreps)

# scenario6: increase LOS by 25%
covid_simr("scenario6",cases=cases_isolation,galpha=galpha125,gbeta=gbeta125,cap=45,pfat=0.99,nreps=nreps)

# scenario7: flatten curve (stretch 50%)
covid_simr("scenario7",cases=cases_isolation_flattened,galpha=galpha1,gbeta=gbeta1,cap=45,pfat=0.99,nreps=nreps)

# scenario8: flatten curve (stretch 50%) + increase capacity to 100 + reduce LOS by 25%
covid_simr("scenario8",cases=cases_isolation_flattened,galpha=galpha75,gbeta=gbeta75,cap=100,pfat=0.99,nreps=nreps)



# scenario 99: no capacity constraint
covid_simr("scenario99",cases=cases_isolation,galpha=galpha1,gbeta=gbeta1,cap=10000,pfat=0.99,nreps=nreps)



