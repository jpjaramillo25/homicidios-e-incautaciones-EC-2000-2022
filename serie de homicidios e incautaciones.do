
*modelo de incautaciones

reg lnincautaciones lnsembrios base_manta correa cam_est, robust

outreg2 using serie.doc, ctitle(lnincautaciones) replace


estat dwatson

predict predichos

predict res, residuals

dfuller res

sfrancia res


twoway (line lnincautaciones tiempo) (scatter predichos tiempo)

twoway (scatter res tiempo)


drop res predichos


newey lnincautaciones lnsembrios base_manta correa cam_est, lag(1)

outreg2 using serie.doc, ctitle(lnincautaciones) append



*quiebre estructural

reg  lnincautaciones
estat sbsingle

****en 2013


reg  incautacionec
estat sbsingle

****en 2016



***********

reg d.lnhomi l.lnhomi lnincautaciones lnsembrios base_manta correa cam_est, robust
outreg2 using serie.doc, ctitle(d.lnhomicides) append

estat dwatson

predict res, residuals

dfuller res

sfrancia res

drop res


reg d.lnhomi l.lnhomi lnincautaciones lnsembrios base_manta correa cam_est lasso , robust
outreg2 using serie.doc, ctitle(d.lnhomicides) append


estat dwatson

predict res, residuals

dfuller res

sfrancia res

drop res


****


twoway (lfitci lnincautaciones lnsembrios) (scatter lnincautaciones lnsembrios)

twoway (lfitci lnincautaciones tiempo) (scatter lnincautaciones tiempo)


