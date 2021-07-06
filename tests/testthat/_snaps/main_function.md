# Testing main estimation function

    Code
      M_bioChem
    Output
      
      Call: glm.izip(formula = art ~ ., data = bioChemists)
      
      Linear Model Coefficients:
      (Intercept)     femWomen   marMarried         kid5          phd         ment  
         0.324570    -0.228620     0.158890    -0.189540     0.010118     0.024687  
      
      Baseline Zero-inflation odds (nu): 0.286
      Degrees of Freedom: 914 Total (i.e. Null);  909 Residual
      Null Deviance: 1542.813 
      Residual Deviance: 
      AIC: 3240.321 
      

---

    Code
      M_bioChem$coefficients
    Output
      (Intercept)    femWomen  marMarried        kid5         phd        ment 
       0.32456724 -0.22862302  0.15889109 -0.18954308  0.01011813  0.02468722 

---

    Code
      M_bioChem$loglik
    Output
      NULL

---

    Code
      round(M_bioChem$vcov, 5)
    Output
                  (Intercept) femWomen marMarried     kid5      phd   ment
      (Intercept)     0.01401 -0.00258   -0.00378 -0.00019 -0.00291 -1e-05
      femWomen       -0.00258  0.00397    0.00061  0.00050  0.00006  2e-05
      marMarried     -0.00378  0.00061    0.00498 -0.00128  0.00021  0e+00
      kid5           -0.00019  0.00050   -0.00128  0.00214  0.00001 -1e-05
      phd            -0.00291  0.00006    0.00021  0.00001  0.00092 -2e-05
      ment           -0.00001  0.00002    0.00000 -0.00001 -0.00002  0e+00

---

    Code
      M_bioChem1
    Output
      
      Call: glm.izip(formula = art ~ ., data = bioChemists, ref.lambda = 1)
      
      Linear Model Coefficients:
      (Intercept)     femWomen   marMarried         kid5          phd         ment  
         0.324560    -0.228600     0.158930    -0.189460     0.010114     0.024674  
      
      Baseline Zero-inflation odds (nu): 0.572
      Degrees of Freedom: 914 Total (i.e. Null);  909 Residual
      Null Deviance: 1430.489 
      Residual Deviance: 
      AIC: 3240.321 
      

---

    Code
      M_bioChem1$coefficients
    Output
      (Intercept)    femWomen  marMarried        kid5         phd        ment 
       0.32456114 -0.22859890  0.15893481 -0.18945735  0.01011411  0.02467403 

---

    Code
      M_bioChem1$loglik
    Output
      NULL

---

    Code
      M_bioChem1$vcov
    Output
                    (Intercept)      femWomen    marMarried          kid5
      (Intercept)  0.0140063511 -2.575753e-03 -3.779523e-03 -1.940547e-04
      femWomen    -0.0025757531  3.967768e-03  6.132500e-04  4.957369e-04
      marMarried  -0.0037795227  6.132500e-04  4.985307e-03 -1.279502e-03
      kid5        -0.0001940547  4.957369e-04 -1.279502e-03  2.143606e-03
      phd         -0.0029067999  5.885204e-05  2.129834e-04  1.081093e-05
      ment        -0.0000133483  1.527688e-05  1.268387e-06 -9.798793e-06
                            phd          ment
      (Intercept) -2.906800e-03 -1.334830e-05
      femWomen     5.885204e-05  1.527688e-05
      marMarried   2.129834e-04  1.268387e-06
      kid5         1.081093e-05 -9.798793e-06
      phd          9.153723e-04 -1.537875e-05
      ment        -1.537875e-05  4.731954e-06

# Testing main estimation ts function

    Code
      M_arson
    Output
      
      Call: tsglm.izip(formula = arson ~ 1, past_mean_lags = 1, past_obs_lags = c(1, 
          2))
      
      Linear Model Coefficients:
      (Intercept)       beta_1       beta_2      alpha_1  
       8.3152e-01   2.6359e-02   1.7560e-01   1.9442e-09  
      
      Baseline Zero-inflation odds (nu): 0.33

---

    Code
      M_arson$coefficients
    Output
       (Intercept)       beta_1       beta_2      alpha_1 
      8.315154e-01 2.635916e-02 1.756004e-01 1.944171e-09 

---

    Code
      M_arson$loglik
    Output
      NULL

---

    Code
      M_arson$vcov
    Output
                    [,1]          [,2]          [,3]         [,4]
      [1,]  2.304972e-01 -0.0002056272  5.774753e-05 -0.213752728
      [2,] -2.056272e-04  0.0069813766 -1.612592e-04 -0.006356661
      [3,]  5.774753e-05 -0.0001612592  7.896905e-03 -0.006250237
      [4,] -2.137527e-01 -0.0063566605 -6.250237e-03  0.217358684

# Testing function that extracting info from glm.izip

    Code
      coef(M_bioChem)
    Output
      (Intercept)    femWomen  marMarried        kid5         phd        ment 
       0.32456724 -0.22862302  0.15889109 -0.18954308  0.01011813  0.02468722 

---

    Code
      summary(M_bioChem)
    Output
      
      Call: glm.izip(formula = art ~ ., data = bioChemists)
      
      Deviance Residuals: 
         Min      1Q  Median      3Q     Max  
      -3.377  -1.423  -0.338   0.520   5.349  
      
      Linear Model Coefficients:
                   Estimate   Std.Err Z value Pr(>|z|)    
      (Intercept)  0.324567  0.118344   2.743 0.006096 ** 
      femWomen    -0.228623  0.062988  -3.630 0.000284 ***
      marMarried   0.158891  0.070602   2.251 0.024417 *  
      kid5        -0.189543  0.046299  -4.094 4.24e-05 ***
      phd          0.010118  0.030253   0.334 0.738041    
      ment         0.024687  0.002175  11.352  < 2e-16 ***
      ---
      Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
      
      (Baseline zero-inflation odds for iZIP estimated to be 0.2861)
      
      (The baseline Poisson rate for iZIP is set at 1.693)
      
      
          Null deviance: 1542.8  on 914 degrees of freedom
      Residual deviance: 1405.5  on 909 degrees of freedom
      
      AIC: 3240.321 
      

---

    Code
      logLik(M_bioChem)
    Output
      'log Lik. ' -1613.16 (df=7)

---

    Code
      nobs(M_bioChem)
    Output
      [1] 915

---

    Code
      AIC(M_bioChem)
    Output
      [1] 3240.321

---

    Code
      AIC(M_bioChem, k = log(nobs(M_bioChem)))
    Output
      [1] 3274.053

---

    Code
      coef(M_bioChem)
    Output
      (Intercept)    femWomen  marMarried        kid5         phd        ment 
       0.32456724 -0.22862302  0.15889109 -0.18954308  0.01011813  0.02468722 

---

    Code
      fitted(M_bioChem)
    Output
        [1] 1.9773678 1.3031830 1.3257927 1.4621622 2.1722313 0.9621813 1.2241940
        [8] 1.2624707 1.6810798 1.3066714 2.0140305 1.5288522 1.1932609 1.4740089
       [15] 1.3138303 1.1640397 1.5649942 1.5979360 1.3535783 1.4355326 1.5308538
       [22] 1.0190190 1.5852753 1.5244016 0.9679666 1.4109687 1.3479813 1.5089042
       [29] 1.1356546 1.7878147 1.1276395 2.0634160 1.5404982 1.4131416 1.3624640
       [36] 1.1231986 1.1203610 1.8042752 1.4270849 1.5162109 1.8042752 1.1832818
       [43] 1.6285115 1.1892832 1.6387580 1.3577849 1.7047882 3.1100404 1.6282431
       [50] 1.6355778 1.6387596 0.9009386 1.5381316 2.0634160 1.4421812 1.4754368
       [57] 1.1945838 1.4197412 1.4308455 1.4254918 1.3139073 1.3704831 1.2619222
       [64] 1.4049868 1.3569270 1.4857251 2.1733436 1.9128229 1.3718705 1.1119475
       [71] 1.4849663 0.9065165 1.3466688 1.5179313 1.4427275 1.2890597 1.1340810
       [78] 1.4063020 1.5530462 1.2864153 1.1812424 1.1340526 2.1655770 1.9231082
       [85] 2.6508399 1.1483982 2.7275496 1.3289213 2.7072199 1.6766697 1.4362122
       [92] 1.3267885 1.7716082 2.6508399 1.6321406 1.9574614 1.7661654 1.3571438
       [99] 1.0125187 2.0634160 1.2934632 1.3704831 1.3382303 1.4708802 1.1587863
      [106] 1.4552268 1.5929519 1.3031830 1.0113153 0.9599448 1.7533086 1.1245632
      [113] 1.1602826 1.8824883 1.2521662 1.5127258 1.8206720 1.0953714 1.4754368
      [120] 1.4599462 1.3697557 1.4220878 1.7545947 1.1524378 1.1782593 1.9036763
      [127] 1.3921982 1.7599967 1.4131416 1.4867391 1.1862729 2.4490941 1.4911095
      [134] 1.2305336 1.4043571 2.4393570 1.5639855 1.2598809 0.9689465 1.2034996
      [141] 1.0948174 1.3519947 1.4188725 1.1892832 1.1800478 1.0342619 1.6564991
      [148] 1.1800478 1.7626700 1.1319748 1.4852669 1.7993150 1.4433961 1.2615294
      [155] 1.4976412 1.5522607 1.3036189 1.3465325 1.4865254 2.0337755 1.4261831
      [162] 1.1718391 1.4179267 1.4040729 1.7800443 1.2907178 1.6818217 1.5246705
      [169] 1.6709762 1.5919851 1.4071208 1.3811677 1.1573456 1.4342245 1.1938945
      [176] 1.2003997 1.6152799 1.3005498 1.0723031 1.3704831 1.0952605 2.1931382
      [183] 1.7647363 1.8430281 1.6013873 1.6198706 1.2493446 1.5458866 1.1091383
      [190] 1.3808868 1.1208145 1.2928154 1.1288953 1.6985897 1.5836109 1.6409766
      [197] 1.3294761 0.9121288 2.0673067 0.8944443 1.5566060 1.5550904 1.2133798
      [204] 1.2518754 1.3849447 0.9248597 1.4266161 1.4448045 1.1236445 1.3218307
      [211] 1.1768648 1.3910649 1.3486634 1.1912411 1.3714199 1.8042752 1.8177269
      [218] 1.9640102 1.5296167 1.9314207 1.7912550 1.5335215 1.6197677 1.4422911
      [225] 1.4039921 1.6788134 1.4448045 1.1738565 1.5268318 1.8325002 1.3603111
      [232] 2.6577200 1.4328667 1.7421024 1.7545947 1.5773255 1.2263016 2.0965061
      [239] 1.3704831 1.6346196 1.1495275 1.1609815 1.5970263 1.5833106 1.5179313
      [246] 1.4254918 1.3023005 1.6330262 1.1711268 1.1601595 2.3135747 1.7173537
      [253] 1.2611563 1.8307157 1.2378954 1.2058777 1.3887334 1.4991067 1.5802697
      [260] 1.7478546 1.5459910 1.4721096 1.3704831 1.1368043 1.2179308 1.7793347
      [267] 1.1488642 3.4281702 1.2856730 1.5920170 1.3243742 1.8127697 1.3657251
      [274] 1.6601906 1.6968081 1.8365839 1.1994331 1.9314207 0.9380774 1.4811279
      [281] 1.3205713 1.6564991 1.3179081 1.3043702 1.9787588 1.1800478 1.8265765
      [288] 2.0322570 1.5975111 2.2766544 2.0018406 1.7679161 1.7403406 1.5027705
      [295] 1.4390841 1.6924138 2.4489409 0.9590960 1.5558712 1.8035433 1.6318699
      [302] 1.5746833 3.8183646 1.4350128 1.5740870 1.6632170 1.6604559 1.2430401
      [309] 1.9255574 1.3959544 1.1437609 2.0923384 2.2220374 1.9964641 2.0415212
      [316] 1.3140403 2.2581544 1.3384611 1.3698347 1.5626223 1.7775335 2.0358344
      [323] 1.2429143 1.8986034 1.9608801 1.4914972 1.2133798 9.1416541 1.8867542
      [330] 1.5072242 1.6754760 1.3025238 2.0714405 1.9640102 1.4000201 1.3922854
      [337] 1.3927080 1.4362122 1.5139508 1.3025238 1.2291587 1.3183018 1.4589125
      [344] 1.3732236 1.2469824 1.4070136 1.5137583 2.0868516 1.1729055 1.2263003
      [351] 1.4801734 1.7006534 1.3581460 1.3906843 1.6618070 1.5589703 1.2022217
      [358] 1.3182245 1.2710252 1.6927564 2.2629600 1.7818463 2.0068705 1.8097585
      [365] 1.1338515 1.4896001 1.1147637 1.1870287 1.2023446 1.5941141 1.2276672
      [372] 1.7007614 1.2260901 1.5013373 1.7962675 1.4377116 1.5179313 1.8320514
      [379] 1.7417516 2.0438048 2.6500381 2.1525530 1.3443387 1.3906427 1.3330563
      [386] 1.8036219 1.3714199 2.1251494 1.1869933 1.0973543 1.8621011 1.7980877
      [393] 1.2566084 2.0096379 1.8325002 0.9423937 1.1825578 1.4783389 1.6321406
      [400] 1.4923170 2.8728587 1.6634477 1.8955962 1.4171210 1.7629499 1.4192748
      [407] 0.9523986 2.7448308 1.7776464 1.3638944 1.2072206 1.6134305 1.3619638
      [414] 1.9861906 1.1291238 1.2430401 1.4391685 1.0805796 1.7838413 2.2615016
      [421] 2.1084456 1.0058048 1.1580831 1.2427947 1.2439112 1.7374600 2.0675833
      [428] 1.7097875 1.6936147 1.1592566 1.5711820 1.5127258 1.8325002 2.1308724
      [435] 1.5756805 1.8042752 1.5122593 1.8866834 1.6497382 1.2709297 1.9796956
      [442] 1.9152591 1.3656896 2.0413168 1.8225151 1.6697285 1.4214291 1.5530462
      [449] 1.8695806 1.2640946 2.1689500 1.2569523 1.1572285 1.9199877 4.2664256
      [456] 1.3633358 1.4763343 1.7301573 2.1832595 1.3383827 1.1379167 1.3048996
      [463] 1.3539098 1.5210046 1.7359457 1.5043235 1.8493721 1.4617199 1.6193102
      [470] 1.5490165 2.9480690 1.7847332 1.4312728 1.3132987 1.4390841 1.5205505
      [477] 1.5702615 1.4476824 1.2022217 2.1084456 2.1012572 2.1012572 4.3719000
      [484] 1.6780192 1.6002198 1.6632170 1.7489817 2.1074215 1.5631945 1.3728082
      [491] 1.6113017 1.1192846 1.5474011 2.2052390 1.4838664 1.6516456 1.3541262
      [498] 1.5459910 1.7728545 1.2363981 1.8421579 1.4721096 1.4509631 1.1544275
      [505] 1.3583346 1.6564991 1.8352126 2.6361158 1.9235696 1.4243454 1.6909725
      [512] 2.3353576 1.7265498 2.2239758 1.2241940 1.1891570 1.2713633 1.2970404
      [519] 1.6709762 1.6399271 1.7241058 1.8518851 2.0166814 1.3928959 1.7291739
      [526] 1.2976567 1.3986042 1.2611563 1.1814814 1.2127286 1.4721096 1.1991904
      [533] 1.3935014 1.2782412 1.7980877 1.5510569 1.9314207 1.5885384 1.3379778
      [540] 1.3005498 2.7285513 1.1370343 1.4505772 3.6108046 1.8256527 3.5606171
      [547] 5.1980010 2.0960297 1.8284256 1.4123806 1.2934632 1.1806449 1.4456875
      [554] 1.7018582 1.6818933 1.1356546 1.8493721 1.3108924 1.5137583 1.7957918
      [561] 2.5101509 1.5448904 1.5498019 1.3023157 1.6647239 1.5171695 1.6411508
      [568] 1.2210155 2.9300023 1.9208224 1.6263366 1.5076441 1.6046993 2.0086214
      [575] 1.6913867 1.4983675 1.8631600 1.5718511 0.9869283 1.2465667 1.2569523
      [582] 1.8722774 1.6464112 1.6295616 1.6234178 1.4672009 1.6346196 1.4838664
      [589] 1.5577676 2.9636834 1.4874915 1.1782593 1.5956942 1.4870713 1.9796956
      [596] 1.4183586 1.1323611 1.7736938 1.3038437 2.6782256 1.7104900 1.1405976
      [603] 1.2263016 1.6097326 1.2201133 3.0628883 1.6809162 1.3401456 1.8843231
      [610] 1.5265035 2.8227401 1.7555504 1.3849447 1.5643939 1.2861550 1.3680340
      [617] 1.6870081 2.7469338 1.6508103 1.7646768 1.9646783 1.6366119 1.8540561
      [624] 1.3086560 2.2356215 1.8819170 0.9762033 1.7077656 2.2276652 2.1982393
      [631] 1.9170875 1.2203662 1.2898039 1.2880167 1.1417510 1.8424616 2.3854483
      [638] 1.3169686 1.2437950 1.9305068 1.3535783 1.9045206 2.5767987 1.4975459
      [645] 2.3345028 1.3107270 1.3720541 1.6632170 1.5242399 1.4792381 1.2688359
      [652] 2.1974433 1.2947777 1.3644993 1.1629859 1.7688107 1.4150547 1.7403406
      [659] 2.1521045 1.4758365 1.4001967 1.6633852 1.7617103 1.2195022 1.1860387
      [666] 2.3345028 1.6197677 1.2015743 5.6310761 1.7554387 1.4956799 1.2305336
      [673] 1.2547921 1.4626625 1.8299081 1.3116884 2.0703172 3.0242767 1.6327669
      [680] 1.6508103 2.8709469 3.0094363 1.4275181 1.6355761 1.4297953 1.5626223
      [687] 1.4551271 1.1164004 0.9584890 1.8103097 1.5563092 1.2187621 2.0333538
      [694] 2.4312256 1.3581054 1.1869933 1.3284848 1.6290139 1.8042752 1.5458866
      [701] 1.1432639 1.7661654 2.4983044 1.8929935 1.9333740 1.1920541 1.5585559
      [708] 1.9152591 3.0300847 2.1348476 1.2363981 1.4195606 4.2326222 2.0358344
      [715] 1.9152591 1.8325002 1.3108924 1.4794730 1.5803701 1.4714130 1.9209709
      [722] 2.1294992 1.1592566 1.5640850 2.1489071 2.1851663 1.5963801 1.4394057
      [729] 1.7255383 1.9853769 1.5541078 1.2191625 1.5081395 2.0317188 1.7052332
      [736] 2.7737626 1.3577338 1.2463145 1.3057462 1.7513582 2.2629600 3.7498344
      [743] 1.7344655 3.0443502 2.2312722 1.2714049 2.2397834 1.7716082 1.3362510
      [750] 3.1984359 2.2885165 1.1149384 1.5308538 2.4526606 1.4702850 1.6650691
      [757] 1.2410306 1.7561932 1.6511444 1.5745649 1.6872861 1.7305742 1.8838221
      [764] 1.1892832 1.8011365 2.3730814 1.8127678 2.6500381 1.9657235 1.1963982
      [771] 4.3274541 1.9282870 1.1970394 1.5128699 2.0463669 1.9101889 2.6579785
      [778] 1.2515329 1.3714011 1.5661437 1.0179885 1.3005498 1.1638087 1.8880201
      [785] 2.0052467 2.9153326 1.7173537 2.0990009 1.6457369 1.2022217 1.5634131
      [792] 1.1503465 1.7793347 1.3824605 4.5897305 1.6387596 1.5108510 2.4048839
      [799] 5.6465027 1.5129927 1.1866685 1.6546976 5.9278696 1.7919108 1.6380396
      [806] 1.8539474 1.7021303 2.1141320 1.5621267 2.2607190 1.4215729 4.3624518
      [813] 1.2305336 1.2087234 3.5518964 2.1830386 1.8566452 1.4450035 1.4878871
      [820] 1.6235415 1.9517766 2.9673924 1.8711648 1.4427275 1.8831305 1.3140403
      [827] 1.4937626 1.3844654 1.3728873 2.3095003 1.7069594 2.3120812 1.2420356
      [834] 1.4950359 2.8657974 1.5852753 1.5839515 1.2241940 1.9930231 1.9622206
      [841] 2.5528247 1.4741580 1.4254011 1.4500448 1.2311502 1.7103595 1.9031721
      [848] 1.8174510 1.3212791 2.0624911 1.9595165 1.5758913 1.6713559 1.5670948
      [855] 2.6975454 1.9650041 2.2766544 1.8778426 1.6126670 2.5528247 2.3365393
      [862] 1.5259448 2.3404155 3.5518964 1.5238345 1.9563488 1.1376153 1.8358407
      [869] 1.3896128 2.4019152 1.3519947 5.1980010 1.7254371 2.1305319 1.7919108
      [876] 1.3101902 1.2295319 1.7128502 3.2053563 2.2994804 2.1160602 2.4369209
      [883] 1.4938073 1.9056035 2.2531831 2.0230169 1.5498019 2.0706561 1.4190694
      [890] 1.6689402 1.6616323 1.3811677 1.5577599 1.3200369 1.7236939 1.6460699
      [897] 2.3462409 1.3686816 1.4190694 2.0993363 4.0851838 2.1021890 2.3106689
      [904] 2.3095003 2.7095816 2.2955220 2.1823761 2.4392020 4.3624518 2.0865862
      [911] 1.3581460 3.3246841 1.5467734 2.7717959 4.6605862

---

    Code
      model.frame(M_bioChem)
    Output
          art   fem     mar kid5   phd ment
      1     0   Men Married    0 2.520    7
      2     0 Women  Single    0 2.050    6
      3     0 Women  Single    0 3.750    6
      4     0   Men Married    1 1.180    3
      5     0 Women  Single    0 3.750   26
      6     0 Women Married    2 3.590    2
      7     0 Women  Single    0 3.190    3
      8     0   Men Married    2 2.960    4
      9     0   Men  Single    0 4.620    6
      10    0 Women Married    0 1.250    0
      11    0   Men  Single    0 2.960   14
      12    0 Women  Single    0 0.755   13
      13    0 Women Married    1 3.690    3
      14    0 Women Married    0 3.400    4
      15    0 Women Married    0 1.790    0
      16    0 Women  Single    0 3.090    1
      17    0 Women Married    0 2.000    7
      18    0   Men Married    2 4.290   13
      19    0 Women  Single    0 3.360    7
      20    0 Women  Single    0 4.290    9
      21    0 Women Married    0 2.260    6
      22    0   Men Married    3 2.960    3
      23    0   Men Married    1 4.290    5
      24    0   Men Married    1 2.860    4
      25    0   Men Married    3 2.760    1
      26    0 Women Married    0 1.520    3
      27    0 Women Married    1 3.540    8
      28    0   Men Married    1 4.290    3
      29    0 Women  Single    0 3.090    0
      30    0   Men Married    0 2.320    3
      31    0 Women  Single    0 2.390    0
      32    0   Men Married    0 4.290    8
      33    0 Women  Single    0 1.505   13
      34    0   Men  Single    0 2.100    0
      35    0   Men Married    1 1.520    0
      36    0 Women  Single    0 2.000    0
      37    0 Women  Single    0 1.750    0
      38    0   Men  Single    0 4.290    9
      39    0   Men Married    1 1.220    2
      40    0 Women Married    0 3.750    5
      41    0   Men  Single    0 4.290    9
      42    0 Women Married    1 2.860    3
      43    0   Men  Single    0 3.920    5
      44    0 Women Married    1 3.360    3
      45    0   Men  Single    0 2.100    6
      46    0   Men Married    1 1.180    0
      47    0   Men Married    0 2.500    1
      48    0   Men Married    0 3.360   25
      49    0 Women  Single    0 4.540   14
      50    0 Women Married    0 3.920    8
      51    0   Men  Single    0 4.540    5
      52    0 Women Married    2 1.970    0
      53    0   Men Married    2 2.960   12
      54    0   Men Married    0 4.290    8
      55    0   Men Married    1 2.260    2
      56    0 Women  Single    0 2.120   11
      57    0 Women  Single    0 3.210    2
      58    0   Men Married    1 3.150    1
      59    0   Men Married    1 3.920    1
      60    0   Men  Single    0 2.960    0
      61    0 Women  Single    0 2.860    6
      62    0   Men Married    1 2.100    0
      63    0 Women  Single    0 3.750    4
      64    0 Women Married    0 3.540    2
      65    0 Women Married    0 2.540    1
      66    0   Men Married    1 2.760    3
      67    0   Men Married    0 4.540   10
      68    0   Men Married    0 1.680    6
      69    0   Men Married    1 2.200    0
      70    0 Women  Single    0 1.005    0
      71    0   Men  Single    0 2.120    2
      72    0 Women Married    2 2.580    0
      73    0 Women Married    0 1.790    1
      74    0   Men  Single    0 4.290    2
      75    0 Women Married    0 1.280    4
      76    0   Men Married    2 2.580    5
      77    0   Men Married    2 2.120    0
      78    0   Men Married    1 2.210    1
      79    0   Men Married    1 2.260    5
      80    0 Women  Single    0 3.210    5
      81    0 Women  Single    0 2.100    2
      82    0 Women Married    1 3.540    1
      83    0   Men Married    1 3.400   18
      84    0   Men Married    0 2.210    6
      85    0   Men Married    0 2.210   19
      86    0   Men Married    2 0.920    1
      87    0 Women  Single    0 4.290   35
      88    0   Men Married    2 3.150    6
      89    0   Men Married    0 4.290   19
      90    0   Men Married    1 2.510    8
      91    0   Men Married    1 4.290    1
      92    0 Women Married    0 2.760    0
      93    0   Men Married    0 1.420    3
      94    0   Men Married    0 2.210   19
      95    0   Men  Single    0 4.140    5
      96    0   Men Married    0 1.520    7
      97    0   Men  Single    0 4.620    8
      98    0 Women  Single    0 3.620    7
      99    0 Women Married    2 3.750    4
      100   0   Men Married    0 4.290    8
      101   0 Women  Single    0 3.750    5
      102   0   Men Married    1 2.100    0
      103   0   Men Married    2 1.400    7
      104   0 Women Married    0 3.190    4
      105   0   Men Married    2 1.810    1
      106   0   Men Married    1 3.150    2
      107   0 Women Married    0 3.750    7
      108   0 Women  Single    0 2.050    6
      109   0   Men Married    3 2.210    3
      110   0 Women Married    2 3.360    2
      111   0 Women Married    0 3.470   11
      112   0 Women  Single    0 2.120    0
      113   0 Women Married    1 3.360    2
      114   0   Men Married    0 2.540    5
      115   0   Men Married    2 2.150    4
      116   0   Men Married    1 4.540    3
      117   0   Men Married    0 1.680    4
      118   0 Women Married    1 2.550    0
      119   0 Women  Single    0 2.120   11
      120   0   Men Married    1 3.470    2
      121   0 Women Married    0 3.470    1
      122   0 Women  Single    0 3.360    9
      123   0   Men Married    1 2.120   10
      124   0 Women  Single    0 2.100    1
      125   0 Women  Single    0 4.290    1
      126   0   Men Married    1 2.860   13
      127   0 Women Married    1 4.290    9
      128   0   Men Married    0 3.210    2
      129   0   Men  Single    0 2.100    0
      130   0 Women Married    0 1.810    5
      131   0 Women  Single    0 2.520    2
      132   0   Men Married    1 3.360   23
      133   0 Women Married    0 4.540    4
      134   0 Women Married    1 4.290    4
      135   0 Women  Single    0 2.120    9
      136   0   Men Married    2 4.620   30
      137   0 Women Married    1 3.590   14
      138   0 Women  Single    0 3.590    4
      139   0   Men Married    3 2.860    1
      140   0 Women  Single    0 1.505    3
      141   0 Women Married    1 2.500    0
      142   0 Women Married    0 4.620    0
      143   0   Men  Single    0 2.500    0
      144   0 Women Married    1 3.360    3
      145   0 Women  Single    0 2.000    2
      146   0 Women Married    2 3.410    5
      147   0   Men Married    0 2.100    0
      148   0 Women  Single    0 2.000    2
      149   0   Men Married    0 3.360    2
      150   0   Men Married    3 3.590    7
      151   0   Men  Single    0 2.140    2
      152   0 Women Married    0 3.590   12
      153   0 Women  Single    0 2.390   10
      154   0   Men Married    3 4.540   11
      155   0   Men  Single    0 2.960    2
      156   0   Men Married    1 2.210    5
      157   0   Men Married    2 3.690    5
      158   0 Women Married    0 1.780    1
      159   0 Women  Single    0 2.860   11
      160   0   Men Married    0 2.860    8
      161   0 Women Married    0 2.580    3
      162   0 Women  Single    0 3.750    1
      163   0 Women Married    1 1.220   11
      164   0 Women  Single    0 2.100    9
      165   0 Women  Single    0 3.590   18
      166   0 Women  Single    0 3.540    5
      167   0 Women  Single    0 2.860   16
      168   0 Women Married    0 1.860    6
      169   0   Men Married    0 2.960    0
      170   0 Women Married    0 3.690    7
      171   0 Women Married    0 3.690    2
      172   0 Women Married    0 4.290    1
      173   0 Women  Single    0 2.520    1
      174   0 Women  Single    0 1.760   10
      175   0   Men Married    2 2.320    2
      176   0 Women  Single    0 3.690    2
      177   0 Women  Single    0 3.750   14
      178   0 Women  Single    0 4.290    5
      179   0 Women Married    2 4.540    6
      180   0   Men Married    1 2.100    0
      181   0 Women Married    1 2.540    0
      182   0   Men Married    1 2.210   19
      183   0   Men  Single    0 4.540    8
      184   0   Men Married    1 2.100   12
      185   0   Men  Single    0 2.260    5
      186   0 Women Married    1 4.620   15
      187   0 Women  Single    0 2.760    4
      188   0 Women  Single    0 4.290   12
      189   0 Women  Single    0 0.755    0
      190   0 Women Married    0 1.830    2
      191   0 Women  Single    0 1.790    0
      192   0 Women Married    1 4.290    6
      193   0 Women  Single    0 2.500    0
      194   0   Men Married    0 2.140    1
      195   0   Men Married    2 3.400   13
      196   0 Women  Single    0 2.870   15
      197   0 Women Married    0 2.960    0
      198   0 Women Married    2 3.190    0
      199   0   Men Married    1 3.690   16
      200   0 Women Married    2 1.255    0
      201   0   Men Married    2 4.140   12
      202   0   Men Married    1 2.390    5
      203   0   Men Married    2 3.920    2
      204   0 Women  Single    0 2.960    4
      205   0 Women Married    0 2.120    2
      206   0 Women Married    2 2.120    1
      207   0 Women Married    0 2.610    3
      208   0   Men  Single    0 4.290    0
      209   0   Men Married    3 2.860    7
      210   0 Women Married    0 2.390    0
      211   0   Men Married    2 3.340    1
      212   0 Women  Single    0 3.620    8
      213   0 Women Married    1 3.590    8
      214   0   Men Married    2 4.540    1
      215   0 Women Married    0 3.590    1
      216   0   Men  Single    0 4.290    9
      217   0   Men Married    0 1.520    4
      218   0   Men Married    0 4.290    6
      219   0 Women Married    0 4.620    5
      220   0   Men Married    1 4.290   13
      221   0   Men Married    0 2.510    3
      222   0   Men  Single    0 2.860    3
      223   0 Women Married    0 2.960    8
      224   0 Women Married    0 3.690    3
      225   0 Women Married    0 3.470    2
      226   0   Men Married    2 4.290   15
      227   0   Men  Single    0 4.290    0
      228   0 Women  Single    0 3.920    1
      229   0 Women Married    0 2.000    6
      230   0   Men Married    0 2.320    4
      231   0 Women Married    1 2.000    9
      232   0   Men Married    1 1.680   27
      233   0   Men  Single    0 3.470    0
      234   0   Men Married    0 2.200    2
      235   0   Men Married    1 2.120   10
      236   0 Women  Single    0 1.400   14
      237   0 Women  Single    0 3.360    3
      238   0   Men Married    2 4.290   24
      239   0   Men Married    1 2.100    0
      240   0   Men  Single    0 4.290    5
      241   0 Women  Single    0 4.290    0
      242   0 Women  Single    0 2.830    1
      243   0   Men Married    1 2.580    6
      244   0 Women Married    0 3.150    7
      245   0   Men  Single    0 4.290    2
      246   0   Men  Single    0 2.960    0
      247   0   Men Married    2 3.590    5
      248   0 Women  Single    0 2.390   15
      249   0 Women  Single    0 1.250    2
      250   0 Women  Single    0 2.760    1
      251   0   Men Married    0 3.400   13
      252   0   Men  Single    0 4.290    7
      253   0 Women  Single    0 3.690    4
      254   0 Women Married    0 2.860   13
      255   0 Women  Single    0 4.290    3
      256   0 Women  Single    0 4.140    2
      257   0 Women Married    0 2.390    2
      258   0   Men Married    2 2.860   11
      259   0 Women Married    0 2.960    7
      260   0   Men  Single    0 3.590    8
      261   0   Men Married    1 1.810    5
      262   0   Men Married    1 4.290    2
      263   0   Men Married    1 2.100    0
      264   0 Women  Single    0 3.190    0
      265   0   Men Married    2 4.290    2
      266   0   Men Married    0 4.290    2
      267   0   Men Married    2 3.400    0
      268   0   Men  Single    0 4.290   35
      269   0   Men Married    2 2.320    5
      270   0   Men  Single    0 1.680    5
      271   0 Women Married    0 2.580    0
      272   0   Men Married    0 3.690    3
      273   0   Men Married    2 3.410    7
      274   0   Men Married    0 2.320    0
      275   0   Men Married    1 3.690    8
      276   1   Men Married    0 2.540    4
      277   1 Women Married    1 1.760    4
      278   1   Men Married    1 4.290   13
      279   1   Men Married    3 2.100    0
      280   1 Women Married    1 3.090   12
      281   1 Women  Single    0 3.360    6
      282   1   Men Married    0 2.100    0
      283   1 Women Married    1 3.750    7
      284   1 Women  Single    0 2.140    6
      285   1 Women  Single    0 4.290   22
      286   1 Women  Single    0 2.000    2
      287   1   Men Married    0 2.000    4
      288   1   Men Married    1 2.000   16
      289   1   Men Married    1 2.610    6
      290   1   Men Married    0 4.250   12
      291   1   Men  Single    0 2.360   14
      292   1 Women Married    0 4.290   11
      293   1   Men Married    0 2.100    2
      294   1 Women Married    0 2.870    5
      295   1 Women Married    0 3.470    3
      296   1   Men Married    0 1.780    1
      297   1   Men Married    0 4.140   15
      298   1   Men Married    3 4.290    0
      299   1   Men  Single    0 4.290    3
      300   1   Men  Single    0 1.810   10
      301   1 Women  Single    0 2.320   15
      302   1 Women Married    0 2.610    7
      303   1   Men Married    0 1.680   34
      304   1 Women Married    0 3.190    3
      305   1   Men Married    1 3.590    5
      306   1   Men Married    0 2.500    0
      307   1   Men  Single    0 3.400    6
      308   1 Women  Single    0 2.260    4
      309   1   Men  Single    0 3.400   12
      310   1   Men Married    1 3.920    0
      311   1   Men Married    2 2.960    0
      312   1   Men  Single    0 4.290   15
      313   1   Men Married    0 4.290   11
      314   1 Women Married    1 3.320   24
      315   1   Men  Single    0 1.860   15
      316   1 Women  Single    0 2.870    6
      317   1 Women Married    0 1.640   22
      318   1 Women  Single    0 2.250    7
      319   1 Women  Single    0 2.100    8
      320   1 Women Married    0 4.290    6
      321   1   Men Married    0 1.750    3
      322   1   Men Married    0 2.960    8
      323   1 Women  Single    0 2.250    4
      324   1   Men Married    2 4.250   20
      325   1   Men Married    2 2.560   22
      326   1 Women  Single    0 3.190   11
      327   1   Men Married    2 3.920    2
      328   1   Men Married    1 1.780   77
      329   1 Women Married    0 3.400   14
      330   1   Men Married    1 1.740    4
      331   1   Men  Single    0 4.290    6
      332   1 Women  Single    0 2.000    6
      333   1 Women Married    0 2.870   18
      334   1   Men Married    0 4.290    6
      335   1 Women Married    0 3.190    2
      336   1   Men Married    1 1.220    1
      337   1 Women Married    2 3.540   17
      338   1   Men Married    1 4.290    1
      339   1   Men Married    1 4.620    3
      340   1 Women  Single    0 2.000    6
      341   1 Women  Single    0 3.590    3
      342   1 Women  Single    0 3.190    6
      343   1   Men Married    1 3.400    2
      344   1 Women Married    0 1.280    2
      345   1   Men Married    2 1.740    4
      346   1   Men Married    1 2.260    1
      347   1 Women Married    0 3.590    5
      348   1   Men Married    1 4.620   16
      349   1 Women  Single    0 1.400    2
      350   1 Women  Single    0 0.920    4
      351   1   Men Married    1 2.390    3
      352   1   Men Married    0 2.260    1
      353   1   Men Married    2 2.860    7
      354   1   Men Married    2 2.760    8
      355   1   Men Married    1 1.630    8
      356   1   Men Married    2 4.290   12
      357   1 Women  Single    0 1.400    3
      358   1 Women Married    0 2.120    0
      359   1 Women Married    1 2.610    6
      360   1   Men Married    0 1.800    1
      361   1 Women Married    0 4.290   21
      362   1 Women  Single    0 3.690   18
      363   1 Women Married    0 4.620   16
      364   1   Men  Single    0 2.150   10
      365   1   Men Married    2 2.100    0
      366   1 Women Married    0 2.000    5
      367   1 Women  Single    0 1.255    0
      368   1   Men Married    2 1.750    2
      369   1 Women  Single    0 3.850    2
      370   1   Men  Single    0 4.250    4
      371   1 Women  Single    0 3.470    3
      372   1   Men Married    1 3.920    8
      373   1   Men Married    2 2.510    3
      374   1 Women  Single    0 1.400   12
      375   1   Men Married    1 2.000   11
      376   1 Women  Single    0 2.000   10
      377   1   Men  Single    0 4.290    2
      378   1   Men  Single    0 3.360   10
      379   1   Men Married    0 4.620    1
      380   1   Men Married    1 2.560   16
      381   1   Men Married    0 4.620   18
      382   1   Men Married    0 3.590   10
      383   1   Men Married    2 4.290    6
      384   1 Women  Single    0 3.590    8
      385   1 Women  Single    0 4.290    6
      386   1   Men Married    0 3.190    3
      387   1 Women Married    0 3.590    1
      388   1 Women Married    0 2.960   19
      389   1 Women  Single    0 2.580    2
      390   1   Men Married    3 2.960    6
      391   1 Women Married    0 4.540   13
      392   1   Men Married    1 4.540   10
      393   1   Men Married    2 2.500    4
      394   1   Men Married    0 1.680    8
      395   1   Men Married    0 2.320    4
      396   1 Women Married    3 3.190    9
      397   1 Women  Single    0 2.210    2
      398   1 Women Married    0 1.250    5
      399   1   Men  Single    0 4.140    5
      400   1 Women Married    0 4.620    4
      401   1 Women  Single    0 4.540   37
      402   1 Women Married    0 3.150    9
      403   1   Men  Single    0 4.290   11
      404   1 Women Married    0 1.950    3
      405   1   Men  Single    0 2.000    9
      406   1 Women Married    0 4.540    2
      407   1 Women Married    2 2.580    2
      408   1 Women Married    0 3.850   29
      409   1   Men Married    1 3.410   10
      410   1 Women Married    1 2.260    9
      411   1 Women  Single    0 4.250    2
      412   1   Men Married    1 3.590    6
      413   1 Women Married    1 2.120    9
      414   1   Men Married    0 2.960    7
      415   1 Women  Single    0 2.520    0
      416   1 Women  Single    0 2.260    4
      417   1 Women  Single    0 4.540    9
      418   1 Women Married    2 2.860    7
      419   1   Men Married    0 4.540    2
      420   1   Men Married    0 3.590   12
      421   1 Women Married    0 4.620   18
      422   1   Men Married    3 1.670    3
      423   1   Men Married    2 1.750    1
      424   1 Women Married    1 2.830    5
      425   1   Men Married    3 3.150   11
      426   1   Men Married    1 3.590    9
      427   1 Women  Single    0 3.750   24
      428   1 Women  Single    0 2.050   17
      429   1   Men Married    0 4.290    0
      430   1   Men Married    2 4.290    0
      431   1 Women Married    0 2.390    7
      432   1   Men Married    1 4.540    3
      433   1   Men Married    0 2.320    4
      434   1 Women  Single    0 4.290   25
      435   1   Men Married    1 3.690    5
      436   1   Men  Single    0 4.290    9
      437   1   Men  Single    0 3.920    2
      438   1   Men Married    0 2.760    5
      439   1   Men  Single    0 2.760    6
      440   1   Men Married    2 3.620    4
      441   1   Men Married    1 4.290   14
      442   1   Men  Single    0 2.870   12
      443   1 Women Married    1 2.390    9
      444   1   Men  Single    0 4.290   14
      445   1   Men Married    0 1.780    4
      446   1   Men Married    1 2.100    8
      447   1 Women Married    0 2.250    3
      448   1   Men Married    1 2.260    5
      449   1   Men Married    0 1.860    5
      450   1 Women  Single    0 3.920    4
      451   1   Men Married    0 4.340   10
      452   1 Women  Single    0 3.360    4
      453   1 Women  Single    0 2.510    1
      454   1 Women  Single    0 3.750   21
      455   1   Men Married    1 4.540   45
      456   1 Women  Single    0 1.630    8
      457   1 Women  Single    0 4.620   10
      458   1   Men Married    0 1.520    2
      459   1   Men Married    0 2.550   11
      460   1 Women Married    0 1.180    1
      461   1 Women Married    2 3.090    9
      462   1 Women  Single    0 4.620    5
      463   1 Women Married    0 2.320    1
      464   1   Men  Single    0 2.050    3
      465   1   Men Married    0 4.290    1
      466   1   Men  Single    0 3.400    2
      467   1   Men  Single    0 4.290   10
      468   1   Men Married    1 3.590    2
      469   1   Men  Single    0 3.360    5
      470   1 Women  Single    0 2.050   13
      471   1 Women Married    0 3.590   32
      472   1 Women  Single    0 3.850   18
      473   1   Men  Single    0 3.360    0
      474   1 Women Married    0 1.750    0
      475   1 Women Married    0 3.470    3
      476   1   Men Married    1 2.610    4
      477   1   Men  Single    0 2.760    4
      478   1   Men Married    2 4.290    9
      479   1 Women  Single    0 1.400    3
      480   1 Women Married    0 4.620   18
      481   1   Men Married    1 2.860   17
      482   1   Men Married    1 2.860   17
      483   1   Men Married    0 2.860   39
      484   1   Men  Single    0 2.000    7
      485   1 Women Married    0 1.760    8
      486   1   Men Married    0 2.500    0
      487   1 Women  Single    0 4.290   17
      488   1   Men  Single    0 2.560   16
      489   1 Women Married    1 3.540   14
      490   1 Women Married    0 3.690    1
      491   1   Men  Single    0 2.870    5
      492   1 Women  Single    0 1.655    0
      493   1   Men Married    1 4.340    4
      494   1   Men Married    0 3.540   11
      495   1   Men Married    2 4.290   10
      496   1   Men Married    0 1.810    0
      497   1 Women  Single    0 3.400    7
      498   1   Men Married    1 1.810    5
      499   1 Women  Single    0 3.190   18
      500   1 Women Married    1 2.320    5
      501   1 Women  Single    0 4.540   19
      502   1   Men Married    1 4.290    2
      503   1   Men Married    1 2.860    2
      504   1 Women Married    1 2.860    2
      505   1   Men Married    1 1.220    0
      506   1   Men Married    0 2.100    0
      507   1   Men Married    1 1.680   12
      508   1 Women  Single    0 3.360   34
      509   1 Women Married    0 2.870   15
      510   1   Men Married    1 3.470    1
      511   1   Men  Single    0 2.760    7
      512   1   Men Married    1 3.540   21
      513   1 Women Married    0 1.950   11
      514   1   Men Married    1 3.590   19
      515   1 Women  Single    0 3.190    3
      516   1 Women  Single    0 2.760    2
      517   1 Women Married    2 4.290   13
      518   1   Men Married    2 3.190    5
      519   1   Men Married    0 2.960    0
      520   1   Men Married    1 2.760    7
      521   1 Women Married    0 1.810   11
      522   2   Men Married    0 3.360    4
      523   2   Men  Single    0 3.090   14
      524   2 Women  Single    0 3.750    8
      525   2 Women Married    0 4.540   10
      526   2 Women  Single    0 1.630    6
      527   2 Women Married    0 3.090    2
      528   2 Women  Single    0 3.690    4
      529   2 Women  Single    0 2.120    2
      530   2 Women  Single    0 2.260    3
      531   2   Men Married    1 4.290    2
      532   2 Women Married    1 1.740    4
      533   2   Men Married    2 2.960    8
      534   2 Women  Single    0 2.580    5
      535   2   Men Married    1 4.540   10
      536   2 Women  Single    0 4.620   12
      537   2   Men Married    1 4.290   13
      538   2 Women  Single    0 4.540   13
      539   2 Women Married    0 3.590    0
      540   2 Women  Single    0 4.290    5
      541   2   Men  Single    0 3.690   26
      542   2 Women  Single    0 3.210    0
      543   2 Women Married    1 3.470   11
      544   2   Men  Single    0 4.540   37
      545   2   Men Married    0 1.950    4
      546   2   Men Married    2 2.960   46
      547   2   Men Married    1 4.540   53
      548   2   Men Married    0 3.400    9
      549   2   Men Married    0 2.100    4
      550   2   Men Married    2 4.290    8
      551   2 Women  Single    0 3.750    5
      552   2 Women  Single    0 2.050    2
      553   2   Men Married    1 2.500    2
      554   2 Women Married    1 4.620   17
      555   2 Women Married    0 1.800   10
      556   2 Women  Single    0 3.090    0
      557   2   Men  Single    0 4.290   10
      558   2   Men Married    2 1.800    6
      559   2 Women Married    0 3.590    5
      560   2   Men Married    0 2.760    3
      561   2   Men Married    0 4.140   16
      562   2   Men  Single    0 3.590    3
      563   2 Women  Single    0 4.540   12
      564   2 Women Married    0 0.920    0
      565   2 Women  Single    0 4.290   15
      566   2   Men Married    1 2.390    4
      567   2   Men Married    0 1.180    0
      568   2   Men Married    2 4.540    2
      569   2 Women Married    2 3.850   47
      570   2   Men Married    2 2.960   21
      571   2 Women Married    0 3.360    8
      572   2 Women Married    0 3.190    5
      573   2 Women Married    1 3.690   15
      574   2   Men Married    0 1.630    8
      575   2   Men Married    0 1.720    1
      576   2 Women Married    0 2.580    5
      577   2   Men Married    0 1.520    5
      578   2   Men  Single    0 2.860    4
      579   2 Women Married    2 1.220    4
      580   2 Women  Single    0 2.540    4
      581   2 Women  Single    0 3.360    4
      582   2   Men Married    2 2.870   20
      583   2   Men Married    1 3.150    7
      584   2 Women  Single    0 4.620   14
      585   2   Men Married    1 1.760    7
      586   2   Men Married    1 1.520    3
      587   2   Men  Single    0 4.290    5
      588   2   Men Married    2 4.290   10
      589   2   Men Married    1 2.560    5
      590   2   Men  Single    0 4.540   29
      591   2 Women Married    0 1.860    5
      592   2 Women  Single    0 4.290    1
      593   2 Women Married    0 3.920    7
      594   2   Men  Single    0 2.260    2
      595   2   Men Married    1 4.290   14
      596   2 Women Married    1 3.690   10
      597   2   Men Married    2 1.970    0
      598   2   Men Married    1 3.190   10
      599   2 Women  Single    0 4.540    5
      600   2   Men  Single    0 4.290   25
      601   2   Men Married    0 2.830    1
      602   2   Men Married    3 4.340    7
      603   2 Women  Single    0 3.360    3
      604   2 Women  Single    0 3.410   14
      605   2 Women  Single    0 2.860    3
      606   2   Men Married    0 4.290   24
      607   2   Men Married    1 2.760    8
      608   2 Women Married    0 3.750    0
      609   2   Men Married    1 4.290   12
      610   2   Men Married    2 2.210   12
      611   2   Men Married    0 3.540   21
      612   2   Men Married    0 2.960    2
      613   2 Women Married    0 2.120    2
      614   2   Men  Single    0 2.390    4
      615   2 Women  Single    0 3.190    5
      616   2 Women  Single    0 1.970    8
      617   2 Women Married    0 4.540    9
      618   2 Women  Single    0 2.550   36
      619   2   Men Married    0 1.760    0
      620   2   Men Married    2 4.340   17
      621   2 Women Married    0 2.520   16
      622   2   Men Married    1 2.560    7
      623   2   Men  Single    0 4.540   10
      624   2 Women Married    0 1.400    0
      625   2   Men Married    2 3.320   27
      626   2   Men Married    0 2.510    5
      627   2 Women Married    2 2.580    3
      628   2   Men Married    2 3.540   16
      629   2   Men Married    0 4.540   11
      630   2   Men  Single    0 4.290   17
      631   2   Men Married    0 4.340    5
      632   2 Women Married    1 3.470    4
      633   2 Women  Single    0 3.470    5
      634   2   Men Married    2 2.500    5
      635   2   Men Married    3 2.000    8
      636   2   Men  Single    0 3.920   10
      637   2 Women Married    0 4.620   23
      638   2 Women  Single    0 3.090    6
      639   2 Women  Single    0 2.320    4
      640   2 Women  Single    0 4.290   21
      641   2 Women  Single    0 3.360    7
      642   2   Men Married    0 3.690    5
      643   2   Men Married    0 4.290   17
      644   2 Women  Single    0 3.590   11
      645   2   Men Married    0 4.290   13
      646   2 Women Married    1 3.210    7
      647   2 Women  Single    0 2.260    8
      648   2   Men Married    0 2.500    0
      649   2   Men  Single    0 2.260    3
      650   2 Women Married    0 3.750    4
      651   2 Women  Single    0 4.290    4
      652   2   Men Married    0 3.190   11
      653   2 Women Married    1 2.000    7
      654   2 Women Married    0 3.090    1
      655   2 Women Married    1 3.590    2
      656   2 Women Married    0 4.340   11
      657   2 Women  Single    0 2.870    9
      658   2   Men Married    0 2.100    2
      659   2 Women  Single    0 2.830   26
      660   2   Men Married    1 2.100    3
      661   2   Men Married    1 1.780    1
      662   2   Men Married    0 2.510    0
      663   2   Men Married    1 2.520   10
      664   2 Women Married    1 3.400    4
      665   2 Women Married    1 3.090    3
      666   2   Men Married    0 4.290   13
      667   2 Women Married    0 2.960    8
      668   2 Women Married    2 3.590   11
      669   2   Men  Single    0 4.540   55
      670   2 Women Married    0 3.590   11
      671   2   Men Married    1 3.420    3
      672   2 Women Married    1 4.290    4
      673   2 Women  Single    0 3.190    4
      674   2 Women Married    1 4.290   11
      675   2   Men Married    0 4.620    3
      676   2   Men Married    2 1.860    6
      677   2   Men Married    0 4.620    8
      678   2 Women Married    2 4.540   48
      679   2 Women Married    0 3.750    8
      680   2   Men Married    0 1.760    0
      681   2 Women Married    0 3.410   31
      682   2   Men Married    0 2.550   24
      683   2   Men Married    1 1.250    2
      684   2 Women Married    0 1.480    9
      685   2 Women Married    0 2.830    3
      686   2 Women Married    0 4.290    6
      687   2 Women  Single    0 3.190   10
      688   2 Women  Single    0 1.400    0
      689   2 Women Married    2 3.210    2
      690   2   Men  Single    0 4.620    9
      691   2 Women Married    0 1.450    7
      692   2 Women Married    1 3.340    4
      693   2 Women  Single    0 4.540   23
      694   2   Men Married    2 4.290   30
      695   2 Women  Single    0 3.690    7
      696   2 Women  Single    0 2.580    2
      697   2 Women Married    1 4.540    7
      698   2   Men Married    1 4.540    6
      699   2   Men  Single    0 4.290    9
      700   3 Women  Single    0 4.290   12
      701   3 Women  Single    0 3.750    0
      702   3   Men  Single    0 4.620    8
      703   3   Men Married    2 4.540   31
      704   3   Men Married    0 3.090    5
      705   3   Men Married    1 1.950   14
      706   3 Women Married    1 3.590    3
      707   3   Men Married    1 2.610    5
      708   3   Men  Single    0 2.870   12
      709   3   Men  Single    0 4.290   30
      710   3 Women Married    0 3.410   19
      711   3 Women Married    1 2.320    5
      712   3 Women Married    0 2.120    3
      713   3   Men Married    0 4.540   37
      714   3   Men Married    0 2.960    8
      715   3   Men  Single    0 2.870   12
      716   3   Men Married    0 2.320    4
      717   3   Men Married    2 1.800    6
      718   3 Women  Single    0 2.390   11
      719   3 Women Married    1 4.620   14
      720   3 Women  Single    0 4.290   10
      721   3   Men Married    0 4.540    5
      722   3   Men  Single    0 3.590   16
      723   3   Men Married    2 4.290    0
      724   3   Men Married    1 2.960    5
      725   3   Men Married    2 4.290   25
      726   3   Men Married    1 4.290   18
      727   3   Men Married    1 2.540    6
      728   3   Men  Single    0 3.920    0
      729   3   Men  Single    0 2.320    8
      730   3 Women  Single    0 4.620   22
      731   3 Women Married    0 3.750    6
      732   3   Men Married    2 1.950    3
      733   3   Men Married    1 1.800    4
      734   3   Men Married    0 2.760    8
      735   3   Men  Single    0 3.590    7
      736   3   Men Married    0 4.250   20
      737   3   Men Married    2 2.830    7
      738   3 Women  Single    0 2.520    4
      739   3 Women Married    0 1.180    0
      740   3 Women Married    0 3.360   11
      741   3 Women Married    0 4.290   21
      742   3 Women Married    1 4.620   49
      743   3   Men  Single    0 2.830    8
      744   3   Men Married    0 3.690   24
      745   3   Men Married    0 2.260   12
      746   3 Women  Single    0 2.050    5
      747   3   Men Married    1 4.290   19
      748   3   Men Married    0 1.420    3
      749   3 Women Married    2 1.890   16
      750   3   Men Married    0 3.690   26
      751   3 Women Married    0 2.960   22
      752   3 Women Married    1 1.860    1
      753   3 Women Married    0 2.260    6
      754   3   Men Married    0 4.290   15
      755   3 Women Married    0 3.150    4
      756   3   Men Married    0 2.610    0
      757   3 Women  Single    0 4.540    3
      758   3   Men Married    1 2.210   10
      759   3   Men Married    0 1.780    0
      760   3   Men Married    1 3.620    5
      761   3   Men Married    0 3.920    0
      762   3 Women Married    0 4.620   10
      763   3   Men Married    0 2.610    5
      764   3 Women Married    1 3.360    3
      765   3 Women Married    0 3.690   12
      766   3   Men Married    0 3.470   14
      767   3   Men Married    0 1.250    4
      768   3   Men Married    0 4.620   18
      769   3   Men Married    1 3.590   14
      770   3 Women  Single    0 3.360    2
      771   3   Men Married    0 4.290   38
      772   3   Men  Single    0 3.540   12
      773   3   Men Married    2 2.580    2
      774   3   Men  Single    0 1.520    3
      775   3   Men Married    0 3.470    8
      776   3 Women Married    0 4.620   14
      777   3   Men  Single    0 3.540   25
      778   3   Men Married    2 2.100    4
      779   3   Men Married    2 1.380    8
      780   3   Men Married    1 3.090    5
      781   3   Men Married    3 2.860    3
      782   3 Women  Single    0 4.290    5
      783   3 Women Married    1 1.220    3
      784   4   Men Married    0 2.830    5
      785   4 Women Married    0 4.540   16
      786   4   Men Married    0 4.290   22
      787   4   Men  Single    0 4.290    7
      788   4   Men Married    0 3.540    9
      789   4   Men  Single    0 2.520    6
      790   4 Women  Single    0 1.400    3
      791   4 Women Married    0 4.340    6
      792   4 Women Married    1 2.510    2
      793   4   Men Married    0 4.290    2
      794   4   Men Married    1 2.960    0
      795   4   Men  Single    0 3.850   47
      796   4   Men  Single    0 4.540    5
      797   4 Women Married    0 3.400    5
      798   4   Men  Single    0 3.410   21
      799   4   Men Married    1 2.960   57
      800   4 Women Married    0 3.540    5
      801   4   Men Married    2 1.720    2
      802   4   Men Married    2 2.860   15
      803   4   Men Married    2 4.540   66
      804   4   Men Married    1 1.760   11
      805   4   Men Married    2 1.860   15
      806   4   Men Married    0 3.470    4
      807   4   Men  Single    0 3.410    7
      808   4   Men Married    0 1.810   10
      809   4   Men Married    2 2.050   13
      810   4   Men  Single    0 4.620   18
      811   4 Women Married    0 2.260    3
      812   4   Men Married    1 1.860   47
      813   4 Women Married    1 4.290    4
      814   4   Men Married    2 3.540    2
      815   4   Men Married    0 4.290   30
      816   4   Men Married    0 2.540   11
      817   4 Women Married    0 4.250   13
      818   4 Women  Single    0 2.500   10
      819   4 Women Married    1 3.540   12
      820   4 Women Married    0 3.190    8
      821   4   Men Married    2 4.540   21
      822   4 Women  Single    0 2.860   39
      823   4 Women Married    0 2.580   14
      824   4 Women Married    0 1.280    4
      825   4 Women Married    0 3.210   14
      826   4 Women  Single    0 2.870    6
      827   4 Women  Single    0 3.340   11
      828   4 Women  Single    0 3.150    8
      829   4 Women  Single    0 2.320    8
      830   4   Men  Single    0 4.290   19
      831   4   Men  Single    0 3.690    7
      832   4   Men Married    1 2.550   21
      833   4 Women  Single    0 4.620    3
      834   4 Women Married    0 2.360    5
      835   4   Men Married    1 4.250   29
      836   4   Men Married    1 4.290    5
      837   4 Women Married    0 3.190    7
      838   4 Women  Single    0 3.190    3
      839   4 Women  Single    0 2.560   23
      840   4   Men Married    0 1.760    7
      841   4   Men Married    1 2.580   25
      842   4 Women Married    0 3.410    4
      843   4 Women  Single    0 3.590    9
      844   4 Women Married    0 1.780    4
      845   4 Women  Single    0 3.750    3
      846   4   Men Married    2 3.690   16
      847   4   Men Married    0 3.620    5
      848   4   Men Married    0 1.505    4
      849   4   Men Married    2 2.580    6
      850   4   Men  Single    0 2.870   15
      851   5 Women Married    0 2.260   16
      852   5 Women  Single    0 3.750   13
      853   5   Men Married    2 3.850   15
      854   5   Men Married    1 3.150    5
      855   5   Men Married    1 3.150   27
      856   5   Men Married    0 4.340    6
      857   5   Men Married    0 4.250   12
      858   5   Men  Single    0 3.360   11
      859   5 Women  Single    0 3.590   14
      860   5   Men Married    1 2.580   25
      861   5   Men Married    1 3.590   21
      862   5   Men Married    1 2.960    4
      863   5   Men Married    0 4.540   13
      864   5   Men Married    0 4.290   30
      865   5 Women  Single    0 2.870   12
      866   5 Women Married    0 4.540   15
      867   5 Women Married    1 3.850    1
      868   5   Men Married    0 2.500    4
      869   5   Men Married    1 3.470    0
      870   5 Women Married    0 2.860   24
      871   5 Women Married    0 4.620    0
      872   5   Men Married    1 4.540   53
      873   5   Men Married    0 1.250    2
      874   5 Women Married    0 3.210   19
      875   5   Men Married    1 1.760   11
      876   5 Women  Single    0 2.580    6
      877   5 Women  Single    0 3.620    3
      878   6   Men Married    1 4.620    8
      879   6 Women Married    0 2.100   36
      880   6 Women Married    2 1.860   38
      881   6   Men Married    0 4.340    9
      882   6 Women Married    0 4.290   24
      883   6   Men Married    2 2.510   11
      884   6   Men Married    1 2.960   13
      885   6   Men  Single    0 4.290   18
      886   6   Men  Single    0 3.400   14
      887   6 Women  Single    0 4.540   12
      888   6   Men Married    1 3.850   16
      889   6 Women  Single    0 3.150    9
      890   6 Women  Single    0 4.540   15
      891   6   Men  Single    0 3.470    6
      892   6 Women Married    0 4.290    1
      893   6   Men  Single    0 1.970    4
      894   6 Women  Single    0 3.320    6
      895   7   Men Married    0 3.590    1
      896   7   Men  Single    0 2.540    6
      897   7   Men  Single    0 3.410   20
      898   7   Men Married    1 1.970    0
      899   7 Women  Single    0 3.150    9
      900   7   Men  Single    0 4.620   15
      901   7   Men  Single    0 4.540   42
      902   7   Men Married    0 3.690    9
      903   7   Men  Single    0 4.340   19
      904   7   Men  Single    0 4.290   19
      905   7   Men Married    1 3.590   27
      906   7   Men  Single    0 3.690   19
      907   8   Men Married    0 2.510   11
      908   9   Men Married    1 2.960   23
      909   9   Men Married    1 1.860   47
      910  10 Women Married    0 3.590   18
      911  11   Men Married    2 2.860    7
      912  12   Men Married    1 4.290   35
      913  12   Men Married    1 1.860    5
      914  16   Men Married    0 1.740   21
      915  19   Men Married    0 1.860   42

---

    Code
      residuals(M_bioChem)
    Output
                 1            2            3            4            5            6 
      -1.825642155 -1.486723228 -1.499133994 -1.572134000 -1.914640906 -1.286031924 
                 7            8            9           10           11           12 
      -1.442602066 -1.464134989 -1.683610523 -1.488644178 -1.842628890 -1.606780056 
                13           14           15           16           17           18 
      -1.424979517 -1.578335984 -1.492579316 -1.408142134 -1.625293819 -1.642015862 
                19           20           21           22           23           24 
      -1.514260389 -1.558115091 -1.607810058 -1.321539322 -1.635605860 -1.604487817 
                25           26           27           28           29           30 
      -1.289691019 -1.545085650 -1.511224334 -1.596484138 -1.391601606 -1.735821093 
                31           32           33           34           35           36 
      -1.386896967 -1.865327806 -1.612765243 -1.546242064 -1.519069285 -1.384283623 
                37           38           39           40           41           42 
      -1.382611334 -1.743762367 -1.553644892 -1.600261929 -1.743762367 -1.419250705 
                43           44           45           46           47           48 
      -1.657411408 -1.422698635 -1.662544510 -1.516538701 -1.695318710 -2.308052317 
                49           50           51           52           53           54 
      -1.657276787 -1.660952748 -1.662545341 -1.246626354 -1.611550533 -1.865327806 
                55           56           57           58           59           60 
      -1.561625363 -1.579082090 -1.425737372 -1.549749790 -1.555636243 -1.552800674 
                61           62           63           64           65           66 
      -1.492621598 -1.523397604 -1.463828444 -1.541898074 -1.516074293 -1.584449122 
                67           68           69           70           71           72 
      -1.915140211 -1.795444158 -1.524145330 -1.377641437 -1.584053838 -1.250268000 
                73           74           75           76           77           78 
      -1.510511568 -1.601150351 -1.561913498 -1.478922922 -1.390679117 -1.542599362 
                79           80           81           82           83           84 
      -1.619193166 -1.477458251 -1.418077237 -1.390662508 -1.911651899 -1.800281916 
                85           86           87           88           89           90 
      -2.121683579 -1.399050566 -2.153572426 -1.500844067 -2.145152623 -1.681425393 
                91           92           93           94           95           96 
      -1.558474203 -1.499678483 -1.727974363 -2.121683579 -1.659230929 -1.816369232 
                97           98           99          100          101          102 
      -1.725332781 -1.516191688 -1.317526985 -1.865327806 -1.481359013 -1.523397604 
               103          104          105          106          107          108 
      -1.505921852 -1.576700108 -1.405094882 -1.568493388 -1.639494928 -1.486723228 
               109          110          111          112          113          114 
      -1.316782864 -1.284614514 -1.719080238 -1.385087134 -1.405963426 -1.781117729 
               115          116          117          118          119          120 
      -1.458366973 -1.598460993 -1.751644839 -1.367798901 -1.579082090 -1.570971542 
               121          122          123          124          125          126 
      -1.523005458 -1.550995397 -1.719706495 -1.401403951 -1.416359166 -1.791133656 
               127          128          129          130          131          132 
      -1.535063949 -1.722335084 -1.546242064 -1.584977256 -1.420970119 -2.036202660 
               133          134          135          136          137          138 
      -1.587251763 -1.446188934 -1.541562181 -2.032014580 -1.624779529 -1.462687271 
               139          140          141          142          143          144 
      -1.290309747 -1.430834987 -1.367468754 -1.513401938 -1.549288501 -1.422698635 
               145          146          147          148          149          150 
      -1.417389448 -1.330900989 -1.671401614 -1.417389448 -1.723634659 -1.389443531 
               151          152          153          154          155          156 
      -1.584210415 -1.741372307 -1.562266086 -1.463608937 -1.590645895 -1.618791414 
               157          158          159          160          161          162 
      -1.486963402 -1.510437560 -1.584865968 -1.851728971 -1.553167076 -1.412654754 
               163          164          165          166          167          168 
      -1.548786096 -1.541410588 -1.732062359 -1.479840630 -1.683977930 -1.604626386 
               169          170          171          172          173          174 
      -1.678600922 -1.639005569 -1.543035875 -1.529147685 -1.404258084 -1.557423633 
               175          176          177          178          179          180 
      -1.425342551 -1.429064519 -1.650763512 -1.485271746 -1.353985906 -1.523397604 
               181          182          183          184          185          186 
      -1.367732864 -1.924010069 -1.724638692 -1.762347863 -1.643759642 -1.653072482 
               187          188          189          190          191          192 
      -1.456783918 -1.615528194 -1.375978211 -1.528996778 -1.382878746 -1.481000848 
               193          194          195          196          197          198 
      -1.387635072 -1.692263973 -1.634761631 -1.663654229 -1.501147123 -1.253921202 
               199          200          201          202          203          204 
      -1.867107400 -1.242372505 -1.621012830 -1.620238283 -1.436464176 -1.458203892 
               205          206          207          208          209          210 
      -1.531175742 -1.262167715 -1.553396521 -1.563008543 -1.384546279 -1.496965918 
               211          212          213          214          215          216 
      -1.415555295 -1.534457024 -1.511594642 -1.423821748 -1.523902507 -1.743762367 
               217          218          219          220          221          222 
      -1.750231073 -1.819423783 -1.607173516 -1.804184587 -1.737483189 -1.609182012 
               223          224          225          226          227          228 
      -1.653020745 -1.561683333 -1.541367440 -1.682487843 -1.563008543 -1.413819765 
               229          230          231          232          233          234 
      -1.605739813 -1.757313916 -1.517905431 -2.124556953 -1.556705615 -1.713615662 
               235          236          237          238          239          240 
      -1.719706495 -1.631570184 -1.443795410 -1.880423497 -1.523397604 -1.660472898 
               241          242          243          244          245          246 
      -1.399708874 -1.406368947 -1.641555988 -1.634609232 -1.601150351 -1.552800674 
               247          248          249          250          251          252 
      -1.486236954 -1.659674691 -1.412243150 -1.405891985 -1.977360273 -1.701497749 
               253          254          255          256          257          258 
      -1.463400384 -1.756459561 -1.450343856 -1.432191800 -1.533207720 -1.591406597 
               259          260          261          262          263          264 
      -1.633065746 -1.716422369 -1.615581693 -1.577343066 -1.523397604 -1.392275174 
               265          266          267          268          269          270 
      -1.439050203 -1.731718809 -1.399322264 -2.431375219 -1.477046875 -1.639021729 
               271          272          273          274          275          276 
      -1.498358140 -1.747849394 -1.520830808 -1.673239731 -1.691385109 -0.615430680 
               277          278          279          280          281          282 
      -0.169356103 -0.673677217  0.057085403 -0.380558632 -0.263557658 -0.500045001 
               283          284          285          286          287          288 
      -0.261545839 -0.251279927 -0.702169482 -0.153733172 -0.609189053 -0.733931677 
               289          290          291          292          293          294 
      -0.460712991 -0.873698481 -0.715929014 -0.572215117 -0.554597735 -0.395737164 
               295          296          297          298          299          300 
      -0.350691037 -0.523600700 -0.967607232  0.037432058 -0.432440418 -0.594750901 
               301          302          303          304          305          306 
      -0.483722269 -0.445267159 -1.619931271 -0.347771299 -0.444861969 -0.504473058 
               307          308          309          310          311          312 
      -0.502654337 -0.203924667 -0.670121988 -0.319503521 -0.124042845 -0.769075445 
               313          314          315          316          317          318 
      -0.843171561 -0.712731579 -0.739386322 -0.258619462 -0.863401178 -0.277007879 
               319          320          321          322          323          324 
      -0.300332150 -0.437053910 -0.578323287 -0.736039535 -0.203826075 -0.653702167 
               325          326          327          328          329          330 
      -0.691452156 -0.387847174 -0.180497119 -3.376917704 -0.646443685 -0.398844541 
               331          332          333          334          335          336 
      -0.512527377 -0.249874709 -0.756913006 -0.693332298 -0.322468068 -0.316823799 
               337          338          339          340          341          342 
      -0.317132645 -0.348631948 -0.403527561 -0.249874709 -0.193004630 -0.261843344 
               343          344          345          346          347          348 
      -0.364840953 -0.302832026 -0.207012009 -0.327555286 -0.403393703 -0.765888382 
               349          350          351          352          353          354 
      -0.147935969 -0.190746418 -0.379886214 -0.528964675 -0.291680896 -0.315653053 
               355          356          357          358          359          360 
      -0.503544519 -0.434559694 -0.171590265 -0.261784942 -0.225709496 -0.523823974 
               361          362          363          364          365          366 
      -0.866080167 -0.581056419 -0.718916120 -0.598656836 -0.115830084 -0.386515924 
               367          368          369          370          371          372 
      -0.099878913 -0.159377926 -0.171688626 -0.458422623 -0.191826703 -0.529034927 
               373          374          375          376          377          378 
      -0.190580197 -0.394735991 -0.590168912 -0.349707269 -0.406293013 -0.612606106 
               379          380          381          382          383          384 
      -0.555503010 -0.740728802 -1.073086159 -0.803766111 -0.281402775 -0.315622637 
               385          386          387          388          389          390 
      -0.272956069 -0.594800342 -0.301501976 -0.788042588 -0.159349281 -0.085175278 
               391          392          393          394          395          396 
      -0.631261568 -0.591316179 -0.214524718 -0.720557845 -0.612885950  0.053025325 
               397          398          399          400          401          402 
      -0.155765209 -0.378593099 -0.483902387 -0.388422106 -1.185400778 -0.504624981 
               403          404          405          406          407          408 
      -0.651862376 -0.334880696 -0.569053737 -0.336437654  0.043662557 -1.121417760 
               409          410          411          412          413          414 
      -0.578394913 -0.295941201 -0.175587056 -0.471408901 -0.294511578 -0.706609053 
               415          416          417          418          419          420 
      -0.111895503 -0.203924667 -0.350751481 -0.070863512 -0.582319481 -0.865267492 
               421          422          423          424          425          426 
      -0.778406013 -0.005228627 -0.135832491 -0.203732284 -0.204607365 -0.552748401 
               427          428          429          430          431          432 
      -0.754661038 -0.534893861 -0.524383361 -0.136794353 -0.442886613 -0.402675661 
               433          434          435          436          437          438 
      -0.612885950 -0.791335015 -0.445944600 -0.595211262 -0.402351092 -0.646400209 
               439          440          441          442          443          444 
      -0.495578173 -0.225635615 -0.702729557 -0.663863278 -0.297269416 -0.739266065 
               445          446          447          448          449          450 
      -0.606650540 -0.508755428 -0.337993477 -0.430506436 -0.635879273 -0.220342567 
               451          452          453          454          455          456 
      -0.813124187 -0.214792459 -0.135131686 -0.666739333 -1.806868057 -0.295527687 
               457          458          459          460          461          462 
      -0.377179001 -0.548052266 -0.821260727 -0.276949136 -0.119204847 -0.251682560 
               463          464          465          466          467          468 
      -0.288534319 -0.408425242 -0.551775480 -0.396821324 -0.623379554 -0.366835041 
               469          470          471          472          473          474 
      -0.475343962 -0.427744155 -1.222332715 -0.582883909 -0.345084750 -0.258057777 
               475          476          477          478          479          480 
      -0.350691037 -0.408110325 -0.442260268 -0.356841121 -0.171590265 -0.778406013 
               481          482          483          484          485          486 
      -0.774246559 -0.774246559 -1.849383508 -0.514194032 -0.462537200 -0.504473058 
               487          488          489          490          491          492 
      -0.560135050 -0.777813869 -0.437444355 -0.302525820 -0.469982156 -0.103672751 
               493          494          495          496          497          498 
      -0.426635625 -0.833704534 -0.382486469 -0.496839461 -0.288695183 -0.425667490 
               499          500          501          502          503          504 
      -0.575353939 -0.198709230 -0.618899122 -0.374195077 -0.359181971 -0.132832229 
               505          506          507          508          509          510 
      -0.291820814 -0.500045001 -0.614576522 -1.065915709 -0.668915319 -0.340097446 
               511          512          513          514          515          516 
      -0.522660857 -0.906091357 -0.545728286 -0.844261596 -0.189080261 -0.161094650 
               517          518          519          520          521          522 
      -0.225970781 -0.245694216 -0.509574847 -0.489077540 -0.544152297  0.098744166 
               523          524          525          526          527          528 
      -0.010848926  0.439536333  0.184180479  0.518980655  0.434889792  0.550455237 
               529          530          531          532          533          534 
       0.621362181  0.593177209  0.376128521  0.605327031  0.439042857  0.535647756 
               535          536          537          538          539          540 
       0.135766340  0.315080611  0.045164844  0.286785978  0.484891158  0.516511390 
               541          542          543          544          545          546 
      -0.433713463  0.662348996  0.393141295 -0.881663040  0.116715072 -0.857857697 
               547          548          549          550          551          552 
      -1.557895456 -0.061756213  0.114808168  0.423726682  0.522566302  0.622123685 
               553          554          555          556          557          558 
       0.397027285  0.203695388  0.218080445  0.663638873  0.100459122  0.507713822 
               559          560          561          562          563          564 
       0.343669618  0.137361085 -0.311242792  0.319776880  0.316035423  0.515005973 
               565          566          567          568          569          570 
       0.230535644  0.341036461  0.247766214  0.585785635 -0.542088183  0.052228133 
               571          572          573          574          575          576 
       0.258673298  0.348398642  0.274715563 -0.005613554  0.211227265  0.355597083 
               577          578          579          580          581          582 
       0.091066855  0.299330695  0.809647387  0.563207274  0.554119465  0.084878809 
               583          584          585          586          587          588 
       0.243907965  0.256293585  0.260829516  0.379992670  0.252567309  0.366906901 
               589          590          591          592          593          594 
       0.309983362 -0.559815631  0.364072999  0.624297390  0.281431925  0.364401206 
               595          596          597          598          599          600 
       0.013276448  0.418904751  0.666722358  0.152773226  0.513704464 -0.405976284 
               601          602          603          604          605          606 
       0.197508098  0.659022820  0.581088509  0.270971778  0.586588715 -0.611417561 
               607          608          609          610          611          612 
       0.218787125  0.483077815  0.076730748  0.333850723 -0.484898002  0.165514312 
               613          614          615          616          617          618 
       0.446029351  0.304963752  0.528833894  0.459920365  0.214385217 -0.443776440 
               619          620          621          622          623          624 
       0.240687296  0.159095431  0.023146995  0.251101504  0.097263750  0.509612147 
               625          626          627          628          629          630 
      -0.148706038  0.078355830  0.820765774  0.199458868 -0.143834182 -0.125730211 
               631          632          633          634          635          636 
       0.054722730  0.586363528  0.525701567  0.527235040  0.657947600  0.105182293 
               637          638          639          640          641          642 
      -0.238698406  0.502566872  0.565641303  0.045773003  0.471884588  0.063137489 
               643          644          645          646          647          648 
      -0.349207657  0.356235985 -0.208460939  0.507854121  0.456607976  0.231632584 
               649          650          651          652          653          654 
       0.335590799  0.370531546  0.543782757 -0.125238606  0.521441519  0.462838141 
               655          656          657          658          659          660 
       0.638286487  0.156194563  0.421568082  0.176257024 -0.097068257  0.373200128 
               661          662          663          664          665          666 
       0.433595743  0.231510046  0.161179629  0.587132896  0.617220038 -0.208460939 
               667          668          669          670          671          672 
       0.263529456  0.603180808 -1.721390959  0.165593003  0.357687889  0.577337897 
               673          674          675          676          677          678 
       0.556005537  0.383572800  0.113789404  0.507038593 -0.045383427 -0.591440481 
               679          680          681          682          683          684 
       0.253931393  0.240687296 -0.510741706 -0.583726357  0.411542143  0.251863411 
               685          686          687          688          689          690 
       0.409716463  0.306304421  0.389532926  0.681753804  0.839323854  0.127297717 
               691          692          693          694          695          696 
       0.311089913  0.587792217 -0.021640039 -0.265565469  0.468128719  0.616353786 
               697          698          699          700          701          702 
       0.492854932  0.256697530  0.131474717  0.953300954  1.316499624  0.781136050 
               703          704          705          706          707          708 
       0.289683359  0.688164331  0.659380211  1.268142153  0.942980959  0.672246629 
               709          710          711          712          713          714 
      -0.016480979  0.520979332  1.225400912  1.059425961 -0.613393651  0.587959524 
               715          716          717          718          719          720 
       0.672246629  0.732006325  1.155967616  1.008338194  0.925340432  1.015128959 
               721          722          723          724          725          726 
       0.668181658  0.524549337  1.300488458  0.938494388  0.511620245  0.487649906 
               727          728          729          730          731          732 
       0.912495073  1.042345527  0.811804183  0.622850336  0.946597907  1.241882345 
               733          734          735          736          737          738 
       0.984384567  0.590785644  0.827304510  0.126982466  1.113704080  1.215991804 
               739          740          741          742          743          744 
       1.160674207  0.792261068  0.437002803 -0.386733090  0.805026258 -0.024264334 
               745          746          747          748          749          750 
       0.457507338  1.192417888  0.451983207  0.777061539  1.132960237 -0.107084802 
               751          752          753          754          755          756 
       0.420587842  1.345258572  0.965619077  0.317609426  1.016081294  0.858316716 
               757          758          759          760          761          762 
       1.220998765  0.788621909  0.869180997  0.930019212  0.841103436  0.807977967 
               763          764          765          766          767          768 
       0.694754670  1.270850146  0.755093358  0.367020132  0.746502223  0.198878560 
               769          770          771          772          773          774 
       0.636586399  1.263905655 -0.656182196  0.662985819  1.263281258  0.980461089 
               775          776          777          778          779          780 
       0.580742673  0.675861225  0.194208541  1.211061514  1.101562211  0.936826568 
               781          782          783          784          785          786 
       1.447914539  1.165439912  1.295960129  1.250599799  1.163778064  0.575671689 
               787          788          789          790          791          792 
       1.383398481  1.096601429  1.441697963  1.848173024  1.510843214  1.902384688 
               793          794          795          796          797          798 
       1.334220584  1.672064225 -0.275924777  1.447467126  1.556288213  0.889374231 
               799          800          801          802          803          804 
      -0.722406039  1.554415619  1.864243447  1.434312582 -0.832612326  1.324379046 
               805          806          807          808          809          810 
       1.448063413  1.276474016  1.395654599  1.085934764  1.511942903  0.984930045 
               811          812          813          814          815          816 
       1.636030694 -0.172154272  1.819305005  1.841500117  0.225604458  1.037941644 
               817          818          819          820          821          822 
       1.274414346  1.614774856  1.576482052  1.460107402  1.202971095  0.545512999 
               823          824          825          826          827          828 
       1.263361773  1.616829071  1.254294444  1.736864864  1.571295002  1.670199921 
               829          830          831          832          833          834 
       1.680992595  0.952199698  1.391758969  0.950479586  1.807714921  1.570172802 
               835          836          837          838          839          840 
       0.604653263  1.492246412  1.493367578  1.825726722  1.172679480  1.195263287 
               841          842          843          844          845          846 
       0.794778619  1.588657467  1.632541215  1.610232793  1.818681663  1.389020504 
               847          848          849          850          851          852 
       1.239189282  1.304529227  1.729897391  1.122535715  1.712894409  2.028858319 
               853          854          855          856          857          858 
       1.945799395  2.036683522  1.201486129  1.708683566  1.480782793  1.776486080 
               859          860          861          862          863          864 
       1.996465057  1.294378885  1.439248948  2.073698569  1.436583062  0.704391181 
               865          866          867          868          869          870 
       2.075615412  1.715328593  2.464063079  1.809890445  2.201566393  1.394638922 
               871          872          873          874          875          876 
       2.238411517 -0.086415973  1.900166396  1.585031187  1.845369006  2.280235386 
               877          878          879          880          881          882 
       2.363766123  2.402025246  1.353135956  1.940163071  2.075457154  1.843119246 
               883          884          885          886          887          888 
       2.601757561  2.240241640  1.973656227  2.146939100  2.548850176  2.110082667 
               889          890          891          892          893          894 
       2.674621115  2.440582149  2.447066310  2.712632837  2.541440921  2.775575322 
               895          896          897          898          899          900 
       2.857235390  2.927849885  2.355836724  3.201309605  3.148836531  2.542910895 
               901          902          903          904          905          906 
       1.289136622  2.540671598  2.381997736  2.382861489  2.101575476  2.393213728 
               907          908          909          910          911          912 
       2.909918211  3.122683023  1.921373512  3.800652493  4.918420253  3.614817563 
               913          914          915 
       5.089535998  5.349236232  4.953133262 

---

    Code
      residuals(M_bioChem, type = "response")
    Output
                 1            2            3            4            5            6 
      -1.977367754 -1.303182952 -1.325792659 -1.462162196 -2.172231291 -0.962181349 
                 7            8            9           10           11           12 
      -1.224194048 -1.262470735 -1.681079759 -1.306671383 -2.014030541 -1.528852190 
                13           14           15           16           17           18 
      -1.193260863 -1.474008888 -1.313830299 -1.164039701 -1.564994172 -1.597935969 
                19           20           21           22           23           24 
      -1.353578277 -1.435532640 -1.530853762 -1.019019002 -1.585275343 -1.524401644 
                25           26           27           28           29           30 
      -0.967966634 -1.410968749 -1.347981318 -1.508904172 -1.135654614 -1.787814712 
                31           32           33           34           35           36 
      -1.127639546 -2.063415970 -1.540498163 -1.413141596 -1.362463972 -1.123198568 
                37           38           39           40           41           42 
      -1.120360992 -1.804275227 -1.427084860 -1.516210888 -1.804275227 -1.183281763 
                43           44           45           46           47           48 
      -1.628511479 -1.189283229 -1.638757970 -1.357784926 -1.704788182 -3.110040357 
                49           50           51           52           53           54 
      -1.628243102 -1.635577780 -1.638759630 -0.900938631 -1.538131626 -2.063415970 
                55           56           57           58           59           60 
      -1.442181152 -1.475436764 -1.194583813 -1.419741158 -1.430845503 -1.425491832 
                61           62           63           64           65           66 
      -1.313907312 -1.370483117 -1.261922153 -1.404986822 -1.356926990 -1.485725104 
                67           68           69           70           71           72 
      -2.173343611 -1.912822877 -1.371870493 -1.111947455 -1.484966343 -0.906516471 
                73           74           75           76           77           78 
      -1.346668792 -1.517931337 -1.442727461 -1.289059691 -1.134080963 -1.406301955 
                79           80           81           82           83           84 
      -1.553046230 -1.286415292 -1.181242355 -1.134052639 -2.165576957 -1.923108151 
                85           86           87           88           89           90 
      -2.650839935 -1.148398159 -2.727549642 -1.328921331 -2.707219926 -1.676669691 
                91           92           93           94           95           96 
      -1.436212207 -1.326788482 -1.771608212 -2.650839935 -1.632140561 -1.957461372 
                97           98           99          100          101          102 
      -1.766165368 -1.357143841 -1.012518716 -2.063415970 -1.293463230 -1.370483117 
               103          104          105          106          107          108 
      -1.338230311 -1.470880229 -1.158786340 -1.455226838 -1.592951879 -1.303182952 
               109          110          111          112          113          114 
      -1.011315346 -0.959944794 -1.753308583 -1.124563155 -1.160282579 -1.882488305 
               115          116          117          118          119          120 
      -1.252166209 -1.512725824 -1.820671993 -1.095371372 -1.475436764 -1.459946208 
               121          122          123          124          125          126 
      -1.369755746 -1.422087835 -1.754594657 -1.152437783 -1.178259335 -1.903676346 
               127          128          129          130          131          132 
      -1.392198242 -1.759996744 -1.413141596 -1.486739129 -1.186272861 -2.449094059 
               133          134          135          136          137          138 
      -1.491109521 -1.230533573 -1.404357103 -2.439356984 -1.563985499 -1.259880878 
               139          140          141          142          143          144 
      -0.968946530 -1.203499619 -1.094817358 -1.351994708 -1.418872526 -1.189283229 
               145          146          147          148          149          150 
      -1.180047765 -1.034261930 -1.656499099 -1.180047765 -1.762669950 -1.131974774 
               151          152          153          154          155          156 
      -1.485266879 -1.799314959 -1.443396094 -1.261529396 -1.497641199 -1.552260733 
               157          158          159          160          161          162 
      -1.303618884 -1.346532541 -1.486525432 -2.033775512 -1.426183134 -1.171839131 
               163          164          165          166          167          168 
      -1.417926727 -1.404072943 -1.780044270 -1.290717787 -1.681821722 -1.524670534 
               169          170          171          172          173          174 
      -1.670976173 -1.591985112 -1.407120818 -1.381167699 -1.157345620 -1.434224541 
               175          176          177          178          179          180 
      -1.193894511 -1.200399661 -1.615279912 -1.300549781 -1.072303097 -1.370483117 
               181          182          183          184          185          186 
      -1.095260547 -2.193138154 -1.764736325 -1.843028127 -1.601387278 -1.619870584 
               187          188          189          190          191          192 
      -1.249344646 -1.545886625 -1.109138303 -1.380886834 -1.120814521 -1.292815388 
               193          194          195          196          197          198 
      -1.128895299 -1.698589744 -1.583610941 -1.640976558 -1.329476124 -0.912128846 
               199          200          201          202          203          204 
      -2.067306678 -0.894444345 -1.556606045 -1.555090385 -1.213379774 -1.251875412 
               205          206          207          208          209          210 
      -1.384944659 -0.924859727 -1.426616109 -1.444804485 -1.123644547 -1.321830662 
               211          212          213          214          215          216 
      -1.176864777 -1.391064933 -1.348663442 -1.191241079 -1.371419878 -1.804275227 
               217          218          219          220          221          222 
      -1.817726892 -1.964010213 -1.529616661 -1.931420724 -1.791254993 -1.533521524 
               223          224          225          226          227          228 
      -1.619767663 -1.442291058 -1.403992067 -1.678813366 -1.444804485 -1.173856525 
               229          230          231          232          233          234 
      -1.526831818 -1.832500196 -1.360311144 -2.657719980 -1.432866731 -1.742102384 
               235          236          237          238          239          240 
      -1.754594657 -1.577325454 -1.226301572 -2.096506066 -1.370483117 -1.634619574 
               241          242          243          244          245          246 
      -1.149527503 -1.160981471 -1.597026289 -1.583310562 -1.517931337 -1.425491832 
               247          248          249          250          251          252 
      -1.302300531 -1.633026151 -1.171126751 -1.160159476 -2.313574677 -1.717353663 
               253          254          255          256          257          258 
      -1.261156289 -1.830715730 -1.237895359 -1.205877730 -1.388733357 -1.499106730 
               259          260          261          262          263          264 
      -1.580269659 -1.747854554 -1.545991039 -1.472109572 -1.370483117 -1.136804267 
               265          266          267          268          269          270 
      -1.217930825 -1.779334710 -1.148864203 -3.428170224 -1.285673001 -1.592017035 
               271          272          273          274          275          276 
      -1.324374249 -1.812769668 -1.365725126 -1.660190554 -1.696808087 -0.836583863 
               277          278          279          280          281          282 
      -0.199433081 -0.931420724  0.061922625 -0.481127866 -0.320571296 -0.656499099 
               283          284          285          286          287          288 
      -0.317908146 -0.304370214 -0.978758838 -0.180047765 -0.826576521 -1.032257009 
               289          290          291          292          293          294 
      -0.597511129 -1.276654399 -1.001840647 -0.767916060 -0.740340591 -0.502770542 
               295          296          297          298          299          300 
      -0.439084106 -0.692413840 -1.448940928  0.040904038 -0.555871228 -0.803543312 
               301          302          303          304          305          306 
      -0.631869936 -0.574683275 -2.818364599 -0.435012842 -0.574086998 -0.663216954 
               307          308          309          310          311          312 
      -0.660455873 -0.243040092 -0.925557427 -0.395954362 -0.143760854 -1.092338387 
               313          314          315          316          317          318 
      -1.222037355 -0.996464090 -1.041521241 -0.314040262 -1.258154420 -0.338461126 
               319          320          321          322          323          324 
      -0.369834650 -0.562622333 -0.777533467 -1.035834357 -0.242914326 -0.898603436 
               325          326          327          328          329          330 
      -0.960880061 -0.491497212 -0.213379774 -8.141654107 -0.886754220 -0.507224179 
               331          332          333          334          335          336 
      -0.675476026 -0.302523831 -1.071440530 -0.964010213 -0.400020080 -0.392285422 
               337          338          339          340          341          342 
      -0.392707980 -0.436212207 -0.513950795 -0.302523831 -0.229158706 -0.318301760 
               343          344          345          346          347          348 
      -0.458912540 -0.373223581 -0.246982441 -0.407013591 -0.513758278 -1.086851551 
               349          350          351          352          353          354 
      -0.172905542 -0.226300331 -0.480173384 -0.700653381 -0.358146012 -0.390684330 
               355          356          357          358          359          360 
      -0.661806971 -0.558970330 -0.202221696 -0.318224485 -0.271025248 -0.692756355 
               361          362          363          364          365          366 
      -1.262959954 -0.781846255 -1.006870532 -0.809758483 -0.133851491 -0.489600052 
               367          368          369          370          371          372 
      -0.114763722 -0.187028743 -0.202344561 -0.594114098 -0.227667199 -0.700761445 
               373          374          375          376          377          378 
      -0.226090099 -0.501337271 -0.796267516 -0.437711574 -0.517931337 -0.832051421 
               379          380          381          382          383          384 
      -0.741751644 -1.043804768 -1.650038090 -1.152553032 -0.344338738 -0.390642749 
               385          386          387          388          389          390 
      -0.333056335 -0.803621910 -0.371419878 -1.125149440 -0.186993251 -0.097354253 
               391          392          393          394          395          396 
      -0.862101064 -0.798087742 -0.256608421 -1.009637855 -0.832500196  0.057606284 
               397          398          399          400          401          402 
      -0.182557805 -0.478338862 -0.632140561 -0.492316987 -1.872858733 -0.663447714 
               403          404          405          406          407          408 
      -0.895596210 -0.417120959 -0.762949860 -0.419274820  0.047601407 -1.744830823 
               409          410          411          412          413          414 
      -0.777646417 -0.363894443 -0.207220613 -0.613430470 -0.361963801 -0.986190574 
               415          416          417          418          419          420 
      -0.129123768 -0.243040092 -0.439168462 -0.080579559 -0.783841291 -1.261501632 
               421          422          423          424          425          426 
      -1.108445606 -0.005804800 -0.158083069 -0.242794691 -0.243911182 -0.737460031 
               427          428          429          430          431          432 
      -1.067583320 -0.709787511 -0.693614663 -0.159256599 -0.571181950 -0.512725824 
               433          434          435          436          437          438 
      -0.832500196 -1.130872359 -0.575680488 -0.804275227 -0.512259272 -0.886683370 
               439          440          441          442          443          444 
      -0.649738160 -0.270929680 -0.979695563 -0.915259052 -0.365689633 -1.041316754 
               445          446          447          448          449          450 
      -0.822515105 -0.669728546 -0.421429077 -0.553046230 -0.869580627 -0.264094631 
               451          452          453          454          455          456 
      -1.168950028 -0.256952331 -0.157228524 -0.919987722 -3.266425610 -0.363335840 
               457          458          459          460          461          462 
      -0.476334251 -0.730157289 -1.183259537 -0.338382672 -0.137916698 -0.304899550 
               463          464          465          466          467          468 
      -0.353909846 -0.521004631 -0.735945666 -0.504323526 -0.849372132 -0.461719913 
               469          470          471          472          473          474 
      -0.619310176 -0.549016519 -1.948069014 -0.784733220 -0.431272844 -0.313298667 
               475          476          477          478          479          480 
      -0.439084106 -0.520550495 -0.570261471 -0.447682357 -0.202221696 -1.108445606 
               481          482          483          484          485          486 
      -1.101257152 -1.101257152 -3.371900004 -0.678019160 -0.600219756 -0.663216954 
               487          488          489          490          491          492 
      -0.748981653 -1.107421461 -0.563194469 -0.372808203 -0.611301696 -0.119284593 
               493          494          495          496          497          498 
      -0.547401079 -1.205239031 -0.483866412 -0.651645630 -0.354126218 -0.545991039 
               499          500          501          502          503          504 
      -0.772854545 -0.236398084 -0.842157934 -0.472109572 -0.450963084 -0.154427459 
               505          506          507          508          509          510 
      -0.358334568 -0.656499099 -0.835212589 -1.636115841 -0.923569583 -0.424345446 
               511          512          513          514          515          516 
      -0.690972493 -1.335357562 -0.726549776 -1.223975766 -0.224194048 -0.189157048 
               517          518          519          520          521          522 
      -0.271363263 -0.297040447 -0.670976173 -0.639927138 -0.724105782  0.148114862 
               523          524          525          526          527          528 
      -0.016681450  0.607104115  0.270826067  0.702343321  0.601395764  0.738843711 
               529          530          531          532          533          534 
       0.818518581  0.787271417  0.527890428  0.800809615  0.606498595  0.721758781 
               535          536          537          538          539          540 
       0.201912258  0.448943061  0.068579276  0.411461575  0.662022170  0.699450219 
               541          542          543          544          545          546 
      -0.728551314  0.862965663  0.549422808 -1.610804589  0.174347321 -1.560617125 
               547          548          549          550          551          552 
      -3.198001013 -0.096029694  0.171574392  0.587619350  0.706536770  0.819355091 
               553          554          555          556          557          558 
       0.554312471  0.298141827  0.318106690  0.864345386  0.150627868  0.689107622 
               559          560          561          562          563          564 
       0.486241722  0.204208235 -0.510150911  0.455109593  0.450198055  0.697684293 
               565          566          567          568          569          570 
       0.335276125  0.482830465  0.358849169  0.778984481 -0.930002315  0.079177621 
               571          572          573          574          575          576 
       0.373663449  0.492355898  0.395300675 -0.008621424  0.308613291  0.501632509 
               577          578          579          580          581          582 
       0.136839986  0.428148916  1.013071671  0.753433288  0.743047669  0.127722573 
               583          584          585          586          587          588 
       0.353588809  0.370438384  0.376582192  0.532799064  0.365380426  0.516133588 
               589          590          591          592          593          594 
       0.442232433 -0.963683372  0.512508528  0.821740665  0.404305754  0.512928653 
               595          596          597          598          599          600 
       0.020304437  0.581641368  0.867638946  0.226306202  0.696156272 -0.678225561 
               601          602          603          604          605          606 
       0.289510048  0.859402448  0.773698428  0.390267366  0.779886700 -1.062888250 
               607          608          609          610          611          612 
       0.319083751  0.659854362  0.115676934  0.473496457 -0.822740135  0.244449598 
               613          614          615          616          617          618 
       0.615055341  0.435606136  0.713845004  0.631965985  0.312991941 -0.746933822 
               619          620          621          622          623          624 
       0.349189736  0.235323196  0.035321748  0.363388106  0.145943901  0.691343952 
               625          626          627          628          629          630 
      -0.235621471  0.118083025  1.023796708  0.292234421 -0.227665185 -0.198239303 
               631          632          633          634          635          636 
       0.082912514  0.779633760  0.710196063  0.711983316  0.858248951  0.157538430 
               637          638          639          640          641          642 
      -0.385448338  0.683031442  0.756205045  0.069493160  0.646421723  0.095479414 
               643          644          645          646          647          648 
      -0.576798698  0.502454095 -0.334502811  0.689272989  0.627945927  0.336783046 
               649          650          651          652          653          654 
       0.475760092  0.520761886  0.731164101 -0.197443333  0.705222302  0.635500702 
               655          656          657          658          659          660 
       0.837014102  0.231189311  0.584945260  0.259659409 -0.152104511  0.524163462 
               661          662          663          664          665          666 
       0.599803287  0.336614751  0.238289667  0.780497800  0.813961333 -0.334502811 
               667          668          669          670          671          672 
       0.380232337  0.798425676 -3.631076088  0.244561302  0.504320074  0.769466427 
               673          674          675          676          677          678 
       0.745207869  0.537337501  0.170091920  0.688311553 -0.070317192 -1.024276654 
               679          680          681          682          683          684 
       0.367233131  0.349189736 -0.870946898 -1.009436348  0.572481892  0.364423878 
               685          686          687          688          689          690 
       0.570204723  0.437377667  0.544872920  0.883599576  1.041511027  0.189690263 
               691          692          693          694          695          696 
       0.443690785  0.781237922 -0.033353802 -0.431225599  0.641894593  0.813006749 
               697          698          699          700          701          702 
       0.671515177  0.370986103  0.195724773  1.454113375  1.856736145  1.233834632 
               703          704          705          706          707          708 
       0.501695648  1.107006501  1.066626007  1.807945885  1.441444150  1.084740948 
               709          710          711          712          713          714 
      -0.030084672  0.865152357  1.763601916  1.580439382 -1.232622241  0.964165643 
               715          716          717          718          719          720 
       1.084740948  1.167499804  1.689107622  1.520526984  1.419629930  1.528586981 
               721          722          723          724          725          726 
       1.079029123  0.870500843  1.840743401  1.435914980  0.851092874  0.814833666 
               727          728          729          730          731          732 
       1.403619937  1.560594326  1.274461726  1.014623081  1.445892222  1.780837467 
               733          734          735          736          737          738 
       1.491860527  0.968281245  1.294766847  0.226237381  1.642266182  1.753685521 
               739          740          741          742          743          744 
       1.694253765  1.248641756  0.737040046 -0.749834439  1.265534512 -0.044350165 
               745          746          747          748          749          750 
       0.768727786  1.728595140  0.760216589  1.228391788  1.663749029 -0.198435887 
               751          752          753          754          755          756 
       0.711483524  1.885061586  1.469146238  0.547339444  1.529714952  1.334930867 
               757          758          759          760          761          762 
       1.758969381  1.243806824  1.348855640  1.425435125  1.312713878  1.269425822 
               763          764          765          766          767          768 
       1.116177916  1.810716771  1.198863547  0.626918565  1.187232169  0.349961910 
               769          770          771          772          773          774 
       1.034276468  1.803601769 -1.327454105  1.071713018  1.802960560  1.487130088 
               775          776          777          778          779          780 
       0.953633087  1.089811129  0.342021489  1.748467112  1.628598878  1.433856298 
               781          782          783          784          785          786 
       1.982011534  1.699450219  1.836191281  2.111979879  1.994753271  1.084667419 
               787          788          789          790          791          792 
       2.282646337  1.900999099  2.354263123  2.797778304  2.436586923  2.849653535 
               793          794          795          796          797          798 
       2.220665290  2.617539464 -0.589730473  2.361240370  2.489149039  1.595116056 
               799          800          801          802          803          804 
      -1.646502712  2.487007347  2.813331517  2.345302370 -1.927869601  2.208089160 
               805          806          807          808          809          810 
       2.361960394  2.146052575  2.297869696  1.885867997  2.437873285  1.739280958 
               811          812          813          814          815          816 
       2.578427094 -0.362451800  2.769466427  2.791276580  0.448103613  1.816961356 
               817          818          819          820          821          822 
       2.143354810  2.554996522  2.512112949  2.376458473  2.048223356  1.032607592 
               823          824          825          826          827          828 
       2.128835166  2.557272539  2.116869476  2.685959738  2.506237398  2.615534596 
               829          830          831          832          833          834 
       2.627112717  1.690499748  2.293040595  1.687918815  2.757964423  2.504964148 
               835          836          837          838          839          840 
       1.134202617  2.414724657  2.416048503  2.775805952  2.006976851  2.037779449 
               841          842          843          844          845          846 
       1.447175273  2.525841962  2.574598871  2.549955195  2.768849795  2.289640543 
               847          848          849          850          851          852 
       2.096827853  2.182548967  2.678720944  1.937508859  3.040483460  3.424108659 
               853          854          855          856          857          858 
       3.328644059  3.432905220  2.302454586  3.034995926  2.723345601  3.122157423 
               859          860          861          862          863          864 
       3.387332951  2.447175273  2.663460668  3.474055164  2.659584514  1.448103613 
               865          866          867          868          869          870 
       3.476165476  3.043651175  3.862384685  3.164159297  3.610387191  2.598084838 
               871          872          873          874          875          876 
       3.648005292 -0.198001013  3.274562867  2.869468122  3.208089160  3.689809818 
               877          878          879          880          881          882 
       3.770468134  4.287149833  2.794643718  3.700519625  3.883939778  3.563079075 
               883          884          885          886          887          888 
       4.506192733  4.094396513  3.746816869  3.976983053  4.450198055  3.929343851 
               889          890          891          892          893          894 
       4.580930616  4.331059822  4.338367662  4.618832301  4.442240101  4.679963064 
               895          896          897          898          899          900 
       5.276306060  5.353930054  4.653759107  5.631318370  5.580930616  4.900663658 
               901          902          903          904          905          906 
       2.914816214  4.897810985  4.689331057  4.690499748  4.290418410  4.704477964 
               907          908          909          910          911          912 
       5.817623903  6.560798004  4.637548200  7.913413817  9.641853988  8.675315887 
               913          914          915 
      10.453226635 13.228204062 14.339413832 

---

    Code
      residuals(M_bioChem, type = "pearson")
    Output
                 1            2            3            4            5            6 
      -1.227824326 -0.972684512 -0.981613545 -1.034780982 -1.298472056 -0.832648948 
                 7            8            9           10           11           12 
      -0.941198967 -0.956515018 -1.118093972 -0.974064469 -1.241201778 -1.060400992 
                13           14           15           16           17           18 
      -0.928735171 -1.039348975 -0.976893748 -0.916885976 -1.074192987 -1.086710643 
                19           20           21           22           23           24 
      -0.992539549 -1.024484905 -1.061166449 -0.856841197 -1.081905534 -1.058698274 
                25           26           27           28           29           30 
      -0.835130815 -1.014952092 -0.990342756 -1.052761486 -0.905301784 -1.157977571 
                31           32           33           34           35           36 
      -0.902016988 -1.259157804 -1.064852002 -1.015796741 -0.996023029 -0.900194270 
                37           38           39           40           41           42 
      -0.899028627 -1.164090911 -1.021210375 -1.055562044 -1.164090911 -0.924697071 
                43           44           45           46           47           48 
      -1.098285771 -0.927126630 -1.102155795 -0.994189321 -1.126990750 -1.623384671 
                49           50           51           52           53           54 
      -1.098184347 -1.100955139 -1.102156422 -0.806081027 -1.063948061 -1.259157804 
                55           56           57           58           59           60 
      -1.027059172 -1.039899047 -0.929269867 -1.018360497 -1.022668576 -1.020592430 
                61           62           63           64           65           66 
      -0.976924166 -0.999162494 -0.956296307 -1.012625311 -0.993852946 -1.043859323 
                67           68           69           70           71           72 
      -1.298872191 -1.204172465 -0.999705236 -0.895567758 -1.043567444 -0.808524153 
                73           74           75           76           77           78 
      -0.989827299 -1.056221078 -1.027270590 -0.967088840 -0.904657347 -1.013137037 
                79           80           81           82           83           84 
      -1.069640469 -0.966039539 -0.923870749 -0.904645745 -1.296077560 -1.207950198 
                85           86           87           88           89           90 
      -1.467480121 -0.910511818 -1.493970392 -0.982846375 -1.486966577 -1.116436585 
                91           92           93           94           95           96 
      -1.024748144 -0.982006013 -1.151949098 -1.467480121 -1.099656960 -1.220543708 
                97           98           99          100          101          102 
      -1.149922341 -0.993937972 -0.854095268 -1.259157804 -0.968835055 -0.999162494 
               103          104          105          106          107          108 
      -0.986510637 -1.038143318 -0.914747659 -1.032103247 -1.084819882 -0.972684512 
               109          110          111          112          113          114 
      -0.853586356 -0.831688241 -1.145130534 -0.900754545 -0.915356941 -1.193010850 
               115          116          117          118          119          120 
      -0.952402950 -1.054226604 -1.170171089 -0.888728369 -1.039899047 -1.033925675 
               121          122          123          124          125          126 
      -0.998877898 -1.019271512 -1.145610136 -0.912160184 -0.922661439 -1.200810136 
               127          128          129          130          131          132 
      -1.007643830 -1.147624014 -1.015796741 -1.044249350 -0.925908341 -1.397011690 
               133          134          135          136          137          138 
      -1.045929731 -0.943743632 -1.012380247 -1.393581899 -1.073808911 -0.955482283 
               139          140          141          142          143          144 
      -0.835550734 -0.932869479 -0.888499293 -0.991918207 -1.018023201 -0.927126630 
               145          146          147          148          149          150 
      -0.923386558 -0.863260267 -1.108846018 -0.923386558 -1.148620178 -0.903794454 
               151          152          153          154          155          156 
      -1.043683057 -1.162249708 -1.027529324 -0.956139707 -1.048439267 -1.069340936 
               157          158          159          160          161          162 
      -0.972857005 -0.989773784 -1.044167159 -1.248389517 -1.020860608 -0.920056037 
               163          164          165          166          167          168 
      -1.017655891 -1.012269655 -1.155088314 -0.967746518 -1.118372739 -1.058801175 
               169          170          171          172          173          174 
      -1.114295691 -1.084453002 -1.013455610 -1.003339223 -0.914160791 -1.023978125 
               175          176          177          178          179          180 
      -0.928991291 -0.931618684 -1.093281640 -0.971642315 -0.879162614 -0.999162494 
               181          182          183          184          185          186 
      -0.888682547 -1.305987095 -1.149390028 -1.178446100 -1.088019279 -1.095018673 
               187          188          189          190          191          192 
      -0.951275576 -1.066909215 -0.894410651 -1.003229520 -0.899214985 -0.968578242 
               193          194          195          196          197          198 
      -0.902532041 -1.124666882 -1.081273303 -1.102993153 -0.983064918 -0.810977491 
               199          200          201          202          203          204 
      -1.260569370 -0.803230274 -1.070997566 -1.070419829 -0.936850636 -0.952286788 
               205          206          207          208          209          210 
      -1.004813995 -0.816524608 -1.021028558 -1.028074233 -0.900377401 -0.980051403 
               211          212          213          214          215          216 
      -0.922095819 -1.007201903 -0.990610597 -0.927918547 -0.999528969 -1.164090911 
               217          218          219          220          221          222 
      -1.169079690 -1.222940252 -1.060693370 -1.211000906 -1.159256068 -1.062186371 
               223          224          225          226          227          228 
      -1.094979740 -1.027101707 -1.012238178 -1.117242317 -1.028074233 -0.920875116 
               229          230          231          232          233          234 
      -1.059628146 -1.174551375 -0.995179513 -1.469862973 -1.023451982 -1.140948915 
               235          236          237          238          239          240 
      -1.145610136 -1.078884592 -0.942045279 -1.271148978 -0.999162494 -1.100593292 
               241          242          243          244          245          246 
      -0.910972799 -0.915641466 -1.086365630 -1.081159189 -1.056221078 -1.020592430 
               247          248          249          250          251          252 
      -0.972335308 -1.099991481 -0.919766718 -0.915306820 -1.349041985 -1.131697100 
               253          254          255          256          257          258 
      -0.955990931 -1.173890850 -0.946694601 -0.933828470 -1.006292476 -1.049002037 
               259          260          261          262          263          264 
      -1.080003720 -1.143095935 -1.066949065 -1.038617119 -0.999162494 -0.905772437 
               265          266          267          268          269          270 
      -0.938681741 -1.154824373 -0.910702065 -1.727313123 -0.965744906 -1.084465117 
               271          272          273          274          275          276 
      -0.981054415 -1.167241955 -0.997300247 -1.110236428 -1.123998638 -0.535709241 
               277          278          279          280          281          282 
      -0.154837960 -0.584000848  0.054277379 -0.338511443 -0.237788826 -0.439454759 
               283          284          285          286          287          288 
      -0.236036421 -0.227082134 -0.607573502 -0.140887251 -0.530524632 -0.633821726 
               289          290          291          292          293          294 
      -0.406398064 -0.749110025 -0.618947821 -0.499766111 -0.485079627 -0.351427197 
               295          296          297          298          299          300 
      -0.313003917 -0.459184761 -0.826524342  0.035454727 -0.382538755 -0.518523286 
               301          302          303          304          305          306 
      -0.425754259 -0.393374069 -1.365233474 -0.310503488 -0.393032067 -0.443167292 
               307          308          309          310          311          312 
      -0.441642665 -0.185501128 -0.581057433 -0.286227620 -0.114205391 -0.662835898 
               313          314          315          316          317          318 
      -0.723945914 -0.616305159 -0.638326763 -0.233486005 -0.740622056 -0.249485189 
               319          320          321          322          323          324 
      -0.269690270 -0.386438096 -0.504853262 -0.635562708 -0.185414061 -0.567456742 
               325          326          327          328          329          330 
      -0.598709947 -0.344717230 -0.164750543 -2.690731886 -0.561440854 -0.354067620 
               331          332          333          334          335          336 
      -0.449915740 -0.225854859 -0.652797654 -0.600265154 -0.288779439 -0.283919743 
               337          338          339          340          341          342 
      -0.284185792 -0.311240670 -0.358044585 -0.225854859 -0.175844394 -0.236295612 
               343          344          345          346          347          348 
      -0.325104016 -0.271850184 -0.188226497 -0.293155114 -0.357930947 -0.660205728 
               349          350          351          352          353          354 
      -0.135695206 -0.173844074 -0.337938557 -0.463671117 -0.262207182 -0.282911084 
               355          356          357          358          359          360 
      -0.442388938 -0.384330274 -0.156828144 -0.236244733 -0.204687731 -0.459371550 
               361          362          363          364          365          366 
      -0.742830346 -0.507128760 -0.621416386 -0.521771170 -0.106783961 -0.343584274 
               367          368          369          370          371          372 
      -0.092317077 -0.145934714 -0.156915736 -0.404468406 -0.174801133 -0.463729861 
               373          374          375          376          377          378 
      -0.173696790 -0.350576208 -0.514712098 -0.312161572 -0.360391792 -0.533363268 
               379          380          381          382          383          384 
      -0.485834821 -0.639435421 -0.913549025 -0.691454503 -0.253299773 -0.282884876 
               385          386          387          388          389          390 
      -0.245965259 -0.518564403 -0.270701142 -0.678485298 -0.145909119 -0.078918253 
               391          392          393          394          395          396 
      -0.548850055 -0.515666484 -0.194849687 -0.622773013 -0.533595713  0.050376793 
               397          398          399          400          401          402 
      -0.142705180 -0.336836677 -0.425905577 -0.345206451 -1.006342805 -0.443294635 
               403          404          405          406          407          408 
      -0.565932125 -0.299448719 -0.497132218 -0.300785293  0.041405971 -0.953463822 
               409          410          411          412          413          414 
      -0.504912901 -0.265893849 -0.160385499 -0.415402365 -0.264657075 -0.611244093 
               415          416          417          418          419          420 
      -0.103222020 -0.185501128 -0.313055667 -0.065816173 -0.508180176 -0.742160460 
               421          422          423          424          425          426 
      -0.670535075 -0.004912839 -0.124827690 -0.185331232 -0.186103965 -0.483536707 
               427          428          429          430          431          432 
      -0.650938684 -0.468627556 -0.459839512 -0.125692708 -0.391364499 -0.357321331 
               433          434          435          436          437          438 
      -0.533595713 -0.681201255 -0.393945827 -0.518906133 -0.357045752 -0.561404814 
               439          440          441          442          443          444 
      -0.435707948 -0.204622832 -0.608036599 -0.575874578 -0.267042577 -0.638227450 
               445          446          447          448          449          450 
      -0.528415410 -0.446756045 -0.302120518 -0.380903425 -0.552680745 -0.199970334 
               451          452          453          454          455          456 
      -0.699171901 -0.195085501 -0.124197294 -0.578256440 -1.517870683 -0.265536153 
               457          458          459          460          461          462 
      -0.335631445 -0.479617561 -0.705881197 -0.249434179 -0.109835752 -0.227433710 
               463          464          465          466          467          468 
      -0.259482236 -0.362200894 -0.482724890 -0.352348578 -0.542308990 -0.326806915 
               469          470          471          472          473          474 
      -0.418712192 -0.378566958 -1.036882491 -0.508649993 -0.308201632 -0.232996293 
               475          476          477          478          479          480 
      -0.313003917 -0.361933737 -0.390835659 -0.318266651 -0.156828144 -0.670535075 
               481          482          483          484          485          486 
      -0.667103056 -0.667103056 -1.552282109 -0.451311482 -0.407934590 -0.443167292 
               487          488          489          490          491          492 
      -0.489698028 -0.670046507 -0.386767992 -0.271585677 -0.414201934 -0.095764291 
               493          494          495          496          497          498 
      -0.377629063 -0.716141105 -0.340153582 -0.436766109 -0.259621587 -0.376809835 
               499          500          501          502          503          504 
      -0.502380560 -0.180892378 -0.538589405 -0.333087355 -0.320268304 -0.122127960 
               505          506          507          508          509          510 
      -0.262328311 -0.439454759 -0.534999857 -0.907629499 -0.580058307 -0.303925576 
               511          512          513          514          515          516 
      -0.458398450 -0.775810566 -0.477677496 -0.724844525 -0.172367450 -0.147468226 
               517          518          519          520          521          522 
      -0.204917239 -0.222201443 -0.447442561 -0.430251923 -0.476361629  0.094514641 
               523          524          525          526          527          528 
      -0.010274877  0.439307672  0.177940793  0.525271336  0.434357420  0.560063724 
               529          530          531          532          533          534 
       0.640115589  0.608008551  0.372442409  0.621801422  0.438781551  0.543640891 
               535          536          537          538          539          540 
       0.130461074  0.309380702  0.042999210  0.280555008  0.488069499  0.522560104 
               541          542          543          544          545          546 
      -0.398997546  0.687518181  0.390240466 -0.796436769  0.111925931 -0.775569243 
               547          548          549          550          551          552 
      -1.373598024 -0.058229849  0.110075104  0.422498015  0.529213027  0.640988494 
               553          554          555          556          557          558 
       0.394320147  0.197240661  0.211529711  0.689024118  0.096173213  0.512921666 
               559          560          561          562          563          564 
       0.338760400  0.132016306 -0.288280659  0.314188999  0.310357731  0.520908455 
               565          566          567          568          569          570 
       0.223945845  0.336043411  0.241191589  0.599652141 -0.496119869  0.049757944 
               571          572          573          574          575          576 
       0.252150815  0.343645693  0.268331259 -0.005319038  0.204715544  0.351096200 
               577          578          579          580          581          582 
       0.087097324  0.293305070  0.865570647  0.574286125  0.564142876  0.081127767 
               583          584          585          586          587          588 
       0.237322853  0.249756870  0.254321313  0.376476044  0.246011520  0.362837106 
               589          590          591          592          593          594 
       0.304169655 -0.511941581  0.359891130  0.643481789  0.275127640  0.360232178 
               595          596          597          598          599          600 
       0.012601711  0.417389732  0.692627675  0.147076633  0.519481303 -0.374019982 
               601          602          603          604          605          606 
       0.191111112  0.683638909  0.594355392  0.264548589  0.600558788 -0.557900685 
               607          608          609          610          611          612 
       0.212233070  0.486104150  0.073279382  0.328640380 -0.444956482  0.159568790 
               613          614          615          616          617          618 
       0.446238924  0.299045847  0.536116371  0.461122337  0.207853988 -0.408046467 
               619          620          621          622          623          624 
       0.234096582  0.153270512  0.021990888  0.244539280  0.093083397  0.514998642 
               625          626          627          628          629          630 
      -0.139248916  0.074843617  0.879543988  0.193042621 -0.134736239 -0.117940344 
               631          632          633          634          635          636 
       0.052147267  0.600304530  0.532664180  0.534353712  0.682386141  0.100744324 
               637          638          639          640          641          642 
      -0.222103499  0.507298010  0.577009264  0.043580772  0.474002233  0.060215832 
               643          644          645          646          647          648 
      -0.322726049  0.351758309 -0.194365719  0.513075117  0.457566458  0.225041338 
               649          650          651          652          653          654 
       0.330431540  0.366609084  0.552651217 -0.117483663  0.527975958  0.464258179 
               655          656          657          658          659          660 
       0.659584638  0.150427356  0.420210158  0.170131816 -0.091260100  0.369389011 
               661          662          663          664          665          666 
       0.432980248  0.224918945  0.155314475  0.601173321  0.635372553 -0.194365719 
               667          668          669          670          671          672 
       0.257041003  0.619359754 -1.507396644  0.159646063  0.353263456  0.590133464 
               673          674          675          676          677          678 
       0.566244895  0.380217835  0.109086623  0.512183260 -0.042851636 -0.540124695 
               679          680          681          682          683          684 
       0.247382132  0.234096582 -0.468100244 -0.533254978  0.409606464  0.245304457 
               685          686          687          688          689          690 
       0.407679550  0.300413586  0.386457046  0.710267164  0.903047200  0.122211897 
               691          692          693          694          695          696 
       0.305300225  0.601918069 -0.020475246 -0.246670736  0.469952770  0.634381714 
               697          698          699          700          701          702 
       0.496716838  0.250163117  0.126278644  1.003570982  1.475325366  0.803330217 
               703          704          705          706          707          708 
       0.284012993  0.699925026  0.668494216  1.407839529  0.991208792  0.682511399 
               709          710          711          712          713          714 
      -0.015853248  0.520750975  1.349512398  1.133693217 -0.574523934  0.591588532 
               715          716          717          718          719          720 
       0.682511399  0.748315609  1.257249039  1.070352720  0.970190342  1.078695267 
               721          722          723          724          725          726 
       0.678077273  0.524497326  1.452800225  0.985849681  0.510944583  0.485925721 
               727          728          729          730          731          732 
       0.954973344  1.112366113  0.838119538  0.628972530  0.995535887  1.371861082 
               733          734          735          736          737          738 
       1.041107829  0.594603809  0.855839673  0.123148101  1.202511547  1.336832561 
               739          740          741          742          743          744 
       1.263409721  0.815909308  0.433502036 -0.365652871  0.830400145 -0.023330541 
               745          746          747          748          749          750 
       0.454656169  1.305311037  0.448947887  0.798734620  1.227322330 -0.102530993 
               751          752          753          754          755          756 
       0.416632831  1.516246191  1.018391655  0.312039448  1.079867075  0.891579032 
               757          758          759          760          761          762 
       1.343572930  0.811789429  0.904191897  0.975751303  0.871694245  0.833759688 
               763          764          765          766          767          768 
       0.707158525  1.411576063  0.774061011  0.361969686  0.764458838  0.193757564 
               769          770          771          772          773          774 
       0.643786654  1.402003892 -0.613509880  0.672417108  1.401144830  1.036344379 
               775          776          777          778          779          780 
       0.583898652  0.686458618  0.189149512  1.330211054  1.186975701  0.983859852 
               781          782          783          784          785          786 
       1.667412788  1.269661314  1.446462350  1.336806950  1.231522006  0.579692881 
               787          788          789          790          791          792 
       1.504212148  1.152057280  1.580425368  2.169749277  1.673196708  2.257501830 
               793          794          795          796          797          798 
       1.441256885  1.900670258 -0.266397543  1.588064650  1.735669702  0.916269669 
               799          800          801          802          803          804 
      -0.682714501  1.733070973  2.195505919  1.570672066 -0.782499630  1.428798113 
               805          806          807          808          809          810 
       1.588855252  1.368791645  1.520088416  1.139588437  1.674694034  1.023384359 
               811          812          813          814          815          816 
       1.848376475 -0.166996755  2.124010559  2.159116700  0.222889935  1.083963745 
               817          818          819          820          821          822 
       1.366234848  1.817935263  1.763831008  1.604865510  1.278672413  0.548305707 
               823          824          825          826          827          828 
       1.352546421  1.820864260  1.341356377  1.996986005  1.756573352  1.897943015 
               829          830          831          832          833          834 
       1.913764631  0.986405548  1.515033862  0.984470746  2.105834987  1.755005381 
               835          836          837          838          839          840 
       0.609992478  1.647981204  1.649495783  2.134127102  1.242177993  1.269351799 
               841          842          843          844          845          846 
       0.812575126  1.780932797  1.843358664  1.811468694  2.123030320  1.511485334 
               847          848          849          850          851          852 
       1.322793284  1.403807020  1.986485285  1.182540438  1.895023606  2.343023863 
               853          854          855          856          857          858 
       2.219496825  2.354897778  1.266332422  1.889422121  1.597993546  1.980689138 
               859          860          861          862          863          864 
       2.294310287  1.374065597  1.547102340  2.411638741  1.543856609  0.720297072 
               865          866          867          868          869          870 
       2.414603328  1.898265617  3.076368335  2.026526155  2.615364544  1.493106821 
               871          872          873          874          875          876 
       2.676432718 -0.085044939  2.153493076  1.728586326  2.075872578  2.747116887 
               877          878          879          880          881          882 
       2.892840893  2.828342332  1.442848733  2.162918003  2.346119439  2.036333471 
               883          884          885          886          887          888 
       3.158260728  2.581593905  2.207503461  2.446471905  3.067879469  2.394402402 
               889          890          891          892          893          894 
       3.286550955  2.889716600  2.900141640  3.355317109  3.055401427  3.472094435 
               895          896          897          898          899          900 
       3.471438687  3.593794013  2.698845526  4.108064533  4.003992722  2.969744557 
               901          902          903          904          905          906 
       1.376923012  2.966392765  2.735681992  2.736903676  2.355788892  2.751573339 
               907          908          909          910          911          912 
       3.471099885  3.748213983  2.136713074  4.807233704  7.059029787  4.420005699 
               913          914          915 
       7.212550671  7.202417151  6.438455395 

---

    Code
      influence(M_bioChem)
    Output
      $hat
                1           2           3           4           5           6 
      0.004805283 0.004567173 0.003677432 0.005721927 0.007880318 0.006131357 
                7           8           9          10          11          12 
      0.003296051 0.005255914 0.007210943 0.005977464 0.006251496 0.010773555 
               13          14          15          16          17          18 
      0.003786550 0.004107798 0.004738046 0.003253224 0.005087617 0.007414154 
               19          20          21          22          23          24 
      0.003496570 0.004652583 0.004511540 0.009979347 0.004324047 0.002602589 
               25          26          27          28          29          30 
      0.009711585 0.005638751 0.003784361 0.004397478 0.003241210 0.004866418 
               31          32          33          34          35          36 
      0.003624002 0.006715645 0.007459534 0.006007321 0.004547317 0.004147073 
               37          38          39          40          41          42 
      0.004597356 0.006520143 0.005504341 0.004607412 0.006520143 0.003298873 
               43          44          45          46          47          48 
      0.005564020 0.003463096 0.006593347 0.005494320 0.004589907 0.008960554 
               49          50          51          52          53          54 
      0.005834682 0.005148887 0.006914465 0.006077557 0.005788576 0.006715645 
               55          56          57          58          59          60 
      0.003134559 0.005162929 0.003273653 0.002782139 0.003663414 0.004990716 
               61          62          63          64          65          66 
      0.003523753 0.003398418 0.003602227 0.004187856 0.003869986 0.002673272 
               67          68          69          70          71          72 
      0.007910866 0.006753332 0.003260459 0.006464233 0.006112020 0.005688133 
               73          74          75          76          77          78 
      0.004817295 0.006184374 0.006474148 0.005416832 0.005621995 0.003221669 
               79          80          81          82          83          84 
      0.003113008 0.003369760 0.004111658 0.003604785 0.003061523 0.005266333 
               85          86          87          88          89          90 
      0.008359288 0.008148113 0.014782783 0.005354749 0.008660930 0.002804952 
               91          92          93          94          95          96 
      0.004493655 0.003755293 0.007237888 0.008359288 0.005944601 0.007534662 
               97          98          99         100         101         102 
      0.007363407 0.003621118 0.006445564 0.006715645 0.003635368 0.003398418 
              103         104         105         106         107         108 
      0.007637765 0.003955410 0.006100341 0.002721470 0.004744168 0.004567173 
              109         110         111         112         113         114 
      0.010275113 0.005950275 0.004794909 0.003962755 0.003452666 0.004652030 
              115         116         117         118         119         120 
      0.005783908 0.005133061 0.006472909 0.003328541 0.005162929 0.002946111 
              121         122         123         124         125         126 
      0.004086579 0.003642317 0.003570536 0.004047415 0.004295917 0.002655509 
              127         128         129         130         131         132 
      0.005118077 0.004439278 0.006007321 0.005209421 0.003571702 0.003981922 
              133         134         135         136         137         138 
      0.006473375 0.004848100 0.004826426 0.013785614 0.004384107 0.003470693 
              139         140         141         142         143         144 
      0.009706365 0.005453038 0.003351819 0.006506257 0.005364051 0.003463096 
              145         146         147         148         149         150 
      0.004279701 0.006216264 0.005139232 0.004279701 0.004558981 0.010929151 
              151         152         153         154         155         156 
      0.006070224 0.005084694 0.004465979 0.013388260 0.005026730 0.003191654 
              157         158         159         160         161         162 
      0.005736891 0.004836570 0.004010759 0.004550198 0.003940015 0.003550040 
              163         164         165         166         167         168 
      0.006808271 0.004868664 0.005074282 0.003472889 0.004880124 0.005238030 
              169         170         171         172         173         174 
      0.004393528 0.004648094 0.004390155 0.005590452 0.003531172 0.005891411 
              175         176         177         178         179         180 
      0.005489789 0.003505507 0.004428540 0.004403073 0.007991890 0.003398418 
              181         182         183         184         185         186 
      0.003332912 0.004720432 0.007114590 0.003805223 0.006100849 0.006803936 
              187         188         189         190         191         192 
      0.003469426 0.004961837 0.007264598 0.004829161 0.004519312 0.004928894 
              193         194         195         196         197         198 
      0.003516305 0.005096952 0.005985650 0.004658376 0.003755049 0.005737472 
              199         200         201         202         203         204 
      0.003160749 0.007081893 0.006942180 0.002932415 0.006006383 0.003366171 
              205         206         207         208         209         210 
      0.004345271 0.006025262 0.003922256 0.006170251 0.010629861 0.003939331 
              211         212         213         214         215         216 
      0.005342659 0.003684039 0.003836643 0.007287359 0.004228932 0.006520143 
              217         218         219         220         221         222 
      0.007017609 0.006605566 0.006821571 0.004367745 0.004611639 0.005119385 
              223         224         225         226         227         228 
      0.004195486 0.004421263 0.004107977 0.007686677 0.006170251 0.003735603 
              229         230         231         232         233         234 
      0.004947456 0.004913773 0.004461910 0.010681494 0.005041977 0.005026255 
              235         236         237         238         239         240 
      0.003570536 0.008175737 0.003327771 0.009834031 0.003398418 0.006266104 
              241         242         243         244         245         246 
      0.004286745 0.003319174 0.002719709 0.004132495 0.006184374 0.004990716 
              247         248         249         250         251         252 
      0.005621209 0.005411956 0.006017610 0.003354408 0.005134369 0.006369549 
              253         254         255         256         257         258 
      0.003547880 0.004957818 0.004334282 0.004055763 0.004030758 0.005714430 
              259         260         261         262         263         264 
      0.004099189 0.005353508 0.004003381 0.004443004 0.003398418 0.003245554 
              265         266         267         268         269         270 
      0.006710349 0.006524470 0.005385142 0.018360224 0.005644017 0.007668393 
              271         272         273         274         275         276 
      0.003815176 0.005000081 0.005531473 0.004792571 0.002957134 0.004609574 
              277         278         279         280         281         282 
      0.004371391 0.004367745 0.009914564 0.003854352 0.003440148 0.005139232 
              283         284         285         286         287         288 
      0.003982712 0.004396514 0.007133861 0.004279701 0.005568705 0.004713624 
              289         290         291         292         293         294 
      0.002692936 0.006968256 0.007457202 0.006460135 0.005214435 0.003950959 
              295         296         297         298         299         300 
      0.004138196 0.005895737 0.007061100 0.010909085 0.006202856 0.008244604 
              301         302         303         304         305         306 
      0.005563353 0.004237221 0.026192597 0.003913023 0.002920270 0.004588240 
              307         308         309         310         311         312 
      0.005135625 0.004011184 0.005683825 0.003729196 0.005190758 0.007339843 
              313         314         315         316         317         318 
      0.006992197 0.006527176 0.009557738 0.003517851 0.011498410 0.004314229 
              319         320         321         322         323         324 
      0.004722039 0.005872970 0.006147022 0.004511143 0.004026121 0.008550807 
              325         326         327         328         329         330 
      0.008278646 0.003841018 0.006006383 0.220082323 0.005233479 0.004132016 
              331         332         333         334         335         336 
      0.006312389 0.004667839 0.006227012 0.006605566 0.003880407 0.005433354 
              337         338         339         340         341         342 
      0.008180640 0.004493655 0.005395927 0.004667839 0.003445044 0.003419977 
              343         344         345         346         347         348 
      0.002879893 0.006157427 0.006457094 0.003157095 0.004370976 0.005827721 
              349         350         351         352         353         354 
      0.005603104 0.007418098 0.002956461 0.004895342 0.005397521 0.005498434 
              355         356         357         358         359         360 
      0.004721608 0.007298740 0.005732994 0.004222694 0.003490594 0.005843768 
              361         362         363         364         365         366 
      0.009129062 0.005134181 0.008725145 0.007130198 0.005644924 0.004822315 
              367         368         369         370         371         372 
      0.005750797 0.006271490 0.003663997 0.006140266 0.003373158 0.003359608 
              373         374         375         376         377         378 
      0.005374700 0.007561901 0.003956434 0.005261539 0.006184374 0.005435932 
              379         380         381         382         383         384 
      0.007719027 0.003306969 0.009976978 0.005044942 0.006842485 0.003663776 
              385         386         387         388         389         390 
      0.004450415 0.004416794 0.004228932 0.006498758 0.003516568 0.010447319 
              391         392         393         394         395         396 
      0.007673465 0.005097523 0.005424042 0.007107502 0.004913773 0.011256704 
              397         398         399         400         401         402 
      0.003944292 0.006753417 0.005944601 0.006738481 0.017570529 0.004328234 
              403         404         405         406         407         408 
      0.006725818 0.004700295 0.007377720 0.006347735 0.005832286 0.012309367 
              409         410         411         412         413         414 
      0.002613866 0.004059712 0.004239805 0.002879236 0.004261463 0.004453837 
              415         416         417         418         419         420 
      0.003498617 0.004011184 0.005209076 0.006252040 0.007417663 0.005239399 
              421         422         423         424         425         426 
      0.009341447 0.010942579 0.006201856 0.003363303 0.011468814 0.002804431 
              427         428         429         430         431         432 
      0.007021091 0.006835904 0.006539018 0.006681771 0.004455146 0.005133061 
              433         434         435         436         437         438 
      0.004913773 0.008276472 0.003056234 0.006520143 0.005501244 0.004453444 
              439         440         441         442         443         444 
      0.005390158 0.005629009 0.004425393 0.005990189 0.003903460 0.007157731 
              445         446         447         448         449         450 
      0.006163738 0.003486057 0.004246398 0.003113008 0.006042528 0.003789054 
              451         452         453         454         455         456 
      0.007073219 0.003356435 0.003540411 0.005977782 0.025644210 0.005877611 
              457         458         459         460         461         462 
      0.005513544 0.006759020 0.005210943 0.006308300 0.006509193 0.005123138 
              463         464         465         466         467         468 
      0.004045330 0.006359353 0.006527817 0.005013916 0.006615558 0.003081987 
              469         470         471         472         473         474 
      0.005078263 0.005745860 0.014394930 0.005280763 0.004989154 0.004813059 
              475         476         477         478         479         480 
      0.004138196 0.002726958 0.005252821 0.007024807 0.005732994 0.009341447 
              481         482         483         484         485         486 
      0.003036623 0.003036623 0.025203921 0.007013843 0.005811157 0.004588240 
              487         488         489         490         491         492 
      0.005786600 0.007478802 0.004332526 0.004367785 0.005214042 0.004791836 
              493         494         495         496         497         498 
      0.004496441 0.005059767 0.007104920 0.005757810 0.003507825 0.004003381 
              499         500         501         502         503         504 
      0.005076790 0.003658018 0.006888844 0.004443004 0.002689504 0.003280378 
              505         506         507         508         509         510 
      0.005372516 0.005139232 0.005081710 0.013168450 0.005388105 0.003010752 
              511         512         513         514         515         516 
      0.005477664 0.003647093 0.005944029 0.003363975 0.003296051 0.003384396 
              517         518         519         520         521         522 
      0.008470254 0.005331580 0.004393528 0.002575798 0.006318807 0.004541185 
              523         524         525         526         527         528 
      0.006120671 0.003791149 0.007134396 0.005542069 0.003834610 0.003547880 
              529         530         531         532         533         534 
      0.004079864 0.003937840 0.004443004 0.004407795 0.005441064 0.003683000 
              535         536         537         538         539         540 
      0.005097523 0.005754327 0.004367745 0.005679900 0.004215391 0.004403073 
              541         542         543         544         545         546 
      0.010140554 0.003248209 0.003936543 0.021713941 0.005693627 0.028777107 
              547         548         549         550         551         552 
      0.043768170 0.004733206 0.005337129 0.006954841 0.003635368 0.004193791 
              553         554         555         556         557         558 
      0.002874419 0.007192981 0.006114125 0.003241210 0.006615558 0.006539853 
              559         560         561         562         563         564 
      0.004370976 0.004409051 0.007268558 0.005141396 0.005540981 0.006973822 
              565         566         567         568         569         570 
      0.005403589 0.002940325 0.007726734 0.007313210 0.031847297 0.007471977 
              571         572         573         574         575         576 
      0.004345706 0.004008350 0.004643233 0.007299866 0.006056976 0.004075629 
              577         578         579         580         581         582 
      0.007171484 0.005165393 0.007726511 0.003658106 0.003356435 0.007271030 
              583         584         585         586         587         588 
      0.002512083 0.006054623 0.004250979 0.004664178 0.006266104 0.007104920 
              589         590         591         592         593         594 
      0.002748525 0.013939915 0.005100787 0.004295917 0.005058865 0.005835670 
              595         596         597         598         599         600 
      0.004425393 0.004088188 0.005808174 0.002495542 0.004930951 0.010645636 
              601         602         603         604         605         606 
      0.004384520 0.012069227 0.003327771 0.004245653 0.003366815 0.010728567 
              607         608         609         610         611         612 
      0.002573439 0.004444959 0.004324031 0.006543539 0.007243404 0.004359712 
              613         614         615         616         617         618 
      0.004345271 0.005756377 0.003369452 0.005002933 0.006989259 0.017385164 
              619         620         621         622         623         624 
      0.005882919 0.008161139 0.006036317 0.002737984 0.007310905 0.005584241 
              625         626         627         628         629         630 
      0.009475195 0.004688702 0.005915481 0.006496724 0.008038052 0.007770198 
              631         632         633         634         635         636 
      0.006743913 0.003568770 0.003435516 0.005474676 0.011506526 0.005882491 
              637         638         639         640         641         642 
      0.011420607 0.003431559 0.003924926 0.006813580 0.003496570 0.005000920 
              643         644         645         646         647         648 
      0.008085551 0.003924483 0.007266138 0.003497900 0.004417265 0.004588240 
              649         650         651         652         653         654 
      0.005912059 0.004555991 0.004364577 0.004766554 0.004235092 0.003809336 
              655         656         657         658         659         660 
      0.003660331 0.006614917 0.003769902 0.005214435 0.008496151 0.003364455 
              661         662         663         664         665         666 
      0.003965218 0.004578991 0.002851509 0.003510400 0.003325960 0.007266138 
              667         668         669         670         671         672 
      0.004195486 0.007070007 0.063951829 0.004936667 0.002838638 0.004848100 
              673         674         675         676         677         678 
      0.003328368 0.005297958 0.007763281 0.006421090 0.008063872 0.035749053 
              679         680         681         682         683         684 
      0.004831294 0.005882919 0.013358301 0.009688924 0.005408090 0.006854488 
              685         686         687         688         689         690 
      0.003843756 0.005872970 0.003731553 0.005377107 0.005868299 0.007458594 
              691         692         693         694         695         696 
      0.006507522 0.003466670 0.008154738 0.012502145 0.003675468 0.003516568 
              697         698         699         700         701         702 
      0.005621733 0.005069052 0.006520143 0.004961837 0.003546475 0.007363407 
              703         704         705         706         707         708 
      0.014032825 0.004389274 0.004505324 0.003670336 0.002705758 0.005990189 
              709         710         711         712         713         714 
      0.013763771 0.006536876 0.003658018 0.004422685 0.024403388 0.004511143 
              715         716         717         718         719         720 
      0.005990189 0.004913773 0.006539853 0.004619988 0.006635670 0.004742612 
              721         722         723         724         725         726 
      0.007510131 0.006441328 0.006681771 0.002551368 0.010194490 0.004820241 
              727         728         729         730         731         732 
      0.002758372 0.005499801 0.006348974 0.008045566 0.004669849 0.006005202 
              733         734         735         736         737         738 
      0.003987195 0.004617374 0.005288664 0.008825378 0.005405845 0.003679142 
              739         740         741         742         743         744 
      0.006173767 0.004695339 0.009129062 0.036190921 0.005497741 0.008775106 
              745         746         747         748         749         750 
      0.006016962 0.004456868 0.004967022 0.007237888 0.008976142 0.009874345 
              751         752         753         754         755         756 
      0.007688180 0.004007964 0.004511540 0.007625914 0.003936227 0.004498712 
              757         758         759         760         761         762 
      0.004848495 0.003376112 0.005832227 0.002958816 0.005531484 0.007429290 
              763         764         765         766         767         768 
      0.004575400 0.003463096 0.005229672 0.005354839 0.008075539 0.009976978 
              769         770         771         772         773         774 
      0.002892095 0.003307054 0.024258728 0.005726684 0.005299336 0.007874017 
              775         776         777         778         779         780 
      0.004753149 0.008209276 0.009574678 0.005851531 0.007861606 0.002559028 
              781         782         783         784         785         786 
      0.009975855 0.004403073 0.005445659 0.004416317 0.008395784 0.009780754 
              787         788         789         790         791         792 
      0.006369549 0.004900113 0.005718275 0.005732994 0.006015924 0.003384763 
              793         794         795         796         797         798 
      0.006524470 0.002799064 0.037917156 0.006914465 0.004158191 0.007847306 
              799         800         801         802         803         804 
      0.056811708 0.004307841 0.006326362 0.006236281 0.093169312 0.004662047 
              805         806         807         808         809         810 
      0.007923435 0.004661550 0.005195522 0.007037938 0.007028504 0.009092291 
              811         812         813         814         815         816 
      0.004234135 0.037674361 0.004848100 0.005514857 0.014807263 0.005227824 
              817         818         819         820         821         822 
      0.006685379 0.004293046 0.004097744 0.004239097 0.009726763 0.019802322 
              823         824         825         826         827         828 
      0.005423494 0.006474148 0.005123373 0.003517851 0.003834978 0.003557269 
              829         830         831         832         833         834 
      0.004314667 0.008299960 0.005372852 0.004312850 0.005035138 0.004281237 
              835         836         837         838         839         840 
      0.007839774 0.004324047 0.004149275 0.003296051 0.007667485 0.006638565 
              841         842         843         844         845         846 
      0.005549999 0.004117227 0.003738277 0.005147059 0.003577360 0.006660720 
              847         848         849         850         851         852 
      0.004880645 0.007071821 0.005472517 0.006592184 0.006542076 0.004285982 
              853         854         855         856         857         858 
      0.006745094 0.002574511 0.005356094 0.006783015 0.006968256 0.005550093 
              859         860         861         862         863         864 
      0.004311158 0.005549999 0.003699849 0.002588244 0.008350162 0.014807263 
              865         866         867         868         869         870 
      0.004140965 0.008132232 0.003987868 0.004655978 0.003079999 0.008779891 
              871         872         873         874         875         876 
      0.006506257 0.043768170 0.007738833 0.006445243 0.004662047 0.003758523 
              877         878         879         880         881         882 
      0.003466674 0.005351094 0.022878379 0.023367254 0.006978309 0.010512483 
              883         884         885         886         887         888 
      0.005977790 0.002599348 0.008021757 0.005998499 0.005540981 0.003437563 
              889         890         891         892         893         894 
      0.003641926 0.006006460 0.005163134 0.005590452 0.006668121 0.003430875 
              895         896         897         898         899         900 
      0.004871144 0.005686132 0.007497331 0.003604334 0.003641926 0.008364287 
              901         902         903         904         905         906 
      0.029283704 0.005143479 0.008440936 0.008299960 0.005408932 0.007258845 
              907         908         909         910         911         912 
      0.005280285 0.004150888 0.037674361 0.006412702 0.005397521 0.011860590 
              913         914         915 
      0.003884247 0.011777287 0.040628098 
      
      $dev_res
                 1            2            3            4            5            6 
      -1.825642155 -1.486723228 -1.499133994 -1.572134000 -1.914640906 -1.286031924 
                 7            8            9           10           11           12 
      -1.442602066 -1.464134989 -1.683610523 -1.488644178 -1.842628890 -1.606780056 
                13           14           15           16           17           18 
      -1.424979517 -1.578335984 -1.492579316 -1.408142134 -1.625293819 -1.642015862 
                19           20           21           22           23           24 
      -1.514260389 -1.558115091 -1.607810058 -1.321539322 -1.635605860 -1.604487817 
                25           26           27           28           29           30 
      -1.289691019 -1.545085650 -1.511224334 -1.596484138 -1.391601606 -1.735821093 
                31           32           33           34           35           36 
      -1.386896967 -1.865327806 -1.612765243 -1.546242064 -1.519069285 -1.384283623 
                37           38           39           40           41           42 
      -1.382611334 -1.743762367 -1.553644892 -1.600261929 -1.743762367 -1.419250705 
                43           44           45           46           47           48 
      -1.657411408 -1.422698635 -1.662544510 -1.516538701 -1.695318710 -2.308052317 
                49           50           51           52           53           54 
      -1.657276787 -1.660952748 -1.662545341 -1.246626354 -1.611550533 -1.865327806 
                55           56           57           58           59           60 
      -1.561625363 -1.579082090 -1.425737372 -1.549749790 -1.555636243 -1.552800674 
                61           62           63           64           65           66 
      -1.492621598 -1.523397604 -1.463828444 -1.541898074 -1.516074293 -1.584449122 
                67           68           69           70           71           72 
      -1.915140211 -1.795444158 -1.524145330 -1.377641437 -1.584053838 -1.250268000 
                73           74           75           76           77           78 
      -1.510511568 -1.601150351 -1.561913498 -1.478922922 -1.390679117 -1.542599362 
                79           80           81           82           83           84 
      -1.619193166 -1.477458251 -1.418077237 -1.390662508 -1.911651899 -1.800281916 
                85           86           87           88           89           90 
      -2.121683579 -1.399050566 -2.153572426 -1.500844067 -2.145152623 -1.681425393 
                91           92           93           94           95           96 
      -1.558474203 -1.499678483 -1.727974363 -2.121683579 -1.659230929 -1.816369232 
                97           98           99          100          101          102 
      -1.725332781 -1.516191688 -1.317526985 -1.865327806 -1.481359013 -1.523397604 
               103          104          105          106          107          108 
      -1.505921852 -1.576700108 -1.405094882 -1.568493388 -1.639494928 -1.486723228 
               109          110          111          112          113          114 
      -1.316782864 -1.284614514 -1.719080238 -1.385087134 -1.405963426 -1.781117729 
               115          116          117          118          119          120 
      -1.458366973 -1.598460993 -1.751644839 -1.367798901 -1.579082090 -1.570971542 
               121          122          123          124          125          126 
      -1.523005458 -1.550995397 -1.719706495 -1.401403951 -1.416359166 -1.791133656 
               127          128          129          130          131          132 
      -1.535063949 -1.722335084 -1.546242064 -1.584977256 -1.420970119 -2.036202660 
               133          134          135          136          137          138 
      -1.587251763 -1.446188934 -1.541562181 -2.032014580 -1.624779529 -1.462687271 
               139          140          141          142          143          144 
      -1.290309747 -1.430834987 -1.367468754 -1.513401938 -1.549288501 -1.422698635 
               145          146          147          148          149          150 
      -1.417389448 -1.330900989 -1.671401614 -1.417389448 -1.723634659 -1.389443531 
               151          152          153          154          155          156 
      -1.584210415 -1.741372307 -1.562266086 -1.463608937 -1.590645895 -1.618791414 
               157          158          159          160          161          162 
      -1.486963402 -1.510437560 -1.584865968 -1.851728971 -1.553167076 -1.412654754 
               163          164          165          166          167          168 
      -1.548786096 -1.541410588 -1.732062359 -1.479840630 -1.683977930 -1.604626386 
               169          170          171          172          173          174 
      -1.678600922 -1.639005569 -1.543035875 -1.529147685 -1.404258084 -1.557423633 
               175          176          177          178          179          180 
      -1.425342551 -1.429064519 -1.650763512 -1.485271746 -1.353985906 -1.523397604 
               181          182          183          184          185          186 
      -1.367732864 -1.924010069 -1.724638692 -1.762347863 -1.643759642 -1.653072482 
               187          188          189          190          191          192 
      -1.456783918 -1.615528194 -1.375978211 -1.528996778 -1.382878746 -1.481000848 
               193          194          195          196          197          198 
      -1.387635072 -1.692263973 -1.634761631 -1.663654229 -1.501147123 -1.253921202 
               199          200          201          202          203          204 
      -1.867107400 -1.242372505 -1.621012830 -1.620238283 -1.436464176 -1.458203892 
               205          206          207          208          209          210 
      -1.531175742 -1.262167715 -1.553396521 -1.563008543 -1.384546279 -1.496965918 
               211          212          213          214          215          216 
      -1.415555295 -1.534457024 -1.511594642 -1.423821748 -1.523902507 -1.743762367 
               217          218          219          220          221          222 
      -1.750231073 -1.819423783 -1.607173516 -1.804184587 -1.737483189 -1.609182012 
               223          224          225          226          227          228 
      -1.653020745 -1.561683333 -1.541367440 -1.682487843 -1.563008543 -1.413819765 
               229          230          231          232          233          234 
      -1.605739813 -1.757313916 -1.517905431 -2.124556953 -1.556705615 -1.713615662 
               235          236          237          238          239          240 
      -1.719706495 -1.631570184 -1.443795410 -1.880423497 -1.523397604 -1.660472898 
               241          242          243          244          245          246 
      -1.399708874 -1.406368947 -1.641555988 -1.634609232 -1.601150351 -1.552800674 
               247          248          249          250          251          252 
      -1.486236954 -1.659674691 -1.412243150 -1.405891985 -1.977360273 -1.701497749 
               253          254          255          256          257          258 
      -1.463400384 -1.756459561 -1.450343856 -1.432191800 -1.533207720 -1.591406597 
               259          260          261          262          263          264 
      -1.633065746 -1.716422369 -1.615581693 -1.577343066 -1.523397604 -1.392275174 
               265          266          267          268          269          270 
      -1.439050203 -1.731718809 -1.399322264 -2.431375219 -1.477046875 -1.639021729 
               271          272          273          274          275          276 
      -1.498358140 -1.747849394 -1.520830808 -1.673239731 -1.691385109 -0.615430680 
               277          278          279          280          281          282 
      -0.169356103 -0.673677217  0.057085403 -0.380558632 -0.263557658 -0.500045001 
               283          284          285          286          287          288 
      -0.261545839 -0.251279927 -0.702169482 -0.153733172 -0.609189053 -0.733931677 
               289          290          291          292          293          294 
      -0.460712991 -0.873698481 -0.715929014 -0.572215117 -0.554597735 -0.395737164 
               295          296          297          298          299          300 
      -0.350691037 -0.523600700 -0.967607232  0.037432058 -0.432440418 -0.594750901 
               301          302          303          304          305          306 
      -0.483722269 -0.445267159 -1.619931271 -0.347771299 -0.444861969 -0.504473058 
               307          308          309          310          311          312 
      -0.502654337 -0.203924667 -0.670121988 -0.319503521 -0.124042845 -0.769075445 
               313          314          315          316          317          318 
      -0.843171561 -0.712731579 -0.739386322 -0.258619462 -0.863401178 -0.277007879 
               319          320          321          322          323          324 
      -0.300332150 -0.437053910 -0.578323287 -0.736039535 -0.203826075 -0.653702167 
               325          326          327          328          329          330 
      -0.691452156 -0.387847174 -0.180497119 -3.376917704 -0.646443685 -0.398844541 
               331          332          333          334          335          336 
      -0.512527377 -0.249874709 -0.756913006 -0.693332298 -0.322468068 -0.316823799 
               337          338          339          340          341          342 
      -0.317132645 -0.348631948 -0.403527561 -0.249874709 -0.193004630 -0.261843344 
               343          344          345          346          347          348 
      -0.364840953 -0.302832026 -0.207012009 -0.327555286 -0.403393703 -0.765888382 
               349          350          351          352          353          354 
      -0.147935969 -0.190746418 -0.379886214 -0.528964675 -0.291680896 -0.315653053 
               355          356          357          358          359          360 
      -0.503544519 -0.434559694 -0.171590265 -0.261784942 -0.225709496 -0.523823974 
               361          362          363          364          365          366 
      -0.866080167 -0.581056419 -0.718916120 -0.598656836 -0.115830084 -0.386515924 
               367          368          369          370          371          372 
      -0.099878913 -0.159377926 -0.171688626 -0.458422623 -0.191826703 -0.529034927 
               373          374          375          376          377          378 
      -0.190580197 -0.394735991 -0.590168912 -0.349707269 -0.406293013 -0.612606106 
               379          380          381          382          383          384 
      -0.555503010 -0.740728802 -1.073086159 -0.803766111 -0.281402775 -0.315622637 
               385          386          387          388          389          390 
      -0.272956069 -0.594800342 -0.301501976 -0.788042588 -0.159349281 -0.085175278 
               391          392          393          394          395          396 
      -0.631261568 -0.591316179 -0.214524718 -0.720557845 -0.612885950  0.053025325 
               397          398          399          400          401          402 
      -0.155765209 -0.378593099 -0.483902387 -0.388422106 -1.185400778 -0.504624981 
               403          404          405          406          407          408 
      -0.651862376 -0.334880696 -0.569053737 -0.336437654  0.043662557 -1.121417760 
               409          410          411          412          413          414 
      -0.578394913 -0.295941201 -0.175587056 -0.471408901 -0.294511578 -0.706609053 
               415          416          417          418          419          420 
      -0.111895503 -0.203924667 -0.350751481 -0.070863512 -0.582319481 -0.865267492 
               421          422          423          424          425          426 
      -0.778406013 -0.005228627 -0.135832491 -0.203732284 -0.204607365 -0.552748401 
               427          428          429          430          431          432 
      -0.754661038 -0.534893861 -0.524383361 -0.136794353 -0.442886613 -0.402675661 
               433          434          435          436          437          438 
      -0.612885950 -0.791335015 -0.445944600 -0.595211262 -0.402351092 -0.646400209 
               439          440          441          442          443          444 
      -0.495578173 -0.225635615 -0.702729557 -0.663863278 -0.297269416 -0.739266065 
               445          446          447          448          449          450 
      -0.606650540 -0.508755428 -0.337993477 -0.430506436 -0.635879273 -0.220342567 
               451          452          453          454          455          456 
      -0.813124187 -0.214792459 -0.135131686 -0.666739333 -1.806868057 -0.295527687 
               457          458          459          460          461          462 
      -0.377179001 -0.548052266 -0.821260727 -0.276949136 -0.119204847 -0.251682560 
               463          464          465          466          467          468 
      -0.288534319 -0.408425242 -0.551775480 -0.396821324 -0.623379554 -0.366835041 
               469          470          471          472          473          474 
      -0.475343962 -0.427744155 -1.222332715 -0.582883909 -0.345084750 -0.258057777 
               475          476          477          478          479          480 
      -0.350691037 -0.408110325 -0.442260268 -0.356841121 -0.171590265 -0.778406013 
               481          482          483          484          485          486 
      -0.774246559 -0.774246559 -1.849383508 -0.514194032 -0.462537200 -0.504473058 
               487          488          489          490          491          492 
      -0.560135050 -0.777813869 -0.437444355 -0.302525820 -0.469982156 -0.103672751 
               493          494          495          496          497          498 
      -0.426635625 -0.833704534 -0.382486469 -0.496839461 -0.288695183 -0.425667490 
               499          500          501          502          503          504 
      -0.575353939 -0.198709230 -0.618899122 -0.374195077 -0.359181971 -0.132832229 
               505          506          507          508          509          510 
      -0.291820814 -0.500045001 -0.614576522 -1.065915709 -0.668915319 -0.340097446 
               511          512          513          514          515          516 
      -0.522660857 -0.906091357 -0.545728286 -0.844261596 -0.189080261 -0.161094650 
               517          518          519          520          521          522 
      -0.225970781 -0.245694216 -0.509574847 -0.489077540 -0.544152297  0.098744166 
               523          524          525          526          527          528 
      -0.010848926  0.439536333  0.184180479  0.518980655  0.434889792  0.550455237 
               529          530          531          532          533          534 
       0.621362181  0.593177209  0.376128521  0.605327031  0.439042857  0.535647756 
               535          536          537          538          539          540 
       0.135766340  0.315080611  0.045164844  0.286785978  0.484891158  0.516511390 
               541          542          543          544          545          546 
      -0.433713463  0.662348996  0.393141295 -0.881663040  0.116715072 -0.857857697 
               547          548          549          550          551          552 
      -1.557895456 -0.061756213  0.114808168  0.423726682  0.522566302  0.622123685 
               553          554          555          556          557          558 
       0.397027285  0.203695388  0.218080445  0.663638873  0.100459122  0.507713822 
               559          560          561          562          563          564 
       0.343669618  0.137361085 -0.311242792  0.319776880  0.316035423  0.515005973 
               565          566          567          568          569          570 
       0.230535644  0.341036461  0.247766214  0.585785635 -0.542088183  0.052228133 
               571          572          573          574          575          576 
       0.258673298  0.348398642  0.274715563 -0.005613554  0.211227265  0.355597083 
               577          578          579          580          581          582 
       0.091066855  0.299330695  0.809647387  0.563207274  0.554119465  0.084878809 
               583          584          585          586          587          588 
       0.243907965  0.256293585  0.260829516  0.379992670  0.252567309  0.366906901 
               589          590          591          592          593          594 
       0.309983362 -0.559815631  0.364072999  0.624297390  0.281431925  0.364401206 
               595          596          597          598          599          600 
       0.013276448  0.418904751  0.666722358  0.152773226  0.513704464 -0.405976284 
               601          602          603          604          605          606 
       0.197508098  0.659022820  0.581088509  0.270971778  0.586588715 -0.611417561 
               607          608          609          610          611          612 
       0.218787125  0.483077815  0.076730748  0.333850723 -0.484898002  0.165514312 
               613          614          615          616          617          618 
       0.446029351  0.304963752  0.528833894  0.459920365  0.214385217 -0.443776440 
               619          620          621          622          623          624 
       0.240687296  0.159095431  0.023146995  0.251101504  0.097263750  0.509612147 
               625          626          627          628          629          630 
      -0.148706038  0.078355830  0.820765774  0.199458868 -0.143834182 -0.125730211 
               631          632          633          634          635          636 
       0.054722730  0.586363528  0.525701567  0.527235040  0.657947600  0.105182293 
               637          638          639          640          641          642 
      -0.238698406  0.502566872  0.565641303  0.045773003  0.471884588  0.063137489 
               643          644          645          646          647          648 
      -0.349207657  0.356235985 -0.208460939  0.507854121  0.456607976  0.231632584 
               649          650          651          652          653          654 
       0.335590799  0.370531546  0.543782757 -0.125238606  0.521441519  0.462838141 
               655          656          657          658          659          660 
       0.638286487  0.156194563  0.421568082  0.176257024 -0.097068257  0.373200128 
               661          662          663          664          665          666 
       0.433595743  0.231510046  0.161179629  0.587132896  0.617220038 -0.208460939 
               667          668          669          670          671          672 
       0.263529456  0.603180808 -1.721390959  0.165593003  0.357687889  0.577337897 
               673          674          675          676          677          678 
       0.556005537  0.383572800  0.113789404  0.507038593 -0.045383427 -0.591440481 
               679          680          681          682          683          684 
       0.253931393  0.240687296 -0.510741706 -0.583726357  0.411542143  0.251863411 
               685          686          687          688          689          690 
       0.409716463  0.306304421  0.389532926  0.681753804  0.839323854  0.127297717 
               691          692          693          694          695          696 
       0.311089913  0.587792217 -0.021640039 -0.265565469  0.468128719  0.616353786 
               697          698          699          700          701          702 
       0.492854932  0.256697530  0.131474717  0.953300954  1.316499624  0.781136050 
               703          704          705          706          707          708 
       0.289683359  0.688164331  0.659380211  1.268142153  0.942980959  0.672246629 
               709          710          711          712          713          714 
      -0.016480979  0.520979332  1.225400912  1.059425961 -0.613393651  0.587959524 
               715          716          717          718          719          720 
       0.672246629  0.732006325  1.155967616  1.008338194  0.925340432  1.015128959 
               721          722          723          724          725          726 
       0.668181658  0.524549337  1.300488458  0.938494388  0.511620245  0.487649906 
               727          728          729          730          731          732 
       0.912495073  1.042345527  0.811804183  0.622850336  0.946597907  1.241882345 
               733          734          735          736          737          738 
       0.984384567  0.590785644  0.827304510  0.126982466  1.113704080  1.215991804 
               739          740          741          742          743          744 
       1.160674207  0.792261068  0.437002803 -0.386733090  0.805026258 -0.024264334 
               745          746          747          748          749          750 
       0.457507338  1.192417888  0.451983207  0.777061539  1.132960237 -0.107084802 
               751          752          753          754          755          756 
       0.420587842  1.345258572  0.965619077  0.317609426  1.016081294  0.858316716 
               757          758          759          760          761          762 
       1.220998765  0.788621909  0.869180997  0.930019212  0.841103436  0.807977967 
               763          764          765          766          767          768 
       0.694754670  1.270850146  0.755093358  0.367020132  0.746502223  0.198878560 
               769          770          771          772          773          774 
       0.636586399  1.263905655 -0.656182196  0.662985819  1.263281258  0.980461089 
               775          776          777          778          779          780 
       0.580742673  0.675861225  0.194208541  1.211061514  1.101562211  0.936826568 
               781          782          783          784          785          786 
       1.447914539  1.165439912  1.295960129  1.250599799  1.163778064  0.575671689 
               787          788          789          790          791          792 
       1.383398481  1.096601429  1.441697963  1.848173024  1.510843214  1.902384688 
               793          794          795          796          797          798 
       1.334220584  1.672064225 -0.275924777  1.447467126  1.556288213  0.889374231 
               799          800          801          802          803          804 
      -0.722406039  1.554415619  1.864243447  1.434312582 -0.832612326  1.324379046 
               805          806          807          808          809          810 
       1.448063413  1.276474016  1.395654599  1.085934764  1.511942903  0.984930045 
               811          812          813          814          815          816 
       1.636030694 -0.172154272  1.819305005  1.841500117  0.225604458  1.037941644 
               817          818          819          820          821          822 
       1.274414346  1.614774856  1.576482052  1.460107402  1.202971095  0.545512999 
               823          824          825          826          827          828 
       1.263361773  1.616829071  1.254294444  1.736864864  1.571295002  1.670199921 
               829          830          831          832          833          834 
       1.680992595  0.952199698  1.391758969  0.950479586  1.807714921  1.570172802 
               835          836          837          838          839          840 
       0.604653263  1.492246412  1.493367578  1.825726722  1.172679480  1.195263287 
               841          842          843          844          845          846 
       0.794778619  1.588657467  1.632541215  1.610232793  1.818681663  1.389020504 
               847          848          849          850          851          852 
       1.239189282  1.304529227  1.729897391  1.122535715  1.712894409  2.028858319 
               853          854          855          856          857          858 
       1.945799395  2.036683522  1.201486129  1.708683566  1.480782793  1.776486080 
               859          860          861          862          863          864 
       1.996465057  1.294378885  1.439248948  2.073698569  1.436583062  0.704391181 
               865          866          867          868          869          870 
       2.075615412  1.715328593  2.464063079  1.809890445  2.201566393  1.394638922 
               871          872          873          874          875          876 
       2.238411517 -0.086415973  1.900166396  1.585031187  1.845369006  2.280235386 
               877          878          879          880          881          882 
       2.363766123  2.402025246  1.353135956  1.940163071  2.075457154  1.843119246 
               883          884          885          886          887          888 
       2.601757561  2.240241640  1.973656227  2.146939100  2.548850176  2.110082667 
               889          890          891          892          893          894 
       2.674621115  2.440582149  2.447066310  2.712632837  2.541440921  2.775575322 
               895          896          897          898          899          900 
       2.857235390  2.927849885  2.355836724  3.201309605  3.148836531  2.542910895 
               901          902          903          904          905          906 
       1.289136622  2.540671598  2.381997736  2.382861489  2.101575476  2.393213728 
               907          908          909          910          911          912 
       2.909918211  3.122683023  1.921373512  3.800652493  4.918420253  3.614817563 
               913          914          915 
       5.089535998  5.349236232  4.953133262 
      
      $pear_res
                 1            2            3            4            5            6 
      -1.227824326 -0.972684512 -0.981613545 -1.034780982 -1.298472056 -0.832648948 
                 7            8            9           10           11           12 
      -0.941198967 -0.956515018 -1.118093972 -0.974064469 -1.241201778 -1.060400992 
                13           14           15           16           17           18 
      -0.928735171 -1.039348975 -0.976893748 -0.916885976 -1.074192987 -1.086710643 
                19           20           21           22           23           24 
      -0.992539549 -1.024484905 -1.061166449 -0.856841197 -1.081905534 -1.058698274 
                25           26           27           28           29           30 
      -0.835130815 -1.014952092 -0.990342756 -1.052761486 -0.905301784 -1.157977571 
                31           32           33           34           35           36 
      -0.902016988 -1.259157804 -1.064852002 -1.015796741 -0.996023029 -0.900194270 
                37           38           39           40           41           42 
      -0.899028627 -1.164090911 -1.021210375 -1.055562044 -1.164090911 -0.924697071 
                43           44           45           46           47           48 
      -1.098285771 -0.927126630 -1.102155795 -0.994189321 -1.126990750 -1.623384671 
                49           50           51           52           53           54 
      -1.098184347 -1.100955139 -1.102156422 -0.806081027 -1.063948061 -1.259157804 
                55           56           57           58           59           60 
      -1.027059172 -1.039899047 -0.929269867 -1.018360497 -1.022668576 -1.020592430 
                61           62           63           64           65           66 
      -0.976924166 -0.999162494 -0.956296307 -1.012625311 -0.993852946 -1.043859323 
                67           68           69           70           71           72 
      -1.298872191 -1.204172465 -0.999705236 -0.895567758 -1.043567444 -0.808524153 
                73           74           75           76           77           78 
      -0.989827299 -1.056221078 -1.027270590 -0.967088840 -0.904657347 -1.013137037 
                79           80           81           82           83           84 
      -1.069640469 -0.966039539 -0.923870749 -0.904645745 -1.296077560 -1.207950198 
                85           86           87           88           89           90 
      -1.467480121 -0.910511818 -1.493970392 -0.982846375 -1.486966577 -1.116436585 
                91           92           93           94           95           96 
      -1.024748144 -0.982006013 -1.151949098 -1.467480121 -1.099656960 -1.220543708 
                97           98           99          100          101          102 
      -1.149922341 -0.993937972 -0.854095268 -1.259157804 -0.968835055 -0.999162494 
               103          104          105          106          107          108 
      -0.986510637 -1.038143318 -0.914747659 -1.032103247 -1.084819882 -0.972684512 
               109          110          111          112          113          114 
      -0.853586356 -0.831688241 -1.145130534 -0.900754545 -0.915356941 -1.193010850 
               115          116          117          118          119          120 
      -0.952402950 -1.054226604 -1.170171089 -0.888728369 -1.039899047 -1.033925675 
               121          122          123          124          125          126 
      -0.998877898 -1.019271512 -1.145610136 -0.912160184 -0.922661439 -1.200810136 
               127          128          129          130          131          132 
      -1.007643830 -1.147624014 -1.015796741 -1.044249350 -0.925908341 -1.397011690 
               133          134          135          136          137          138 
      -1.045929731 -0.943743632 -1.012380247 -1.393581899 -1.073808911 -0.955482283 
               139          140          141          142          143          144 
      -0.835550734 -0.932869479 -0.888499293 -0.991918207 -1.018023201 -0.927126630 
               145          146          147          148          149          150 
      -0.923386558 -0.863260267 -1.108846018 -0.923386558 -1.148620178 -0.903794454 
               151          152          153          154          155          156 
      -1.043683057 -1.162249708 -1.027529324 -0.956139707 -1.048439267 -1.069340936 
               157          158          159          160          161          162 
      -0.972857005 -0.989773784 -1.044167159 -1.248389517 -1.020860608 -0.920056037 
               163          164          165          166          167          168 
      -1.017655891 -1.012269655 -1.155088314 -0.967746518 -1.118372739 -1.058801175 
               169          170          171          172          173          174 
      -1.114295691 -1.084453002 -1.013455610 -1.003339223 -0.914160791 -1.023978125 
               175          176          177          178          179          180 
      -0.928991291 -0.931618684 -1.093281640 -0.971642315 -0.879162614 -0.999162494 
               181          182          183          184          185          186 
      -0.888682547 -1.305987095 -1.149390028 -1.178446100 -1.088019279 -1.095018673 
               187          188          189          190          191          192 
      -0.951275576 -1.066909215 -0.894410651 -1.003229520 -0.899214985 -0.968578242 
               193          194          195          196          197          198 
      -0.902532041 -1.124666882 -1.081273303 -1.102993153 -0.983064918 -0.810977491 
               199          200          201          202          203          204 
      -1.260569370 -0.803230274 -1.070997566 -1.070419829 -0.936850636 -0.952286788 
               205          206          207          208          209          210 
      -1.004813995 -0.816524608 -1.021028558 -1.028074233 -0.900377401 -0.980051403 
               211          212          213          214          215          216 
      -0.922095819 -1.007201903 -0.990610597 -0.927918547 -0.999528969 -1.164090911 
               217          218          219          220          221          222 
      -1.169079690 -1.222940252 -1.060693370 -1.211000906 -1.159256068 -1.062186371 
               223          224          225          226          227          228 
      -1.094979740 -1.027101707 -1.012238178 -1.117242317 -1.028074233 -0.920875116 
               229          230          231          232          233          234 
      -1.059628146 -1.174551375 -0.995179513 -1.469862973 -1.023451982 -1.140948915 
               235          236          237          238          239          240 
      -1.145610136 -1.078884592 -0.942045279 -1.271148978 -0.999162494 -1.100593292 
               241          242          243          244          245          246 
      -0.910972799 -0.915641466 -1.086365630 -1.081159189 -1.056221078 -1.020592430 
               247          248          249          250          251          252 
      -0.972335308 -1.099991481 -0.919766718 -0.915306820 -1.349041985 -1.131697100 
               253          254          255          256          257          258 
      -0.955990931 -1.173890850 -0.946694601 -0.933828470 -1.006292476 -1.049002037 
               259          260          261          262          263          264 
      -1.080003720 -1.143095935 -1.066949065 -1.038617119 -0.999162494 -0.905772437 
               265          266          267          268          269          270 
      -0.938681741 -1.154824373 -0.910702065 -1.727313123 -0.965744906 -1.084465117 
               271          272          273          274          275          276 
      -0.981054415 -1.167241955 -0.997300247 -1.110236428 -1.123998638 -0.535709241 
               277          278          279          280          281          282 
      -0.154837960 -0.584000848  0.054277379 -0.338511443 -0.237788826 -0.439454759 
               283          284          285          286          287          288 
      -0.236036421 -0.227082134 -0.607573502 -0.140887251 -0.530524632 -0.633821726 
               289          290          291          292          293          294 
      -0.406398064 -0.749110025 -0.618947821 -0.499766111 -0.485079627 -0.351427197 
               295          296          297          298          299          300 
      -0.313003917 -0.459184761 -0.826524342  0.035454727 -0.382538755 -0.518523286 
               301          302          303          304          305          306 
      -0.425754259 -0.393374069 -1.365233474 -0.310503488 -0.393032067 -0.443167292 
               307          308          309          310          311          312 
      -0.441642665 -0.185501128 -0.581057433 -0.286227620 -0.114205391 -0.662835898 
               313          314          315          316          317          318 
      -0.723945914 -0.616305159 -0.638326763 -0.233486005 -0.740622056 -0.249485189 
               319          320          321          322          323          324 
      -0.269690270 -0.386438096 -0.504853262 -0.635562708 -0.185414061 -0.567456742 
               325          326          327          328          329          330 
      -0.598709947 -0.344717230 -0.164750543 -2.690731886 -0.561440854 -0.354067620 
               331          332          333          334          335          336 
      -0.449915740 -0.225854859 -0.652797654 -0.600265154 -0.288779439 -0.283919743 
               337          338          339          340          341          342 
      -0.284185792 -0.311240670 -0.358044585 -0.225854859 -0.175844394 -0.236295612 
               343          344          345          346          347          348 
      -0.325104016 -0.271850184 -0.188226497 -0.293155114 -0.357930947 -0.660205728 
               349          350          351          352          353          354 
      -0.135695206 -0.173844074 -0.337938557 -0.463671117 -0.262207182 -0.282911084 
               355          356          357          358          359          360 
      -0.442388938 -0.384330274 -0.156828144 -0.236244733 -0.204687731 -0.459371550 
               361          362          363          364          365          366 
      -0.742830346 -0.507128760 -0.621416386 -0.521771170 -0.106783961 -0.343584274 
               367          368          369          370          371          372 
      -0.092317077 -0.145934714 -0.156915736 -0.404468406 -0.174801133 -0.463729861 
               373          374          375          376          377          378 
      -0.173696790 -0.350576208 -0.514712098 -0.312161572 -0.360391792 -0.533363268 
               379          380          381          382          383          384 
      -0.485834821 -0.639435421 -0.913549025 -0.691454503 -0.253299773 -0.282884876 
               385          386          387          388          389          390 
      -0.245965259 -0.518564403 -0.270701142 -0.678485298 -0.145909119 -0.078918253 
               391          392          393          394          395          396 
      -0.548850055 -0.515666484 -0.194849687 -0.622773013 -0.533595713  0.050376793 
               397          398          399          400          401          402 
      -0.142705180 -0.336836677 -0.425905577 -0.345206451 -1.006342805 -0.443294635 
               403          404          405          406          407          408 
      -0.565932125 -0.299448719 -0.497132218 -0.300785293  0.041405971 -0.953463822 
               409          410          411          412          413          414 
      -0.504912901 -0.265893849 -0.160385499 -0.415402365 -0.264657075 -0.611244093 
               415          416          417          418          419          420 
      -0.103222020 -0.185501128 -0.313055667 -0.065816173 -0.508180176 -0.742160460 
               421          422          423          424          425          426 
      -0.670535075 -0.004912839 -0.124827690 -0.185331232 -0.186103965 -0.483536707 
               427          428          429          430          431          432 
      -0.650938684 -0.468627556 -0.459839512 -0.125692708 -0.391364499 -0.357321331 
               433          434          435          436          437          438 
      -0.533595713 -0.681201255 -0.393945827 -0.518906133 -0.357045752 -0.561404814 
               439          440          441          442          443          444 
      -0.435707948 -0.204622832 -0.608036599 -0.575874578 -0.267042577 -0.638227450 
               445          446          447          448          449          450 
      -0.528415410 -0.446756045 -0.302120518 -0.380903425 -0.552680745 -0.199970334 
               451          452          453          454          455          456 
      -0.699171901 -0.195085501 -0.124197294 -0.578256440 -1.517870683 -0.265536153 
               457          458          459          460          461          462 
      -0.335631445 -0.479617561 -0.705881197 -0.249434179 -0.109835752 -0.227433710 
               463          464          465          466          467          468 
      -0.259482236 -0.362200894 -0.482724890 -0.352348578 -0.542308990 -0.326806915 
               469          470          471          472          473          474 
      -0.418712192 -0.378566958 -1.036882491 -0.508649993 -0.308201632 -0.232996293 
               475          476          477          478          479          480 
      -0.313003917 -0.361933737 -0.390835659 -0.318266651 -0.156828144 -0.670535075 
               481          482          483          484          485          486 
      -0.667103056 -0.667103056 -1.552282109 -0.451311482 -0.407934590 -0.443167292 
               487          488          489          490          491          492 
      -0.489698028 -0.670046507 -0.386767992 -0.271585677 -0.414201934 -0.095764291 
               493          494          495          496          497          498 
      -0.377629063 -0.716141105 -0.340153582 -0.436766109 -0.259621587 -0.376809835 
               499          500          501          502          503          504 
      -0.502380560 -0.180892378 -0.538589405 -0.333087355 -0.320268304 -0.122127960 
               505          506          507          508          509          510 
      -0.262328311 -0.439454759 -0.534999857 -0.907629499 -0.580058307 -0.303925576 
               511          512          513          514          515          516 
      -0.458398450 -0.775810566 -0.477677496 -0.724844525 -0.172367450 -0.147468226 
               517          518          519          520          521          522 
      -0.204917239 -0.222201443 -0.447442561 -0.430251923 -0.476361629  0.094514641 
               523          524          525          526          527          528 
      -0.010274877  0.439307672  0.177940793  0.525271336  0.434357420  0.560063724 
               529          530          531          532          533          534 
       0.640115589  0.608008551  0.372442409  0.621801422  0.438781551  0.543640891 
               535          536          537          538          539          540 
       0.130461074  0.309380702  0.042999210  0.280555008  0.488069499  0.522560104 
               541          542          543          544          545          546 
      -0.398997546  0.687518181  0.390240466 -0.796436769  0.111925931 -0.775569243 
               547          548          549          550          551          552 
      -1.373598024 -0.058229849  0.110075104  0.422498015  0.529213027  0.640988494 
               553          554          555          556          557          558 
       0.394320147  0.197240661  0.211529711  0.689024118  0.096173213  0.512921666 
               559          560          561          562          563          564 
       0.338760400  0.132016306 -0.288280659  0.314188999  0.310357731  0.520908455 
               565          566          567          568          569          570 
       0.223945845  0.336043411  0.241191589  0.599652141 -0.496119869  0.049757944 
               571          572          573          574          575          576 
       0.252150815  0.343645693  0.268331259 -0.005319038  0.204715544  0.351096200 
               577          578          579          580          581          582 
       0.087097324  0.293305070  0.865570647  0.574286125  0.564142876  0.081127767 
               583          584          585          586          587          588 
       0.237322853  0.249756870  0.254321313  0.376476044  0.246011520  0.362837106 
               589          590          591          592          593          594 
       0.304169655 -0.511941581  0.359891130  0.643481789  0.275127640  0.360232178 
               595          596          597          598          599          600 
       0.012601711  0.417389732  0.692627675  0.147076633  0.519481303 -0.374019982 
               601          602          603          604          605          606 
       0.191111112  0.683638909  0.594355392  0.264548589  0.600558788 -0.557900685 
               607          608          609          610          611          612 
       0.212233070  0.486104150  0.073279382  0.328640380 -0.444956482  0.159568790 
               613          614          615          616          617          618 
       0.446238924  0.299045847  0.536116371  0.461122337  0.207853988 -0.408046467 
               619          620          621          622          623          624 
       0.234096582  0.153270512  0.021990888  0.244539280  0.093083397  0.514998642 
               625          626          627          628          629          630 
      -0.139248916  0.074843617  0.879543988  0.193042621 -0.134736239 -0.117940344 
               631          632          633          634          635          636 
       0.052147267  0.600304530  0.532664180  0.534353712  0.682386141  0.100744324 
               637          638          639          640          641          642 
      -0.222103499  0.507298010  0.577009264  0.043580772  0.474002233  0.060215832 
               643          644          645          646          647          648 
      -0.322726049  0.351758309 -0.194365719  0.513075117  0.457566458  0.225041338 
               649          650          651          652          653          654 
       0.330431540  0.366609084  0.552651217 -0.117483663  0.527975958  0.464258179 
               655          656          657          658          659          660 
       0.659584638  0.150427356  0.420210158  0.170131816 -0.091260100  0.369389011 
               661          662          663          664          665          666 
       0.432980248  0.224918945  0.155314475  0.601173321  0.635372553 -0.194365719 
               667          668          669          670          671          672 
       0.257041003  0.619359754 -1.507396644  0.159646063  0.353263456  0.590133464 
               673          674          675          676          677          678 
       0.566244895  0.380217835  0.109086623  0.512183260 -0.042851636 -0.540124695 
               679          680          681          682          683          684 
       0.247382132  0.234096582 -0.468100244 -0.533254978  0.409606464  0.245304457 
               685          686          687          688          689          690 
       0.407679550  0.300413586  0.386457046  0.710267164  0.903047200  0.122211897 
               691          692          693          694          695          696 
       0.305300225  0.601918069 -0.020475246 -0.246670736  0.469952770  0.634381714 
               697          698          699          700          701          702 
       0.496716838  0.250163117  0.126278644  1.003570982  1.475325366  0.803330217 
               703          704          705          706          707          708 
       0.284012993  0.699925026  0.668494216  1.407839529  0.991208792  0.682511399 
               709          710          711          712          713          714 
      -0.015853248  0.520750975  1.349512398  1.133693217 -0.574523934  0.591588532 
               715          716          717          718          719          720 
       0.682511399  0.748315609  1.257249039  1.070352720  0.970190342  1.078695267 
               721          722          723          724          725          726 
       0.678077273  0.524497326  1.452800225  0.985849681  0.510944583  0.485925721 
               727          728          729          730          731          732 
       0.954973344  1.112366113  0.838119538  0.628972530  0.995535887  1.371861082 
               733          734          735          736          737          738 
       1.041107829  0.594603809  0.855839673  0.123148101  1.202511547  1.336832561 
               739          740          741          742          743          744 
       1.263409721  0.815909308  0.433502036 -0.365652871  0.830400145 -0.023330541 
               745          746          747          748          749          750 
       0.454656169  1.305311037  0.448947887  0.798734620  1.227322330 -0.102530993 
               751          752          753          754          755          756 
       0.416632831  1.516246191  1.018391655  0.312039448  1.079867075  0.891579032 
               757          758          759          760          761          762 
       1.343572930  0.811789429  0.904191897  0.975751303  0.871694245  0.833759688 
               763          764          765          766          767          768 
       0.707158525  1.411576063  0.774061011  0.361969686  0.764458838  0.193757564 
               769          770          771          772          773          774 
       0.643786654  1.402003892 -0.613509880  0.672417108  1.401144830  1.036344379 
               775          776          777          778          779          780 
       0.583898652  0.686458618  0.189149512  1.330211054  1.186975701  0.983859852 
               781          782          783          784          785          786 
       1.667412788  1.269661314  1.446462350  1.336806950  1.231522006  0.579692881 
               787          788          789          790          791          792 
       1.504212148  1.152057280  1.580425368  2.169749277  1.673196708  2.257501830 
               793          794          795          796          797          798 
       1.441256885  1.900670258 -0.266397543  1.588064650  1.735669702  0.916269669 
               799          800          801          802          803          804 
      -0.682714501  1.733070973  2.195505919  1.570672066 -0.782499630  1.428798113 
               805          806          807          808          809          810 
       1.588855252  1.368791645  1.520088416  1.139588437  1.674694034  1.023384359 
               811          812          813          814          815          816 
       1.848376475 -0.166996755  2.124010559  2.159116700  0.222889935  1.083963745 
               817          818          819          820          821          822 
       1.366234848  1.817935263  1.763831008  1.604865510  1.278672413  0.548305707 
               823          824          825          826          827          828 
       1.352546421  1.820864260  1.341356377  1.996986005  1.756573352  1.897943015 
               829          830          831          832          833          834 
       1.913764631  0.986405548  1.515033862  0.984470746  2.105834987  1.755005381 
               835          836          837          838          839          840 
       0.609992478  1.647981204  1.649495783  2.134127102  1.242177993  1.269351799 
               841          842          843          844          845          846 
       0.812575126  1.780932797  1.843358664  1.811468694  2.123030320  1.511485334 
               847          848          849          850          851          852 
       1.322793284  1.403807020  1.986485285  1.182540438  1.895023606  2.343023863 
               853          854          855          856          857          858 
       2.219496825  2.354897778  1.266332422  1.889422121  1.597993546  1.980689138 
               859          860          861          862          863          864 
       2.294310287  1.374065597  1.547102340  2.411638741  1.543856609  0.720297072 
               865          866          867          868          869          870 
       2.414603328  1.898265617  3.076368335  2.026526155  2.615364544  1.493106821 
               871          872          873          874          875          876 
       2.676432718 -0.085044939  2.153493076  1.728586326  2.075872578  2.747116887 
               877          878          879          880          881          882 
       2.892840893  2.828342332  1.442848733  2.162918003  2.346119439  2.036333471 
               883          884          885          886          887          888 
       3.158260728  2.581593905  2.207503461  2.446471905  3.067879469  2.394402402 
               889          890          891          892          893          894 
       3.286550955  2.889716600  2.900141640  3.355317109  3.055401427  3.472094435 
               895          896          897          898          899          900 
       3.471438687  3.593794013  2.698845526  4.108064533  4.003992722  2.969744557 
               901          902          903          904          905          906 
       1.376923012  2.966392765  2.735681992  2.736903676  2.355788892  2.751573339 
               907          908          909          910          911          912 
       3.471099885  3.748213983  2.136713074  4.807233704  7.059029787  4.420005699 
               913          914          915 
       7.212550671  7.202417151  6.438455395 
      

---

    Code
      hatvalues(M_bioChem)
    Output
                1           2           3           4           5           6 
      0.004805283 0.004567173 0.003677432 0.005721927 0.007880318 0.006131357 
                7           8           9          10          11          12 
      0.003296051 0.005255914 0.007210943 0.005977464 0.006251496 0.010773555 
               13          14          15          16          17          18 
      0.003786550 0.004107798 0.004738046 0.003253224 0.005087617 0.007414154 
               19          20          21          22          23          24 
      0.003496570 0.004652583 0.004511540 0.009979347 0.004324047 0.002602589 
               25          26          27          28          29          30 
      0.009711585 0.005638751 0.003784361 0.004397478 0.003241210 0.004866418 
               31          32          33          34          35          36 
      0.003624002 0.006715645 0.007459534 0.006007321 0.004547317 0.004147073 
               37          38          39          40          41          42 
      0.004597356 0.006520143 0.005504341 0.004607412 0.006520143 0.003298873 
               43          44          45          46          47          48 
      0.005564020 0.003463096 0.006593347 0.005494320 0.004589907 0.008960554 
               49          50          51          52          53          54 
      0.005834682 0.005148887 0.006914465 0.006077557 0.005788576 0.006715645 
               55          56          57          58          59          60 
      0.003134559 0.005162929 0.003273653 0.002782139 0.003663414 0.004990716 
               61          62          63          64          65          66 
      0.003523753 0.003398418 0.003602227 0.004187856 0.003869986 0.002673272 
               67          68          69          70          71          72 
      0.007910866 0.006753332 0.003260459 0.006464233 0.006112020 0.005688133 
               73          74          75          76          77          78 
      0.004817295 0.006184374 0.006474148 0.005416832 0.005621995 0.003221669 
               79          80          81          82          83          84 
      0.003113008 0.003369760 0.004111658 0.003604785 0.003061523 0.005266333 
               85          86          87          88          89          90 
      0.008359288 0.008148113 0.014782783 0.005354749 0.008660930 0.002804952 
               91          92          93          94          95          96 
      0.004493655 0.003755293 0.007237888 0.008359288 0.005944601 0.007534662 
               97          98          99         100         101         102 
      0.007363407 0.003621118 0.006445564 0.006715645 0.003635368 0.003398418 
              103         104         105         106         107         108 
      0.007637765 0.003955410 0.006100341 0.002721470 0.004744168 0.004567173 
              109         110         111         112         113         114 
      0.010275113 0.005950275 0.004794909 0.003962755 0.003452666 0.004652030 
              115         116         117         118         119         120 
      0.005783908 0.005133061 0.006472909 0.003328541 0.005162929 0.002946111 
              121         122         123         124         125         126 
      0.004086579 0.003642317 0.003570536 0.004047415 0.004295917 0.002655509 
              127         128         129         130         131         132 
      0.005118077 0.004439278 0.006007321 0.005209421 0.003571702 0.003981922 
              133         134         135         136         137         138 
      0.006473375 0.004848100 0.004826426 0.013785614 0.004384107 0.003470693 
              139         140         141         142         143         144 
      0.009706365 0.005453038 0.003351819 0.006506257 0.005364051 0.003463096 
              145         146         147         148         149         150 
      0.004279701 0.006216264 0.005139232 0.004279701 0.004558981 0.010929151 
              151         152         153         154         155         156 
      0.006070224 0.005084694 0.004465979 0.013388260 0.005026730 0.003191654 
              157         158         159         160         161         162 
      0.005736891 0.004836570 0.004010759 0.004550198 0.003940015 0.003550040 
              163         164         165         166         167         168 
      0.006808271 0.004868664 0.005074282 0.003472889 0.004880124 0.005238030 
              169         170         171         172         173         174 
      0.004393528 0.004648094 0.004390155 0.005590452 0.003531172 0.005891411 
              175         176         177         178         179         180 
      0.005489789 0.003505507 0.004428540 0.004403073 0.007991890 0.003398418 
              181         182         183         184         185         186 
      0.003332912 0.004720432 0.007114590 0.003805223 0.006100849 0.006803936 
              187         188         189         190         191         192 
      0.003469426 0.004961837 0.007264598 0.004829161 0.004519312 0.004928894 
              193         194         195         196         197         198 
      0.003516305 0.005096952 0.005985650 0.004658376 0.003755049 0.005737472 
              199         200         201         202         203         204 
      0.003160749 0.007081893 0.006942180 0.002932415 0.006006383 0.003366171 
              205         206         207         208         209         210 
      0.004345271 0.006025262 0.003922256 0.006170251 0.010629861 0.003939331 
              211         212         213         214         215         216 
      0.005342659 0.003684039 0.003836643 0.007287359 0.004228932 0.006520143 
              217         218         219         220         221         222 
      0.007017609 0.006605566 0.006821571 0.004367745 0.004611639 0.005119385 
              223         224         225         226         227         228 
      0.004195486 0.004421263 0.004107977 0.007686677 0.006170251 0.003735603 
              229         230         231         232         233         234 
      0.004947456 0.004913773 0.004461910 0.010681494 0.005041977 0.005026255 
              235         236         237         238         239         240 
      0.003570536 0.008175737 0.003327771 0.009834031 0.003398418 0.006266104 
              241         242         243         244         245         246 
      0.004286745 0.003319174 0.002719709 0.004132495 0.006184374 0.004990716 
              247         248         249         250         251         252 
      0.005621209 0.005411956 0.006017610 0.003354408 0.005134369 0.006369549 
              253         254         255         256         257         258 
      0.003547880 0.004957818 0.004334282 0.004055763 0.004030758 0.005714430 
              259         260         261         262         263         264 
      0.004099189 0.005353508 0.004003381 0.004443004 0.003398418 0.003245554 
              265         266         267         268         269         270 
      0.006710349 0.006524470 0.005385142 0.018360224 0.005644017 0.007668393 
              271         272         273         274         275         276 
      0.003815176 0.005000081 0.005531473 0.004792571 0.002957134 0.004609574 
              277         278         279         280         281         282 
      0.004371391 0.004367745 0.009914564 0.003854352 0.003440148 0.005139232 
              283         284         285         286         287         288 
      0.003982712 0.004396514 0.007133861 0.004279701 0.005568705 0.004713624 
              289         290         291         292         293         294 
      0.002692936 0.006968256 0.007457202 0.006460135 0.005214435 0.003950959 
              295         296         297         298         299         300 
      0.004138196 0.005895737 0.007061100 0.010909085 0.006202856 0.008244604 
              301         302         303         304         305         306 
      0.005563353 0.004237221 0.026192597 0.003913023 0.002920270 0.004588240 
              307         308         309         310         311         312 
      0.005135625 0.004011184 0.005683825 0.003729196 0.005190758 0.007339843 
              313         314         315         316         317         318 
      0.006992197 0.006527176 0.009557738 0.003517851 0.011498410 0.004314229 
              319         320         321         322         323         324 
      0.004722039 0.005872970 0.006147022 0.004511143 0.004026121 0.008550807 
              325         326         327         328         329         330 
      0.008278646 0.003841018 0.006006383 0.220082323 0.005233479 0.004132016 
              331         332         333         334         335         336 
      0.006312389 0.004667839 0.006227012 0.006605566 0.003880407 0.005433354 
              337         338         339         340         341         342 
      0.008180640 0.004493655 0.005395927 0.004667839 0.003445044 0.003419977 
              343         344         345         346         347         348 
      0.002879893 0.006157427 0.006457094 0.003157095 0.004370976 0.005827721 
              349         350         351         352         353         354 
      0.005603104 0.007418098 0.002956461 0.004895342 0.005397521 0.005498434 
              355         356         357         358         359         360 
      0.004721608 0.007298740 0.005732994 0.004222694 0.003490594 0.005843768 
              361         362         363         364         365         366 
      0.009129062 0.005134181 0.008725145 0.007130198 0.005644924 0.004822315 
              367         368         369         370         371         372 
      0.005750797 0.006271490 0.003663997 0.006140266 0.003373158 0.003359608 
              373         374         375         376         377         378 
      0.005374700 0.007561901 0.003956434 0.005261539 0.006184374 0.005435932 
              379         380         381         382         383         384 
      0.007719027 0.003306969 0.009976978 0.005044942 0.006842485 0.003663776 
              385         386         387         388         389         390 
      0.004450415 0.004416794 0.004228932 0.006498758 0.003516568 0.010447319 
              391         392         393         394         395         396 
      0.007673465 0.005097523 0.005424042 0.007107502 0.004913773 0.011256704 
              397         398         399         400         401         402 
      0.003944292 0.006753417 0.005944601 0.006738481 0.017570529 0.004328234 
              403         404         405         406         407         408 
      0.006725818 0.004700295 0.007377720 0.006347735 0.005832286 0.012309367 
              409         410         411         412         413         414 
      0.002613866 0.004059712 0.004239805 0.002879236 0.004261463 0.004453837 
              415         416         417         418         419         420 
      0.003498617 0.004011184 0.005209076 0.006252040 0.007417663 0.005239399 
              421         422         423         424         425         426 
      0.009341447 0.010942579 0.006201856 0.003363303 0.011468814 0.002804431 
              427         428         429         430         431         432 
      0.007021091 0.006835904 0.006539018 0.006681771 0.004455146 0.005133061 
              433         434         435         436         437         438 
      0.004913773 0.008276472 0.003056234 0.006520143 0.005501244 0.004453444 
              439         440         441         442         443         444 
      0.005390158 0.005629009 0.004425393 0.005990189 0.003903460 0.007157731 
              445         446         447         448         449         450 
      0.006163738 0.003486057 0.004246398 0.003113008 0.006042528 0.003789054 
              451         452         453         454         455         456 
      0.007073219 0.003356435 0.003540411 0.005977782 0.025644210 0.005877611 
              457         458         459         460         461         462 
      0.005513544 0.006759020 0.005210943 0.006308300 0.006509193 0.005123138 
              463         464         465         466         467         468 
      0.004045330 0.006359353 0.006527817 0.005013916 0.006615558 0.003081987 
              469         470         471         472         473         474 
      0.005078263 0.005745860 0.014394930 0.005280763 0.004989154 0.004813059 
              475         476         477         478         479         480 
      0.004138196 0.002726958 0.005252821 0.007024807 0.005732994 0.009341447 
              481         482         483         484         485         486 
      0.003036623 0.003036623 0.025203921 0.007013843 0.005811157 0.004588240 
              487         488         489         490         491         492 
      0.005786600 0.007478802 0.004332526 0.004367785 0.005214042 0.004791836 
              493         494         495         496         497         498 
      0.004496441 0.005059767 0.007104920 0.005757810 0.003507825 0.004003381 
              499         500         501         502         503         504 
      0.005076790 0.003658018 0.006888844 0.004443004 0.002689504 0.003280378 
              505         506         507         508         509         510 
      0.005372516 0.005139232 0.005081710 0.013168450 0.005388105 0.003010752 
              511         512         513         514         515         516 
      0.005477664 0.003647093 0.005944029 0.003363975 0.003296051 0.003384396 
              517         518         519         520         521         522 
      0.008470254 0.005331580 0.004393528 0.002575798 0.006318807 0.004541185 
              523         524         525         526         527         528 
      0.006120671 0.003791149 0.007134396 0.005542069 0.003834610 0.003547880 
              529         530         531         532         533         534 
      0.004079864 0.003937840 0.004443004 0.004407795 0.005441064 0.003683000 
              535         536         537         538         539         540 
      0.005097523 0.005754327 0.004367745 0.005679900 0.004215391 0.004403073 
              541         542         543         544         545         546 
      0.010140554 0.003248209 0.003936543 0.021713941 0.005693627 0.028777107 
              547         548         549         550         551         552 
      0.043768170 0.004733206 0.005337129 0.006954841 0.003635368 0.004193791 
              553         554         555         556         557         558 
      0.002874419 0.007192981 0.006114125 0.003241210 0.006615558 0.006539853 
              559         560         561         562         563         564 
      0.004370976 0.004409051 0.007268558 0.005141396 0.005540981 0.006973822 
              565         566         567         568         569         570 
      0.005403589 0.002940325 0.007726734 0.007313210 0.031847297 0.007471977 
              571         572         573         574         575         576 
      0.004345706 0.004008350 0.004643233 0.007299866 0.006056976 0.004075629 
              577         578         579         580         581         582 
      0.007171484 0.005165393 0.007726511 0.003658106 0.003356435 0.007271030 
              583         584         585         586         587         588 
      0.002512083 0.006054623 0.004250979 0.004664178 0.006266104 0.007104920 
              589         590         591         592         593         594 
      0.002748525 0.013939915 0.005100787 0.004295917 0.005058865 0.005835670 
              595         596         597         598         599         600 
      0.004425393 0.004088188 0.005808174 0.002495542 0.004930951 0.010645636 
              601         602         603         604         605         606 
      0.004384520 0.012069227 0.003327771 0.004245653 0.003366815 0.010728567 
              607         608         609         610         611         612 
      0.002573439 0.004444959 0.004324031 0.006543539 0.007243404 0.004359712 
              613         614         615         616         617         618 
      0.004345271 0.005756377 0.003369452 0.005002933 0.006989259 0.017385164 
              619         620         621         622         623         624 
      0.005882919 0.008161139 0.006036317 0.002737984 0.007310905 0.005584241 
              625         626         627         628         629         630 
      0.009475195 0.004688702 0.005915481 0.006496724 0.008038052 0.007770198 
              631         632         633         634         635         636 
      0.006743913 0.003568770 0.003435516 0.005474676 0.011506526 0.005882491 
              637         638         639         640         641         642 
      0.011420607 0.003431559 0.003924926 0.006813580 0.003496570 0.005000920 
              643         644         645         646         647         648 
      0.008085551 0.003924483 0.007266138 0.003497900 0.004417265 0.004588240 
              649         650         651         652         653         654 
      0.005912059 0.004555991 0.004364577 0.004766554 0.004235092 0.003809336 
              655         656         657         658         659         660 
      0.003660331 0.006614917 0.003769902 0.005214435 0.008496151 0.003364455 
              661         662         663         664         665         666 
      0.003965218 0.004578991 0.002851509 0.003510400 0.003325960 0.007266138 
              667         668         669         670         671         672 
      0.004195486 0.007070007 0.063951829 0.004936667 0.002838638 0.004848100 
              673         674         675         676         677         678 
      0.003328368 0.005297958 0.007763281 0.006421090 0.008063872 0.035749053 
              679         680         681         682         683         684 
      0.004831294 0.005882919 0.013358301 0.009688924 0.005408090 0.006854488 
              685         686         687         688         689         690 
      0.003843756 0.005872970 0.003731553 0.005377107 0.005868299 0.007458594 
              691         692         693         694         695         696 
      0.006507522 0.003466670 0.008154738 0.012502145 0.003675468 0.003516568 
              697         698         699         700         701         702 
      0.005621733 0.005069052 0.006520143 0.004961837 0.003546475 0.007363407 
              703         704         705         706         707         708 
      0.014032825 0.004389274 0.004505324 0.003670336 0.002705758 0.005990189 
              709         710         711         712         713         714 
      0.013763771 0.006536876 0.003658018 0.004422685 0.024403388 0.004511143 
              715         716         717         718         719         720 
      0.005990189 0.004913773 0.006539853 0.004619988 0.006635670 0.004742612 
              721         722         723         724         725         726 
      0.007510131 0.006441328 0.006681771 0.002551368 0.010194490 0.004820241 
              727         728         729         730         731         732 
      0.002758372 0.005499801 0.006348974 0.008045566 0.004669849 0.006005202 
              733         734         735         736         737         738 
      0.003987195 0.004617374 0.005288664 0.008825378 0.005405845 0.003679142 
              739         740         741         742         743         744 
      0.006173767 0.004695339 0.009129062 0.036190921 0.005497741 0.008775106 
              745         746         747         748         749         750 
      0.006016962 0.004456868 0.004967022 0.007237888 0.008976142 0.009874345 
              751         752         753         754         755         756 
      0.007688180 0.004007964 0.004511540 0.007625914 0.003936227 0.004498712 
              757         758         759         760         761         762 
      0.004848495 0.003376112 0.005832227 0.002958816 0.005531484 0.007429290 
              763         764         765         766         767         768 
      0.004575400 0.003463096 0.005229672 0.005354839 0.008075539 0.009976978 
              769         770         771         772         773         774 
      0.002892095 0.003307054 0.024258728 0.005726684 0.005299336 0.007874017 
              775         776         777         778         779         780 
      0.004753149 0.008209276 0.009574678 0.005851531 0.007861606 0.002559028 
              781         782         783         784         785         786 
      0.009975855 0.004403073 0.005445659 0.004416317 0.008395784 0.009780754 
              787         788         789         790         791         792 
      0.006369549 0.004900113 0.005718275 0.005732994 0.006015924 0.003384763 
              793         794         795         796         797         798 
      0.006524470 0.002799064 0.037917156 0.006914465 0.004158191 0.007847306 
              799         800         801         802         803         804 
      0.056811708 0.004307841 0.006326362 0.006236281 0.093169312 0.004662047 
              805         806         807         808         809         810 
      0.007923435 0.004661550 0.005195522 0.007037938 0.007028504 0.009092291 
              811         812         813         814         815         816 
      0.004234135 0.037674361 0.004848100 0.005514857 0.014807263 0.005227824 
              817         818         819         820         821         822 
      0.006685379 0.004293046 0.004097744 0.004239097 0.009726763 0.019802322 
              823         824         825         826         827         828 
      0.005423494 0.006474148 0.005123373 0.003517851 0.003834978 0.003557269 
              829         830         831         832         833         834 
      0.004314667 0.008299960 0.005372852 0.004312850 0.005035138 0.004281237 
              835         836         837         838         839         840 
      0.007839774 0.004324047 0.004149275 0.003296051 0.007667485 0.006638565 
              841         842         843         844         845         846 
      0.005549999 0.004117227 0.003738277 0.005147059 0.003577360 0.006660720 
              847         848         849         850         851         852 
      0.004880645 0.007071821 0.005472517 0.006592184 0.006542076 0.004285982 
              853         854         855         856         857         858 
      0.006745094 0.002574511 0.005356094 0.006783015 0.006968256 0.005550093 
              859         860         861         862         863         864 
      0.004311158 0.005549999 0.003699849 0.002588244 0.008350162 0.014807263 
              865         866         867         868         869         870 
      0.004140965 0.008132232 0.003987868 0.004655978 0.003079999 0.008779891 
              871         872         873         874         875         876 
      0.006506257 0.043768170 0.007738833 0.006445243 0.004662047 0.003758523 
              877         878         879         880         881         882 
      0.003466674 0.005351094 0.022878379 0.023367254 0.006978309 0.010512483 
              883         884         885         886         887         888 
      0.005977790 0.002599348 0.008021757 0.005998499 0.005540981 0.003437563 
              889         890         891         892         893         894 
      0.003641926 0.006006460 0.005163134 0.005590452 0.006668121 0.003430875 
              895         896         897         898         899         900 
      0.004871144 0.005686132 0.007497331 0.003604334 0.003641926 0.008364287 
              901         902         903         904         905         906 
      0.029283704 0.005143479 0.008440936 0.008299960 0.005408932 0.007258845 
              907         908         909         910         911         912 
      0.005280285 0.004150888 0.037674361 0.006412702 0.005397521 0.011860590 
              913         914         915 
      0.003884247 0.011777287 0.040628098 

---

    Code
      rstandard(M_bioChem)
    Output
                 1            2            3            4            5            6 
      -1.830044391 -1.490129962 -1.501898102 -1.576651212 -1.922229777 -1.289992708 
                 7            8            9           10           11           12 
      -1.444985405 -1.467997906 -1.689713761 -1.493113383 -1.848415629 -1.615505993 
                13           14           15           16           17           18 
      -1.427685081 -1.581587748 -1.496127886 -1.410438239 -1.629444098 -1.648136999 
                19           20           21           22           23           24 
      -1.516914710 -1.561752418 -1.611449225 -1.328183138 -1.639153588 -1.606579813 
                25           26           27           28           29           30 
      -1.295999477 -1.549460337 -1.514091984 -1.600006009 -1.393862340 -1.740060187 
                31           32           33           34           35           36 
      -1.389416877 -1.871622970 -1.618814345 -1.550907481 -1.522534954 -1.387162945 
                37           38           39           40           41           42 
      -1.385800512 -1.749475109 -1.557938521 -1.603961250 -1.749475109 -1.421597476 
                43           44           45           46           47           48 
      -1.662041675 -1.425168523 -1.668052629 -1.520722122 -1.699222832 -2.318463048 
                49           50           51           52           53           54 
      -1.662132888 -1.665245361 -1.668323126 -1.250431931 -1.616235172 -1.871622970 
                55           56           57           58           59           60 
      -1.564078635 -1.583174287 -1.428076802 -1.551910108 -1.558493566 -1.556690031 
                61           62           63           64           65           66 
      -1.495258384 -1.525992792 -1.466472109 -1.545136874 -1.519016428 -1.586571209 
                67           68           69           70           71           72 
      -1.922760663 -1.801537654 -1.526636129 -1.382115839 -1.588917027 -1.253839088 
                73           74           75           76           77           78 
      -1.514163056 -1.606124490 -1.566994210 -1.482944808 -1.394604873 -1.545090255 
                79           80           81           82           83           84 
      -1.621719346 -1.479953900 -1.421001582 -1.393175825 -1.914584919 -1.805041164 
                85           86           87           88           89           90 
      -2.130607448 -1.404785447 -2.169669009 -1.504878599 -2.154502912 -1.683788524 
                91           92           93           94           95           96 
      -1.561987671 -1.502502304 -1.734261958 -2.130607448 -1.664184760 -1.823251009 
                97           98           99          100          101          102 
      -1.731720242 -1.518944320 -1.321793725 -1.871622970 -1.484059019 -1.525992792 
               103          104          105          106          107          108 
      -1.511705944 -1.579827637 -1.409400369 -1.570632058 -1.643397840 -1.490129962 
               109          110          111          112          113          114 
      -1.323600494 -1.288453560 -1.723216536 -1.387839698 -1.408396890 -1.785275147 
               115          116          117          118          119          120 
      -1.462602887 -1.602579353 -1.757341628 -1.370080987 -1.583174287 -1.573290796 
               121          122          123          124          125          126 
      -1.526126969 -1.553827745 -1.722784878 -1.404248621 -1.419411284 -1.793516589 
               127          128          129          130          131          132 
      -1.539007380 -1.726170822 -1.550907481 -1.589121863 -1.423514578 -2.040268807 
               133          134          135          136          137          138 
      -1.592414279 -1.449707367 -1.545295819 -2.046167362 -1.628352887 -1.465232167 
               139          140          141          142          143          144 
      -1.296617815 -1.434752214 -1.369766285 -1.518349384 -1.553460524 -1.425168523 
               145          146          147          148          149          150 
      -1.420432220 -1.335056991 -1.675713100 -1.420432220 -1.727577154 -1.397099059 
               151          152          153          154          155          156 
      -1.589040673 -1.745816434 -1.565766338 -1.473506015 -1.594658904 -1.621380925 
               157          158          159          160          161          162 
      -1.491247116 -1.514103532 -1.588053819 -1.855956269 -1.556235898 -1.415168941 
               163          164          165          166          167          168 
      -1.554085449 -1.545176651 -1.736473641 -1.482417003 -1.688102042 -1.608845509 
               169          170          171          172          173          174 
      -1.682300608 -1.642828026 -1.546434152 -1.533440005 -1.406744008 -1.562031715 
               175          176          177          178          179          180 
      -1.429271149 -1.431575922 -1.654430934 -1.488552464 -1.359429007 -1.525992792 
               181          182          183          184          185          186 
      -1.370017845 -1.928567289 -1.730806673 -1.765710526 -1.648796867 -1.658725043 
               187          188          189          190          191          192 
      -1.459317615 -1.619551164 -1.381003572 -1.532702089 -1.386014208 -1.484664244 
               193          194          195          196          197          198 
      -1.390081200 -1.696593224 -1.639676260 -1.667542783 -1.503973526 -1.257533924 
               199          200          201          202          203          204 
      -1.870065142 -1.246795184 -1.626668978 -1.622619126 -1.440797685 -1.460664388 
               205          206          207          208          209          210 
      -1.534513310 -1.265987430 -1.556451921 -1.567853050 -1.391964237 -1.499923180 
               211          212          213          214          215          216 
      -1.419351929 -1.537291357 -1.514502737 -1.429038227 -1.527135003 -1.749475109 
               217          218          219          220          221          222 
      -1.756404805 -1.825462881 -1.612683445 -1.808137651 -1.741503423 -1.613316906 
               223          224          225          226          227          228 
      -1.656499307 -1.565147129 -1.544543179 -1.688991732 -1.567853050 -1.416467921 
               229          230          231          232          233          234 
      -1.609726777 -1.761647414 -1.521303184 -2.135995391 -1.560644954 -1.717938499 
               235          236          237          238          239          240 
      -1.722784878 -1.638281006 -1.446203733 -1.889738327 -1.525992792 -1.665699823 
               241          242          243          244          245          246 
      -1.402718652 -1.408708765 -1.643792829 -1.637997243 -1.606124490 -1.556690031 
               247          248          249          250          251          252 
      -1.490431873 -1.664184046 -1.416511588 -1.408255902 -1.982456153 -1.706942661 
               253          254          255          256          257          258 
      -1.466003296 -1.760829922 -1.453497210 -1.435104979 -1.536307087 -1.595973168 
               259          260          261          262          263          264 
      -1.636423195 -1.721035339 -1.618825330 -1.580858857 -1.525992792 -1.394540041 
               265          266          267          268          269          270 
      -1.443902904 -1.737395878 -1.403105325 -2.454007650 -1.481232842 -1.645342436 
               271          272          273          274          275          276 
      -1.501224594 -1.752235544 -1.525054556 -1.677263761 -1.693891495 -0.616854040 
               277          278          279          280          281          282 
      -0.169727481 -0.675153279  0.057370514 -0.381294163 -0.264012169 -0.501334898 
               283          284          285          286          287          288 
      -0.262068231 -0.251834133 -0.704687552 -0.154063198 -0.610892367 -0.735667555 
               289          290          291          292          293          294 
      -0.461334582 -0.876758561 -0.718613451 -0.574072414 -0.556049372 -0.396521259 
               295          296          297          298          299          300 
      -0.351418911 -0.525151065 -0.971041617  0.037637918 -0.433787872 -0.597217909 
               301          302          303          304          305          306 
      -0.485073468 -0.446213515 -1.641572443 -0.348453721 -0.445512954 -0.505634377 
               307          308          309          310          311          312 
      -0.503950052 -0.204334891 -0.672034572 -0.320100938 -0.124366042 -0.771913524 
               313          314          315          316          317          318 
      -0.846134921 -0.715069091 -0.742945284 -0.259075558 -0.868408271 -0.277607357 
               319          320          321          322          323          324 
      -0.301043761 -0.438342993 -0.580109006 -0.737705362 -0.204237633 -0.656515060 
               325          326          327          328          329          330 
      -0.694332194 -0.388594191 -0.181041640 -3.823808154 -0.648141929 -0.399671119 
               331          332          333          334          335          336 
      -0.514152712 -0.250459946 -0.759280722 -0.695633632 -0.323095548 -0.317688031 
               337          338          339          340          341          342 
      -0.318437832 -0.349417914 -0.404620690 -0.250459946 -0.193337946 -0.262292245 
               343          344          345          346          347          348 
      -0.365367442 -0.303768686 -0.207683611 -0.328073575 -0.404278216 -0.768129876 
               349          350          351          352          353          354 
      -0.148352169 -0.191457867 -0.380449022 -0.530264179 -0.292471274 -0.316524447 
               355          356          357          358          359          360 
      -0.504737515 -0.436154297 -0.172084253 -0.262339417 -0.226104461 -0.525361267 
               361          362          363          364          365          366 
      -0.870060691 -0.582553812 -0.722073118 -0.600802589 -0.116158401 -0.387451259 
               367          368          369          370          371          372 
      -0.100167349 -0.159880058 -0.172004026 -0.459836556 -0.192151054 -0.529925848 
               373          374          375          376          377          378 
      -0.191094427 -0.396236986 -0.591339870 -0.350630915 -0.407555204 -0.614277968 
               379          380          381          382          383          384 
      -0.557659474 -0.741956632 -1.078479629 -0.805801291 -0.282370491 -0.316202416 
               385          386          387          388          389          390 
      -0.273565488 -0.596118265 -0.302141521 -0.790615786 -0.159630204 -0.085623722 
               391          392          393          394          395          396 
      -0.633697579 -0.592829089 -0.215108891 -0.723132259 -0.614397313  0.053326314 
               397          398          399          400          401          402 
      -0.156073313 -0.379878009 -0.485347135 -0.389737445 -1.195954114 -0.505720606 
               403          404          405          406          407          408 
      -0.654065650 -0.335670500 -0.571164584 -0.337510573  0.043790443 -1.128384111 
               409          410          411          412          413          414 
      -0.579152322 -0.296543754 -0.175960471 -0.472089018 -0.295141116 -0.708187890 
               415          416          417          418          419          420 
      -0.112091757 -0.204334891 -0.351668611 -0.071086077 -0.584491296 -0.867543179 
               421          422          423          424          425          426 
      -0.782067404 -0.005257472 -0.136255667 -0.204075758 -0.205790856 -0.553525108 
               427          428          429          430          431          432 
      -0.757324342 -0.536731529 -0.526106292 -0.137253670 -0.443876484 -0.403713136 
               433          434          435          436          437          438 
      -0.614397313 -0.794630215 -0.446627621 -0.597161234 -0.403462395 -0.647844389 
               439          440          441          442          443          444 
      -0.496919219 -0.226273361 -0.704289664 -0.665860589 -0.297851309 -0.741926087 
               445          446          447          448          449          450 
      -0.608528845 -0.509644529 -0.338713398 -0.431178090 -0.637809182 -0.220761202 
               451          452          453          454          455          456 
      -0.816015236 -0.215153837 -0.135371534 -0.668741124 -1.830491241 -0.296400033 
               457          458          459          460          461          462 
      -0.378223117 -0.549913857 -0.823408897 -0.277826830 -0.119594715 -0.252329751 
               463          464          465          466          467          468 
      -0.289119704 -0.409730129 -0.553585291 -0.397819895 -0.625451843 -0.367401641 
               469          470          471          472          473          474 
      -0.476555539 -0.428978355 -1.231226547 -0.584429068 -0.345948826 -0.258681051 
               475          476          477          478          479          480 
      -0.351418911 -0.408667916 -0.443426422 -0.358101133 -0.172084253 -0.782067404 
               481          482          483          484          485          486 
      -0.775424791 -0.775424791 -1.873139377 -0.516006811 -0.463887024 -0.505634377 
               487          488          489          490          491          492 
      -0.561762756 -0.780738843 -0.438395065 -0.303188676 -0.471212221 -0.103922039 
               493          494          495          496          497          498 
      -0.427598043 -0.835821747 -0.383852521 -0.498276022 -0.289202865 -0.426522111 
               499          500          501          502          503          504 
      -0.576819999 -0.199073671 -0.621041950 -0.375029132 -0.359665958 -0.133050636 
               505          506          507          508          509          510 
      -0.292607892 -0.501334898 -0.616144048 -1.073004022 -0.670724727 -0.340610579 
               511          512          513          514          515          516 
      -0.524098245 -0.907748190 -0.547357465 -0.845685226 -0.189392643 -0.161367948 
               517          518          519          520          521          522 
      -0.226933919 -0.246351816 -0.510697964 -0.489708642 -0.545879684  0.098969140 
               523          524          525          526          527          528 
      -0.010882281  0.440371883  0.184841023  0.520424774  0.435726014  0.551434318 
               529          530          531          532          533          534 
       0.622633609  0.594348588  0.376966886  0.606665536  0.440242183  0.536636885 
               535          536          537          538          539          540 
       0.136113705  0.315991080  0.045263802  0.287603922  0.485916404  0.517652278 
               541          542          543          544          545          546 
      -0.435929378  0.663427347  0.393917396 -0.891393993  0.117048764 -0.870473986 
               547          548          549          550          551          552 
      -1.593150164 -0.061902887  0.115115773  0.425207888  0.523518760  0.623432331 
               553          554          555          556          557          558 
       0.397599130  0.204431953  0.218750204  0.664716991  0.100793076  0.509382196 
               559          560          561          562          563          564 
       0.344423175  0.137664906 -0.312380139  0.320602114  0.316914652  0.516811201 
               565          566          567          568          569          570 
       0.231161040  0.341538949  0.248729009  0.587939442 -0.550932014  0.052424357 
               571          572          573          574          575          576 
       0.259237196  0.349099000  0.275355577 -0.005634156  0.211869885  0.356323946 
               577          578          579          580          581          582 
       0.091395164  0.300106784  0.812793505  0.564240245  0.555051745  0.085189080 
               583          584          585          586          587          588 
       0.244214901  0.257073007  0.261385680  0.380881959  0.253362354  0.368217310 
               589          590          591          592          593          594 
       0.310410240 -0.563758796  0.365005096  0.625642691  0.282146500  0.365469145 
               595          596          597          598          599          600 
       0.013305922  0.419763666  0.668667053  0.152964210  0.514975693 -0.408154630 
               601          602          603          604          605          606 
       0.197942516  0.663036133  0.582057794  0.271548842  0.587578684 -0.614724007 
               607          608          609          610          611          612 
       0.219069187  0.484155038  0.076897181  0.334948396 -0.486663756  0.165876294 
               613          614          615          616          617          618 
       0.447001579  0.305845302  0.529727092  0.461075175  0.215138364 -0.447685041 
               619          620          621          622          623          624 
       0.241398407  0.159748632  0.023217174  0.251445967  0.097621254  0.511041033 
               625          626          627          628          629          630 
      -0.149415593  0.078540172  0.823204210  0.200109956 -0.144415763 -0.126221551 
               631          632          633          634          635          636 
       0.054908191  0.587412635  0.526606929  0.528684214  0.661765929  0.105493032 
               637          638          639          640          641          642 
      -0.240073234  0.503431392  0.566754632  0.045929744  0.472711747  0.063295956 
               643          644          645          646          647          648 
      -0.350628044  0.356937070 -0.209222444  0.508744670  0.457619809  0.232165813 
               649          650          651          652          653          654 
       0.336587235  0.371378510  0.544973347 -0.125538155  0.522549215  0.463722220 
               655          656          657          658          659          660 
       0.639457873  0.156713747  0.422364971  0.176718370 -0.097483256  0.373829524 
               661          662          663          664          665          666 
       0.434457959  0.232041915  0.161409924  0.588166153  0.618249030 -0.209222444 
               667          668          669          670          671          672 
       0.264084019  0.605324428 -1.779223140  0.166003261  0.358196645  0.578742502 
               673          674          675          676          677          678 
       0.556933149  0.384592931  0.114233682  0.508674345 -0.045567524 -0.602304363 
               679          680          681          682          683          684 
       0.254547033  0.241398407 -0.514187588 -0.586574913  0.412659506  0.252731072 
               685          686          687          688          689          690 
       0.410506165  0.307207861  0.390261748  0.683594161  0.841797448  0.127775120 
               691          692          693          694          695          696 
       0.312107093  0.588813715 -0.021728817 -0.267241268  0.468991394  0.617440378 
               697          698          699          700          701          702 
       0.494246150  0.257350620  0.131905442  0.955674854  1.318840318  0.784027942 
               703          704          705          706          707          708 
       0.291737542  0.689679592  0.660870609  1.270475833  0.944259293  0.674269162 
               709          710          711          712          713          714 
      -0.016595584  0.522690515  1.227648350  1.061776514 -0.621017923  0.589290213 
               715          716          717          718          719          720 
       0.674269162  0.733811436  1.159766188  1.010675551  0.928425923  1.017544737 
               721          722          723          724          725          726 
       0.670704945  0.526246940  1.304855136  0.939693906  0.514248209  0.488829467 
               727          728          729          730          731          732 
       0.913756184  1.045223752  0.814393581  0.625371149  0.948815912  1.245628101 
               733          734          735          736          737          738 
       0.986352922  0.592154325  0.829500894  0.127546536  1.116726596  1.218234898 
               739          740          741          742          743          744 
       1.164273748  0.794127611  0.439011278 -0.393927070  0.807248337 -0.024371500 
               745          746          747          748          749          750 
       0.458889982  1.195084028  0.453109911  0.779889040  1.138079533 -0.107617446 
               751          752          753          754          755          756 
       0.422214002  1.347962577  0.967804689  0.318827428  1.018086981  0.860253915 
               757          758          759          760          761          762 
       1.223969576  0.789956527  0.871726768  0.931398151  0.843439407  0.810996146 
               763          764          765          766          767          768 
       0.696349536  1.273056416  0.757075581  0.368006763  0.749534807  0.199878149 
               769          770          771          772          773          774 
       0.637508935  1.266000755 -0.664289067  0.664892367  1.266641897  0.984344119 
               775          776          777          778          779          780 
       0.582127791  0.678652588  0.195145014  1.214620422  1.105917934  0.938027556 
               781          782          783          784          785          786 
       1.455191120  1.168014175  1.299503285  1.253370502  1.168694458  0.578507762 
               787          788          789          790          791          792 
       1.387825453  1.099298079  1.445837738  1.853493695  1.515408381  1.905612445 
               793          794          795          796          797          798 
       1.338594541  1.674409256 -0.281309542  1.452497458  1.559534011  0.892884500 
               799          800          801          802          803          804 
      -0.743844519  1.557774563  1.870168514  1.438805998 -0.874338760  1.327477042 
               805          806          807          808          809          810 
       1.453834549  1.279459633  1.399294365  1.089776424  1.517284425  0.989438447 
               811          812          813          814          815          816 
       1.639505319 -0.175491778  1.823731192  1.846599021  0.227293531  1.040665416 
               817          818          819          820          821          822 
       1.278695797  1.618252207  1.579722023  1.463212044  1.208864631  0.550995775 
               823          824          825          826          827          828 
       1.266801689  1.622088418  1.257519953  1.739927964  1.574316637  1.673178546 
               829          830          831          832          833          834 
       1.684630834  0.956176078  1.395512961  0.952535877  1.812283227  1.573544774 
               835          836          837          838          839          840 
       0.607037463  1.495483184  1.496475450  1.828743025  1.177201251  1.199250567 
               841          842          843          844          845          846 
       0.796993352  1.591938032  1.635601243  1.614392840  1.821943456  1.393669680 
               847          848          849          850          851          852 
       1.242224418  1.309166536  1.734650354  1.126254090  1.718524994  2.033220170 
               853          854          855          856          857          858 
       1.952395081  2.039310328  1.204716748  1.714508227  1.485969151  1.781436528 
               859          860          861          862          863          864 
       2.000782561  1.297985806  1.441918861  2.076387408  1.442618738  0.709664873 
               865          866          867          868          869          870 
       2.079926330  1.722346149  2.468991002  1.814118621  2.204964656  1.400801923 
               871          872          873          874          875          876 
       2.245729084 -0.088371541  1.907561884  1.590163968  1.849685704  2.284532662 
               877          878          879          880          881          882 
       2.367874009  2.408477886  1.368885499  1.963236379  2.082736867  1.852884184 
               883          884          885          886          887          888 
       2.609568979  2.243158912  1.981620269  2.153407420  2.555941223  2.113718815 
               889          890          891          892          893          894 
       2.679504845  2.447944963  2.453408144  2.720247200  2.549956852  2.780348935 
               895          896          897          898          899          900 
       2.864219920  2.936209623  2.364717939  3.207094541  3.154586155  2.553612896 
               901          902          903          904          905          906 
       1.308436907  2.547230858  2.392114975  2.392812303  2.107282276  2.401947288 
               907          908          909          910          911          912 
       2.917631369  3.129184222  1.958622643  3.812897643  4.931747867  3.636447093 
               913          914          915 
       5.099449394  5.381016974  5.056925033 

---

    Code
      round(rstandard(M_bioChem, type = "pearson"), 5)
    Output
             1        2        3        4        5        6        7        8 
      -1.23079 -0.97491 -0.98342 -1.03775 -1.30362 -0.83521 -0.94275 -0.95904 
             9       10       11       12       13       14       15       16 
      -1.12215 -0.97699 -1.24510 -1.06616 -0.93050 -1.04149 -0.97922 -0.91838 
            17       18       19       20       21       22       23       24 
      -1.07694 -1.09076 -0.99428 -1.02688 -1.06357 -0.86115 -1.08425 -1.06008 
            25       26       27       28       29       30       31       32 
      -0.83922 -1.01783 -0.99222 -1.05508 -0.90677 -1.16081 -0.90366 -1.26341 
            33       34       35       36       37       38       39       40 
      -1.06885 -1.01886 -0.99830 -0.90207 -0.90110 -1.16790 -1.02403 -1.05800 
            41       42       43       44       45       46       47       48 
      -1.16790 -0.92623 -1.10135 -0.92874 -1.10581 -0.99693 -1.12959 -1.63071 
            49       50       51       52       53       54       55       56 
      -1.10140 -1.10380 -1.10599 -0.80854 -1.06704 -1.26341 -1.02867 -1.04259 
            57       58       59       60       61       62       63       64 
      -0.93079 -1.01978 -1.02455 -1.02315 -0.97865 -1.00086 -0.95802 -1.01475 
            65       66       67       68       69       70       71       72 
      -0.99578 -1.04526 -1.30404 -1.20826 -1.00134 -0.89848 -1.04677 -0.81083 
            73       74       75       76       77       78       79       80 
      -0.99222 -1.05950 -1.03061 -0.96972 -0.90721 -1.01477 -1.07131 -0.96767 
            81       82       83       84       85       86       87       88 
      -0.92578 -0.90628 -1.29807 -1.21114 -1.47365 -0.91424 -1.50514 -0.98549 
            89       90       91       92       93       94       95       96 
      -1.49345 -1.11801 -1.02706 -0.98386 -1.15614 -1.47365 -1.10294 -1.22517 
            97       98       99      100      101      102      103      104 
      -1.15418 -0.99574 -0.85686 -1.26341 -0.97060 -1.00086 -0.99030 -1.04020 
           105      106      107      108      109      110      111      112 
      -0.91755 -1.03351 -1.08740 -0.97491 -0.85801 -0.83417 -1.14789 -0.90254 
           113      114      115      116      117      118      119      120 
      -0.91694 -1.19580 -0.95517 -1.05694 -1.17398 -0.89021 -1.04259 -1.03545 
           121      122      123      124      125      126      127      128 
      -1.00093 -1.02113 -1.14766 -0.91401 -0.92465 -1.20241 -1.01023 -1.15018 
           129      130      131      132      133      134      135      136 
      -1.01886 -1.04698 -0.92757 -1.39980 -1.04933 -0.94604 -1.01483 -1.40329 
           137      138      139      140      141      142      143      144 
      -1.07617 -0.95714 -0.83964 -0.93542 -0.88999 -0.99516 -1.02076 -0.92874 
           145      146      147      148      149      150      151      152 
      -0.92537 -0.86596 -1.11171 -0.92537 -1.15125 -0.90877 -1.04687 -1.16522 
           153      154      155      156      157      158      159      160 
      -1.02983 -0.96261 -1.05108 -1.07105 -0.97566 -0.99218 -1.04627 -1.25124 
           161      162      163      164      165      166      167      168 
      -1.02288 -0.92169 -1.02114 -1.01474 -1.15803 -0.96943 -1.12111 -1.06159 
           169      170      171      172      173      174      175      176 
      -1.11675 -1.08698 -1.01569 -1.00616 -0.91578 -1.02701 -0.93155 -0.93326 
           177      178      179      180      181      182      183      184 
      -1.09571 -0.97379 -0.88270 -1.00086 -0.89017 -1.30908 -1.15350 -1.18069 
           185      186      187      188      189      190      191      192 
      -1.09135 -1.09876 -0.95293 -1.06957 -0.89768 -1.00566 -0.90125 -0.97097 
           193      194      195      196      197      198      199      200 
      -0.90412 -1.12754 -1.08452 -1.10557 -0.98492 -0.81331 -1.26257 -0.80609 
           201      202      203      204      205      206      207      208 
      -1.07473 -1.07199 -0.93968 -0.95389 -1.00700 -0.81900 -1.02304 -1.03126 
           209      210      211      212      213      214      215      216 
      -0.90520 -0.98199 -0.92457 -1.00906 -0.99252 -0.93132 -1.00165 -1.16790 
           217      218      219      220      221      222      223      224 
      -1.17320 -1.22700 -1.06433 -1.21365 -1.16194 -1.06492 -1.09728 -1.02938 
           225      226      227      228      229      230      231      232 
      -1.01432 -1.12156 -1.03126 -0.92260 -1.06226 -1.17745 -0.99741 -1.47778 
           233      234      235      236      237      238      239      240 
      -1.02604 -1.14383 -1.14766 -1.08332 -0.94362 -1.27745 -1.00086 -1.10406 
           241      242      243      244      245      246      247      248 
      -0.91293 -0.91716 -1.08785 -1.08340 -1.05950 -1.02315 -0.97508 -1.10298 
           249      250      251      252      253      254      255      256 
      -0.92255 -0.91685 -1.35252 -1.13532 -0.95769 -1.17681 -0.94875 -0.93573 
           257      258      259      260      261      262      263      264 
      -1.00833 -1.05201 -1.08222 -1.14617 -1.06909 -1.04093 -1.00086 -0.90725 
           265      266      267      268      269      270      271      272 
      -0.94185 -1.15861 -0.91316 -1.74339 -0.96848 -1.08865 -0.98293 -1.17017 
           273      274      275      276      277      278      279      280 
      -1.00007 -1.11291 -1.12566 -0.53695 -0.15518 -0.58528  0.05455 -0.33917 
           281      282      283      284      285      286      287      288 
      -0.23820 -0.44059 -0.23651 -0.22758 -0.60975 -0.14119 -0.53201 -0.63532 
           289      290      291      292      293      294      295      296 
      -0.40695 -0.75173 -0.62127 -0.50139 -0.48635 -0.35212 -0.31365 -0.46054 
           297      298      299      300      301      302      303      304 
      -0.82946  0.03565 -0.38373 -0.52067 -0.42694 -0.39421 -1.38347 -0.31111 
           305      306      307      308      309      310      311      312 
      -0.39361 -0.44419 -0.44278 -0.18587 -0.58272 -0.28676 -0.11450 -0.66528 
           313      314      315      316      317      318      319      320 
      -0.72649 -0.61833 -0.64140 -0.23390 -0.74492 -0.25003 -0.27033 -0.38758 
           321      322      323      324      325      326      327      328 
      -0.50641 -0.63700 -0.18579 -0.56990 -0.60120 -0.34538 -0.16525 -3.04681 
           329      330      331      332      333      334      335      336 
      -0.56292 -0.35480 -0.45134 -0.22638 -0.65484 -0.60226 -0.28934 -0.28469 
           337      338      339      340      341      342      343      344 
      -0.28536 -0.31194 -0.35901 -0.22638 -0.17615 -0.23670 -0.32557 -0.27269 
           345      346      347      348      349      350      351      352 
      -0.18884 -0.29362 -0.35872 -0.66214 -0.13608 -0.17449 -0.33844 -0.46481 
           353      354      355      356      357      358      359      360 
      -0.26292 -0.28369 -0.44344 -0.38574 -0.15728 -0.23675 -0.20505 -0.46072 
           361      362      363      364      365      366      367      368 
      -0.74624 -0.50844 -0.62415 -0.52364 -0.10709 -0.34442 -0.09258 -0.14639 
           369      370      371      372      373      374      375      376 
      -0.15720 -0.40572 -0.17510 -0.46451 -0.17417 -0.35191 -0.51573 -0.31299 
           377      378      379      380      381      382      383      384 
      -0.36151 -0.53482 -0.48772 -0.64050 -0.91814 -0.69321 -0.25417 -0.28340 
           385      386      387      388      389      390      391      392 
      -0.24651 -0.51971 -0.27128 -0.68070 -0.14617 -0.07933 -0.55097 -0.51699 
           393      394      395      396      397      398      399      400 
      -0.19538 -0.62500 -0.53491  0.05066 -0.14299 -0.33798 -0.42718 -0.34638 
           401      402      403      404      405      406      407      408 
      -1.01530 -0.44426 -0.56784 -0.30015 -0.49898 -0.30174  0.04153 -0.95939 
           409      410      411      412      413      414      415      416 
      -0.50557 -0.26644 -0.16073 -0.41600 -0.26522 -0.61261 -0.10340 -0.18587 
           417      418      419      420      421      422      423      424 
      -0.31387 -0.06602 -0.51008 -0.74411 -0.67369 -0.00494 -0.12522 -0.18564 
           425      426      427      428      429      430      431      432 
      -0.18718 -0.48422 -0.65324 -0.47024 -0.46135 -0.12611 -0.39224 -0.35824 
           433      434      435      436      437      438      439      440 
      -0.53491 -0.68404 -0.39455 -0.52061 -0.35803 -0.56266 -0.43689 -0.20520 
           441      442      443      444      445      446      447      448 
      -0.60939 -0.57761 -0.26757 -0.64052 -0.53005 -0.44754 -0.30276 -0.38150 
           449      450      451      452      453      454      455      456 
      -0.55436 -0.20035 -0.70166 -0.19541 -0.12442 -0.57999 -1.53772 -0.26632 
           457      458      459      460      461      462      463      464 
      -0.33656 -0.48125 -0.70773 -0.25022 -0.11019 -0.22802 -0.26001 -0.36336 
           465      466      467      468      469      470      471      472 
      -0.48431 -0.35324 -0.54411 -0.32731 -0.41978 -0.37966 -1.04443 -0.51000 
           473      474      475      476      477      478      479      480 
      -0.30897 -0.23356 -0.31365 -0.36243 -0.39187 -0.31939 -0.15728 -0.67369 
           481      482      483      484      485      486      487      488 
      -0.66812 -0.66812 -1.57222 -0.45290 -0.40913 -0.44419 -0.49112 -0.67257 
           489      490      491      492      493      494      495      496 
      -0.38761 -0.27218 -0.41529 -0.09599 -0.37848 -0.71796 -0.34137 -0.43803 
           497      498      499      500      501      502      503      504 
      -0.26008 -0.37757 -0.50366 -0.18122 -0.54045 -0.33383 -0.32070 -0.12233 
           505      506      507      508      509      510      511      512 
      -0.26304 -0.44059 -0.53636 -0.91367 -0.58163 -0.30438 -0.45966 -0.77723 
           513      514      515      516      517      518      519      520 
      -0.47910 -0.72607 -0.17265 -0.14772 -0.20579 -0.22280 -0.44843 -0.43081 
           521      522      523      524      525      526      527      528 
      -0.47787  0.09473 -0.01031  0.44014  0.17858  0.52673  0.43519  0.56106 
           529      530      531      532      533      534      535      536 
       0.64143  0.60921  0.37327  0.62318  0.43998  0.54464  0.13079  0.31027 
           537      538      539      540      541      542      543      544 
       0.04309  0.28136  0.48910  0.52371 -0.40104  0.68864  0.39101 -0.80523 
           545      546      547      548      549      550      551      552 
       0.11225 -0.78698 -1.40468 -0.05837  0.11037  0.42397  0.53018  0.64234 
           553      554      555      556      557      558      559      560 
       0.39489  0.19795  0.21218  0.69014  0.09649  0.51461  0.33950  0.13231 
           561      562      563      564      565      566      567      568 
      -0.28933  0.31500  0.31122  0.52273  0.22455  0.33654  0.24213  0.60186 
           569      570      571      572      573      574      575      576 
      -0.50421  0.04994  0.25270  0.34434  0.26896 -0.00534  0.20534  0.35181 
           577      578      579      580      581      582      583      584 
       0.08741  0.29407  0.86893  0.57534  0.56509  0.08142  0.23762  0.25052 
           585      586      587      588      589      590      591      592 
       0.25486  0.37736  0.24679  0.36413  0.30459 -0.51555  0.36081  0.64487 
           593      594      595      596      597      598      599      600 
       0.27583  0.36129  0.01263  0.41825  0.69465  0.14726  0.52077 -0.37603 
           601      602      603      604      605      606      607      608 
       0.19153  0.68780  0.59535  0.26511  0.60157 -0.56092  0.21251  0.48719 
           609      610      611      612      613      614      615      616 
       0.07344  0.32972 -0.44658  0.15992  0.44721  0.29991  0.53702  0.46228 
           617      618      619      620      621      622      623      624 
       0.20858 -0.41164  0.23479  0.15390  0.02206  0.24487  0.09343  0.51644 
           625      626      627      628      629      630      631      632 
      -0.13991  0.07502  0.88216  0.19367 -0.13528 -0.11840  0.05232  0.60138 
           633      634      635      636      637      638      639      640 
       0.53358  0.53582  0.68635  0.10104 -0.22338  0.50817  0.57814  0.04373 
           641      642      643      644      645      646      647      648 
       0.47483  0.06037 -0.32404  0.35245 -0.19508  0.51397  0.45858  0.22556 
           649      650      651      652      653      654      655      656 
       0.33141  0.36745  0.55386 -0.11776  0.52910  0.46514  0.66080  0.15093 
           657      658      659      660      661      662      663      664 
       0.42100  0.17058 -0.09165  0.37001  0.43384  0.22544  0.15554  0.60223 
           665      666      667      668      669      670      671      672 
       0.63643 -0.19508  0.25758  0.62156 -1.55804  0.16004  0.35377  0.59157 
           673      674      675      676      677      678      679      680 
       0.56719  0.38123  0.10951  0.51384 -0.04303 -0.55005  0.24798  0.23479 
           681      682      683      684      685      686      687      688 
      -0.47126 -0.53586  0.41072  0.24615  0.40847  0.30130  0.38718  0.71218 
           689      690      691      692      693      694      695      696 
       0.90571  0.12267  0.30630  0.60296 -0.02056 -0.24823  0.47082  0.63550 
           697      698      699      700      701      702      703      704 
       0.49812  0.25080  0.12669  1.00607  1.47795  0.80630  0.28603  0.70147 
           705      706      707      708      709      710      711      712 
       0.67001  1.41043  0.99255  0.68456 -0.01596  0.52246  1.35199  1.13621 
           713      714      715      716      717      718      719      720 
      -0.58167  0.59293  0.68456  0.75016  1.26138  1.07283  0.97343  1.08126 
           721      722      723      724      725      726      727      728 
       0.68064  0.52619  1.45768  0.98711  0.51357  0.48710  0.95629  1.11544 
           729      730      731      732      733      734      735      736 
       0.84079  0.63152  0.99787  1.37600  1.04319  0.59598  0.85811  0.12370 
           737      738      739      740      741      742      743      744 
       1.20578  1.33930  1.26733  0.81783  0.43549 -0.37245  0.83269 -0.02343 
           745      746      747      748      749      750      751      752 
       0.45603  1.30823  0.45007  0.80164  1.23287 -0.10304  0.41824  1.51929 
           753      754      755      756      757      758      759      760 
       1.02070  0.31324  1.08200  0.89359  1.34684  0.81316  0.90684  0.97720 
           761      762      763      764      765      766      767      768 
       0.87412  0.83687  0.70878  1.41403  0.77609  0.36294  0.76756  0.19473 
           769      770      771      772      773      774      775      776 
       0.64472  1.40433 -0.62109  0.67435  1.40487  1.04045  0.58529  0.68929 
           777      778      779      780      781      782      783      784 
       0.19006  1.33412  1.19167  0.98512  1.67579  1.27247  1.45042  1.33977 
           785      786      787      788      789      790      791      792 
       1.23672  0.58255  1.50903  1.15489  1.58496  2.17600  1.67825  2.26133 
           793      794      795      796      797      798      799      800 
       1.44598  1.90334 -0.27160  1.59358  1.73929  0.91989 -0.70298  1.73682 
           801      802      803      804      805      806      807      808 
       2.20248  1.57559 -0.82171  1.43214  1.59519  1.37199  1.52405  1.14362 
           809      810      811      812      813      814      815      816 
       1.68061  1.02807  1.85230 -0.17023  2.12918  2.16510  0.22456  1.08681 
           817      818      819      820      821      822      823      824 
       1.37082  1.82185  1.76746  1.60828  1.28494  0.55382  1.35623  1.82679 
           825      826      827      828      829      830      831      832 
       1.34481  2.00051  1.75995  1.90133  1.91791  0.99052  1.51912  0.98660 
           833      834      835      836      837      838      839      840 
       2.11116  1.75877  0.61240  1.65156  1.65293  2.13765  1.24697  1.27359 
           841      842      843      844      845      846      847      848 
       0.81484  1.78461  1.84681  1.81615  2.12684  1.51654  1.32603  1.40880 
           849      850      851      852      853      854      855      856 
       1.99194  1.18646  1.90125  2.34806  2.22702  2.35793  1.26974  1.89586 
           857      858      859      860      861      862      863      864 
       1.60359  1.98621  2.29927  1.37789  1.54997  2.41477  1.55034  0.72569 
           865      866      867      868      869      870      871      872 
       2.41962  1.90603  3.08252  2.03126  2.61940  1.49970  2.68518 -0.08697 
           873      874      875      876      877      878      879      880 
       2.16187  1.73418  2.08073  2.75229  2.89787  2.83594  1.45964  2.18864 
           881      882      883      884      885      886      887      888 
       2.35435  2.04712  3.16774  2.58496  2.21641  2.45384  3.07641  2.39853 
           889      890      891      892      893      894      895      896 
       3.29255  2.89843  2.90766  3.36474  3.06564  3.47807  3.47992  3.60406 
           897      898      899      900      901      902      903      904 
       2.70902  4.11549  4.01130  2.98224  1.39754  2.97405  2.74730  2.74833 
           905      906      907      908      909      910      911      912 
       2.36219  2.76161  3.48030  3.75602  2.17814  4.82272  7.07816  4.44645 
           913      914      915 
       7.22660  7.24521  6.57337 

---

    Code
      cooks.distance(M_bioChem)
    Output
                 1            2            3            4            5            6 
      1.219057e-03 7.268022e-04 5.949419e-04 1.032933e-03 2.249726e-03 7.172512e-04 
                 7            8            9           10           11           12 
      4.898614e-04 8.099493e-04 1.524346e-03 9.566403e-04 1.625416e-03 2.063272e-03 
                13           14           15           16           17           18 
      5.484934e-04 7.456860e-04 7.607954e-04 4.588004e-04 9.884577e-04 1.481160e-03 
                19           20           21           22           23           24 
      5.781347e-04 8.214944e-04 8.544135e-04 1.245842e-03 8.509064e-04 4.887225e-04 
                25           26           27           28           29           30 
      1.151130e-03 9.791165e-04 6.233122e-04 8.194839e-04 4.456178e-04 1.098236e-03 
                31           32           33           34           35           36 
      4.950170e-04 1.798662e-03 1.431009e-03 1.045627e-03 7.587548e-04 5.647712e-04 
                37           38           39           40           41           42 
      6.250379e-04 1.491975e-03 9.673390e-04 8.635441e-04 1.491975e-03 4.732421e-04 
                43           44           45           46           47           48 
      1.131135e-03 4.995795e-04 1.352653e-03 9.151374e-04 9.805940e-04 4.007233e-03 
                49           50           51           52           53           54 
      1.186586e-03 1.050958e-03 1.419451e-03 6.662392e-04 1.104851e-03 1.798662e-03 
                55           56           57           58           59           60 
      5.545530e-04 9.402067e-04 4.742564e-04 4.835602e-04 6.432687e-04 8.751087e-04 
                61           62           63           64           65           66 
      5.644715e-04 5.693177e-04 5.530180e-04 7.217441e-04 6.420522e-04 4.880912e-04 
                67           68           69           70           71           72 
      2.259978e-03 1.654360e-03 5.466483e-04 8.753780e-04 1.123051e-03 6.268437e-04 
                73           74           75           76           77           78 
      7.942646e-04 1.164240e-03 1.153567e-03 8.535808e-04 7.755404e-04 5.547138e-04 
                79           80           81           82           83           84 
      5.973278e-04 5.276785e-04 5.897485e-04 4.952472e-04 8.624056e-04 1.294319e-03 
                85           86           87           88           89           90 
      3.051081e-03 1.144414e-03 5.665327e-03 8.714104e-04 3.247665e-03 5.859789e-04 
                91           92           93           94           95           96 
      7.935872e-04 6.081193e-04 1.624190e-03 3.051081e-03 1.212453e-03 1.899278e-03 
                97           98           99          100          101          102 
      1.646964e-03 6.005662e-04 7.938510e-04 1.798662e-03 5.728754e-04 5.693177e-04 
               103          104          105          106          107          108 
      1.257993e-03 7.161390e-04 8.612324e-04 4.858091e-04 9.394087e-04 7.268022e-04 
               109          110          111          112          113          114 
      1.273800e-03 6.942097e-04 1.058069e-03 5.401417e-04 4.854991e-04 1.113859e-03 
               115          116          117          118          119          120 
      8.846063e-04 9.606454e-04 1.496537e-03 4.410997e-04 9.402067e-04 5.280065e-04 
               121          122          123          124          125          126 
      6.851572e-04 6.352954e-04 7.866159e-04 5.658370e-04 6.147928e-04 6.415859e-04 
               127          128          129          130          131          132 
      8.750374e-04 9.831614e-04 1.045627e-03 9.567165e-04 5.140056e-04 1.305591e-03 
               133          134          135          136          137          138 
      1.195709e-03 7.266907e-04 8.324612e-04 4.587723e-03 8.499635e-04 5.317777e-04 
               139          140          141          142          143          144 
      1.151657e-03 7.996104e-04 4.439762e-04 1.080940e-03 9.365451e-04 4.995795e-04 
               145          146          147          148          149          150 
      6.134152e-04 7.817681e-04 1.064057e-03 6.134152e-04 1.011669e-03 1.520967e-03 
               151          152          153          154          155          156 
      1.115525e-03 1.156486e-03 7.929425e-04 2.095671e-03 9.302464e-04 6.121722e-04 
               157          158          159          160          161          162 
      9.154206e-04 7.973873e-04 7.346933e-04 1.192725e-03 6.897767e-04 5.044285e-04 
               163          164          165          166          167          168 
      1.191300e-03 8.396344e-04 1.139915e-03 5.458643e-04 1.027311e-03 9.890249e-04 
               169          170          171          172          173          174 
      9.172497e-04 9.195849e-04 7.581580e-04 9.485511e-04 4.953194e-04 1.041794e-03 
               175          176          177          178          179          180 
      7.983792e-04 5.106533e-04 8.900789e-04 6.989569e-04 1.046180e-03 5.693177e-04 
               181          182          183          184          185          186 
      4.416373e-04 1.354622e-03 1.589041e-03 8.874824e-04 1.218506e-03 1.378421e-03 
               187          188          189          190          191          192 
      5.269117e-04 9.507507e-04 9.828048e-04 8.179480e-04 6.145857e-04 7.783222e-04 
               193          194          195          196          197          198 
      4.807510e-04 1.085539e-03 1.180445e-03 9.534208e-04 6.093916e-04 6.361869e-04 
               199          200          201          202          203          204 
      8.424071e-04 7.724162e-04 1.345775e-03 5.632916e-04 8.892734e-04 5.122113e-04 
               205          206          207          208          209          210 
      7.375975e-04 6.776611e-04 6.868691e-04 1.100466e-03 1.467263e-03 6.356197e-04 
               211          212          213          214          215          216 
      7.652641e-04 6.274973e-04 6.323317e-04 1.061186e-03 7.101518e-04 1.491975e-03 
               217          218          219          220          221          222 
      1.621224e-03 1.668499e-03 1.296756e-03 1.076954e-03 1.042504e-03 9.725816e-04 
               223          224          225          226          227          228 
      8.454637e-04 7.842793e-04 7.073228e-04 1.623994e-03 1.100466e-03 5.319388e-04 
               229          230          231          232          233          234 
      9.350733e-04 1.141002e-03 7.431161e-04 3.929725e-03 8.891499e-04 1.101546e-03 
               235          236          237          238          239          240 
      7.866159e-04 1.612338e-03 4.954969e-04 2.701203e-03 5.693177e-04 1.281032e-03 
               241          242          243          244          245          246 
      5.980241e-04 4.668931e-04 5.378842e-04 8.117779e-04 1.164240e-03 8.751087e-04 
               247          248          249          250          251          252 
      8.957915e-04 1.103304e-03 8.587580e-04 4.715379e-04 1.573468e-03 1.377108e-03 
               253          254          255          256          257          258 
      5.442674e-04 1.150037e-03 6.530683e-04 5.942722e-04 6.857915e-04 1.060113e-03 
               259          260          261          262          263          264 
      8.034615e-04 1.178460e-03 7.656801e-04 8.059427e-04 5.693177e-04 4.466830e-04 
               265          266          267          268          269          270 
      9.988006e-04 1.469304e-03 7.524691e-04 9.474681e-03 8.873157e-04 1.526408e-03 
               271          272          273          274          275          276 
      6.166939e-04 1.146836e-03 9.271699e-04 9.940792e-04 6.263595e-04 2.225261e-04 
               277          278          279          280          281          282 
      1.762092e-05 2.504581e-04 4.966092e-06 7.418244e-05 3.264390e-05 1.671286e-04 
               283          284          285          286          287          288 
      3.727794e-05 3.811978e-05 4.452353e-04 1.428009e-05 2.641584e-04 3.185971e-04 
               289          290          291          292          293          294 
      7.452813e-05 6.609031e-04 4.833194e-04 2.724290e-04 2.066442e-04 8.197107e-05 
               295          296          297          298          299          300 
      6.813358e-05 2.096515e-04 8.154313e-04 2.336216e-06 1.531778e-04 3.756176e-04 
               301          302          303          304          305          306 
      1.699609e-04 1.102122e-04 8.580153e-03 6.337231e-05 7.562544e-05 1.515740e-04 
               307          308          309          310          311          312 
      1.686772e-04 2.319026e-05 3.235032e-04 5.130175e-05 1.140179e-05 5.454393e-04 
               313          314          315          316          317          318 
      6.193973e-04 4.186525e-04 6.616551e-04 3.218910e-05 1.075784e-03 4.514367e-05 
               319          320          321          322          323          324 
      5.778567e-05 1.479049e-04 2.643623e-04 3.064639e-04 2.325546e-05 4.668533e-04 
               325          326          327          328          329          330 
      5.028769e-04 7.665911e-05 2.750099e-05 4.365935e-01 2.778465e-04 8.705217e-05 
               331          332          333          334          335          336 
      2.156777e-04 4.005783e-05 4.478280e-04 4.019774e-04 5.435451e-05 7.379725e-05 
               337          338          339          340          341          342 
      1.119375e-04 7.320708e-05 1.165436e-04 4.005783e-05 1.787714e-05 3.204490e-05 
               343          344          345          346          347          348 
      5.102404e-05 7.678424e-05 3.862550e-05 4.550697e-05 9.415222e-05 4.283343e-04 
               349          350          351          352          353          354 
      1.738949e-05 3.792525e-05 5.660674e-05 1.771391e-04 6.252204e-05 7.416120e-05 
               355          356          357          358          359          360 
      1.554741e-04 1.823344e-04 2.377235e-05 3.961304e-05 2.454533e-05 2.079508e-04 
               361          362          363          364          365          366 
      8.551061e-04 2.223450e-04 5.714769e-04 3.281904e-04 1.085016e-05 9.580091e-05 
               367          368          369          370          371          372 
      8.263240e-06 2.254245e-05 1.514695e-05 1.694942e-04 1.729453e-05 1.212245e-04 
               373          374          375          376          377          378 
      2.731918e-05 1.572671e-04 1.760860e-04 8.635800e-05 1.355447e-04 2.605574e-04 
               379          380          381          382          383          384 
      3.084035e-04 2.268555e-04 1.415862e-03 4.060927e-04 7.418156e-05 4.922495e-05 
               385          386          387          388          389          390 
      4.527631e-05 1.997129e-04 5.208835e-05 5.051533e-04 1.256587e-05 1.107467e-05 
               391          392          393          394          395          396 
      3.912357e-04 2.282363e-04 3.469727e-05 4.660375e-04 2.354871e-04 4.870280e-06 
               397          398          399          400          401          402 
      1.349367e-05 1.294485e-04 1.818766e-04 1.356567e-04 3.072718e-03 1.429921e-04 
               403          404          405          406          407          408 
      3.639019e-04 7.091057e-05 3.084230e-04 9.694197e-05 1.686142e-06 1.911838e-03 
               409          410          411          412          413          414 
      1.116448e-04 4.822741e-05 1.833223e-05 8.328532e-05 5.017460e-05 2.798270e-04 
               415          416          417          418          419          420 
      6.256538e-06 2.319026e-05 8.597832e-05 4.570705e-06 3.240546e-04 4.860587e-04 
               421          422          423          424          425          426 
      7.132765e-04 4.499771e-08 1.630782e-05 1.938377e-05 6.774820e-05 1.098985e-04 
               427          428          429          430          431          432 
      5.028674e-04 2.536637e-04 2.334921e-04 1.783133e-05 1.147498e-04 1.103603e-04 
               433          434          435          436          437          438 
      2.354871e-04 6.508241e-04 7.953659e-05 2.964595e-04 1.181813e-04 2.360336e-04 
               439          440          441          442          443          444 
      1.723994e-04 3.972757e-05 2.751138e-04 3.350917e-04 4.675808e-05 4.929633e-04 
               445          446          447          448          449          450 
      2.904117e-04 1.167770e-04 6.515176e-05 7.574725e-05 3.113727e-04 2.544533e-05 
               451          452          453          454          455          456 
      5.845200e-04 2.143371e-05 9.166579e-06 3.371612e-04 1.037224e-02 6.989035e-05 
               457          458          459          460          461          462 
      1.046664e-04 2.626718e-04 4.372868e-04 6.624753e-05 1.325976e-05 4.462270e-05 
               463          464          465          466          467          468 
      4.576556e-05 1.408322e-04 2.568648e-04 1.047941e-04 3.286050e-04 5.520051e-05 
               469          470          471          472          473          474 
      1.499054e-04 1.388335e-04 2.655287e-03 2.301349e-04 7.977925e-05 4.397022e-05 
               475          476          477          478          479          480 
      6.813358e-05 5.986283e-05 1.351463e-04 1.202787e-04 2.377235e-05 7.132765e-04 
               481          482          483          484          485          486 
      2.266038e-04 2.266038e-04 1.065199e-02 2.414745e-04 1.630627e-04 1.515740e-04 
               487          488          489          490          491          492 
      2.339751e-04 5.680821e-04 1.089588e-04 5.416589e-05 1.506566e-04 7.394861e-06 
               493          494          495          496          497          498 
      1.078358e-04 4.369004e-04 1.389797e-04 1.851909e-04 3.968446e-05 9.550024e-05 
               499          500          501          502          503          504 
      2.157369e-04 2.009640e-05 3.376875e-04 8.289140e-05 4.622619e-05 8.208369e-06 
               505          506          507          508          509          510 
      6.228677e-05 1.671286e-04 2.449013e-04 1.856584e-03 3.054364e-04 4.663127e-05 
               511          512          513          514          515          516 
      1.939552e-04 3.685366e-04 2.287587e-04 2.965637e-04 1.642937e-05 1.235013e-05 
               517          518          519          520          521          522 
      6.029630e-05 4.434471e-05 1.478976e-04 7.988155e-05 2.420267e-04 6.822908e-06 
               523          524          525          526          527          528 
      1.090269e-07 1.228730e-04 3.819233e-05 2.577005e-04 1.215071e-04 1.868012e-04 
               529          530          531          532          533          534 
      2.809068e-04 2.445419e-04 1.036362e-04 2.865567e-04 1.765096e-04 1.827594e-04 
               535          536          537          538          539          540 
      1.460861e-05 9.286292e-05 1.357779e-06 7.536558e-05 1.687793e-04 2.021669e-04 
               541          542          543          544          545          546 
      2.746021e-04 2.575651e-04 1.007058e-04 2.398602e-03 1.202427e-05 3.058435e-03 
               547          548          549          550          551          552 
      1.505220e-02 2.700328e-06 1.089389e-05 2.098202e-04 1.709313e-04 2.896052e-04 
               553          554          555          556          557          558 
      7.491988e-05 4.731740e-05 4.615861e-05 2.581336e-04 1.033448e-05 2.905480e-04 
               559          560          561          562          563          564 
      8.433685e-05 1.292073e-05 1.021561e-04 8.546514e-05 8.994701e-05 3.198313e-04 
               565          566          567          568          569          570 
      4.565867e-05 5.566633e-05 7.608630e-05 4.447655e-04 1.393820e-03 3.129850e-06 
               571          572          573          574          575          576 
      4.645288e-05 7.952887e-05 5.624116e-05 3.492960e-08 4.282361e-05 8.441954e-05 
               577          578          579          580          581          582 
      9.198541e-06 7.483237e-05 9.798835e-04 2.025559e-04 1.792361e-04 8.093239e-06 
               583          584          585          586          587          588 
      2.369990e-05 6.371559e-05 4.621718e-05 1.112140e-04 6.400546e-05 1.581338e-04 
               589          590          591          592          593          594 
      4.261582e-05 6.262431e-04 1.112423e-04 2.990312e-04 6.447264e-05 1.276992e-04 
               595          596          597          598          599          600 
      1.181713e-07 1.196799e-04 4.698375e-04 9.042141e-06 2.239819e-04 2.535749e-04 
               601          602          603          604          605          606 
      2.692523e-05 9.632272e-04 1.972377e-04 4.994588e-05 2.037550e-04 5.686870e-04 
               607          608          609          610          611          612 
      1.941900e-05 1.766219e-04 3.903598e-06 1.193454e-04 2.425163e-04 1.866369e-05 
               613          614          615          616          617          618 
      1.454732e-04 8.679364e-05 1.625017e-04 1.790862e-04 5.103742e-05 4.996664e-04 
               619          620          621          622          623          624 
      5.436967e-05 3.248138e-05 4.924536e-07 2.743837e-05 1.071366e-05 2.496256e-04 
               625          626          627          628          629          630 
      3.120972e-05 4.418685e-06 7.718046e-04 4.088001e-05 2.471601e-05 1.829705e-05 
               631          632          633          634          635          636 
      3.098142e-06 2.158817e-04 1.635825e-04 2.634105e-04 9.139149e-04 1.006875e-05 
               637          638          639          640          641          642 
      9.607837e-05 1.482014e-04 2.195137e-04 2.186515e-06 1.318543e-04 3.052633e-06 
               643          644          645          646          647          648 
      1.426520e-04 8.157092e-05 4.642224e-05 1.545474e-04 1.555091e-04 3.908535e-05 
               649          650          651          652          653          654 
      1.088682e-04 1.029922e-04 2.241261e-04 1.107027e-05 1.984387e-04 1.378898e-04 
               655          656          657          658          659          660 
      2.673593e-04 2.528084e-05 1.117873e-04 2.541957e-05 1.199621e-05 7.702979e-05 
               661          662          663          664          665          666 
      1.248829e-04 3.896341e-05 1.152996e-05 2.129410e-04 2.252768e-04 4.642224e-05 
               667          668          669          670          671          672 
      4.658946e-05 4.584768e-04 2.764142e-02 2.117862e-05 5.937796e-05 2.841463e-04 
               673          674          675          676          677          678 
      1.790542e-04 1.290138e-04 1.563891e-05 2.843829e-04 2.508186e-06 1.869482e-03 
               679          680          681          682          683          684 
      4.975714e-05 5.436967e-05 5.011397e-04 4.682210e-04 1.528750e-04 6.969616e-05 
               685          686          687          688          689          690 
      1.072970e-04 8.938443e-05 9.358107e-05 4.570082e-04 8.070381e-04 1.884670e-05 
               691          692          693          694          695          696 
      1.024211e-04 2.107911e-04 5.792008e-07 1.300158e-04 1.362913e-04 2.375357e-04 
               697          698          699          700          701          702 
      2.337941e-04 5.341167e-05 1.755689e-05 8.412168e-04 1.295708e-03 8.037763e-04 
               703          704          705          706          707          708 
      1.940642e-04 3.615475e-04 3.386041e-04 1.221391e-03 4.454730e-04 4.706821e-04 
               709          710          711          712          713          714 
      5.927353e-07 2.993475e-04 1.118489e-03 9.558194e-04 1.410505e-03 2.655229e-04 
               715          716          717          718          719          720 
      4.706821e-04 4.631397e-04 1.745655e-03 8.903600e-04 1.054946e-03 9.285239e-04 
               721          722          723          724          725          726 
      5.842551e-04 2.991739e-04 2.382184e-03 4.153958e-04 4.527538e-04 1.915377e-04 
               727          728          729          730          731          732 
      4.215833e-04 1.146784e-03 7.528292e-04 5.391197e-04 7.786299e-04 1.906463e-03 
               733          734          735          736          737          738 
      7.260689e-04 2.746117e-04 6.525073e-04 2.270582e-05 1.317040e-03 1.103954e-03 
               739          740          741          742          743          744 
      1.662901e-03 5.258809e-04 2.912212e-04 8.681691e-04 6.388462e-04 8.102263e-07 
               745          746          747          748          749          750 
      2.098139e-04 1.276987e-03 1.685240e-04 7.808637e-04 2.294497e-03 1.764764e-05 
               751          752          753          754          755          756 
      2.258827e-04 1.548105e-03 7.869203e-04 1.256634e-04 7.710725e-04 6.014133e-04 
               757          758          759          760          761          762 
      1.472990e-03 3.733273e-04 8.040536e-04 4.723009e-04 7.083317e-04 8.736851e-04 
               763          764          765          766          767          768 
      3.848528e-04 1.158071e-03 5.277497e-04 1.181961e-04 7.994131e-04 6.369048e-05 
               769          770          771          772          773          774 
      2.009374e-04 1.090600e-03 1.598419e-03 4.365338e-04 1.752473e-03 1.431923e-03 
               775          776          777          778          779          780 
      2.726739e-04 6.554540e-04 5.820227e-05 1.746051e-03 1.875423e-03 4.149691e-04 
               781          782          783          784          785          786 
      4.716215e-03 1.193475e-03 1.919802e-03 1.327061e-03 2.158329e-03 5.586686e-04 
               787          788          789          790          791          792 
      2.432909e-03 1.094636e-03 2.407924e-03 4.550334e-03 2.841098e-03 2.894531e-03 
               793          794          795          796          797          798 
      2.288561e-03 1.694766e-03 4.845292e-04 2.946934e-03 2.105265e-03 1.115473e-03 
               799          800          801          802          803          804 
      4.960987e-03 2.175158e-03 5.147359e-03 2.596446e-03 1.156212e-02 1.601128e-03 
               805          806          807          808          809          810 
      3.387198e-03 1.469306e-03 2.021809e-03 1.544987e-03 3.332031e-03 1.616342e-03 
               811          812          813          814          815          816 
      2.431531e-03 1.890891e-04 3.680907e-03 4.332501e-03 1.263171e-04 1.034551e-03 
               817          818          819          820          821          822 
      2.107909e-03 2.385108e-03 2.142269e-03 1.835225e-03 2.702873e-03 1.032721e-03 
               823          824          825          826          827          828 
      1.671691e-03 3.624334e-03 1.552225e-03 2.354709e-03 1.987383e-03 2.150934e-03 
               829          830          831          832          833          834 
      2.656616e-03 1.368595e-03 2.077675e-03 7.027047e-04 3.759181e-03 2.216673e-03 
               835          836          837          838          839          840 
      4.938984e-04 1.974275e-03 1.897295e-03 2.518552e-03 2.002419e-03 1.806643e-03 
               841          842          843          844          845          846 
      6.175936e-04 2.194483e-03 2.133011e-03 2.844145e-03 2.706678e-03 2.570293e-03 
               847          848          849          850          851          852 
      1.437340e-03 2.355913e-03 3.638924e-03 1.556879e-03 3.967296e-03 3.955335e-03 
               853          854          855          856          857          858 
      5.613379e-03 2.391810e-03 1.446962e-03 4.091111e-03 3.007438e-03 3.669575e-03 
               859          860          861          862          863          864 
      3.815045e-03 1.766000e-03 1.486930e-03 2.521909e-03 3.373191e-03 1.319181e-03 
               865          866          867          868          869          870 
      4.057384e-03 4.964379e-03 6.340696e-03 3.216753e-03 3.532997e-03 3.320316e-03 
               871          872          873          874          875          876 
      7.869776e-03 5.770025e-05 6.075180e-03 3.251521e-03 3.379759e-03 4.763114e-03 
               877          878          879          880          881          882 
      4.868859e-03 7.211335e-03 8.314159e-03 1.910179e-02 6.492048e-03 7.420467e-03 
               883          884          885          886          887          888 
      1.005757e-02 2.902350e-03 6.620896e-03 6.056165e-03 8.788974e-03 3.307384e-03 
               889          890          891          892          893          894 
      6.604344e-03 8.460786e-03 7.313020e-03 1.060797e-02 1.051478e-02 6.940998e-03 
               895          896          897          898          899          900 
      9.879616e-03 1.238013e-02 9.239493e-03 1.021138e-02 9.802470e-03 1.250292e-02 
               901          902          903          904          905          906 
      9.819953e-03 7.621530e-03 1.070862e-02 1.053618e-02 5.057593e-03 9.294081e-03 
               907          908          909          910          911          912 
      1.071615e-02 9.800572e-03 3.095587e-02 2.501890e-02 4.531417e-02 3.955162e-02 
               913          914          915 
      3.394015e-02 1.042656e-01 3.049753e-01 

---

    Code
      round(predict(M_bioChem, type = "link"), 5)
    Output
             1        2        3        4        5        6        7        8 
       0.68177  0.26481  0.28201  0.37992  0.77575 -0.03855  0.20228  0.23307 
             9       10       11       12       13       14       15       16 
       0.51944  0.26748  0.70014  0.42452  0.17669  0.38799  0.27295  0.15190 
            17       18       19       20       21       22       23       24 
       0.44788  0.46871  0.30275  0.36154  0.42583  0.01884  0.46076  0.42160 
            25       26       27       28       29       30       31       32 
      -0.03256  0.34428  0.29861  0.41138  0.12721  0.58099  0.12013  0.72436 
            33       34       35       36       37       38       39       40 
       0.43211  0.34582  0.30929  0.11618  0.11365  0.59016  0.35563  0.41621 
            41       42       43       44       45       46       47       48 
       0.59016  0.16829  0.48767  0.17335  0.49394  0.30585  0.53344  1.13464 
            49       50       51       52       53       54       55       56 
       0.48750  0.49200  0.49394 -0.10432  0.43057  0.72436  0.36616  0.38895 
            57       58       59       60       61       62       63       64 
       0.17780  0.35047  0.35827  0.35452  0.27301  0.31516  0.23264  0.34003 
            65       66       67       68       69       70       71       72 
       0.30522  0.39590  0.77627  0.64858  0.31618  0.10611  0.39539 -0.09815 
            73       74       75       76       77       78       79       80 
       0.29763  0.41735  0.36654  0.25391  0.12582  0.34096  0.44022  0.25186 
            81       82       83       84       85       86       87       88 
       0.16657  0.12580  0.77269  0.65394  0.97488  0.13837  1.00340  0.28437 
            89       90       91       92       93       94       95       96 
       0.99592  0.51681  0.36201  0.28276  0.57189  0.97488  0.48989  0.67165 
            97       98       99      100      101      102      103      104 
       0.56881  0.30538  0.01244  0.72436  0.25732  0.31516  0.29135  0.38586 
           105      106      107      108      109      110      111      112 
       0.14737  0.37516  0.46559  0.26481  0.01125 -0.04088  0.56150  0.11739 
           113      114      115      116      117      118      119      120 
       0.14866  0.63259  0.22488  0.41391  0.59921  0.09109  0.38895  0.37840 
           121      122      123      124      125      126      127      128 
       0.31463  0.35213  0.56224  0.14188  0.16404  0.64379  0.33088  0.56531 
           129      130      131      132      133      134      135      136 
       0.34582  0.39659  0.17082  0.89572  0.39952  0.20745  0.33958  0.89173 
           137      138      139      140      141      142      143      144 
       0.44724  0.23102 -0.03155  0.18523  0.09059  0.30158  0.34986  0.17335 
           145      146      147      148      149      150      151      152 
       0.16555  0.03369  0.50471  0.16555  0.56683  0.12396  0.39559  0.58741 
           153      154      155      156      157      158      159      160 
       0.36700  0.23232  0.40389  0.43971  0.26514  0.29753  0.39644  0.70989 
           161      162      163      164      165      166      167      168 
       0.35500  0.15857  0.34920  0.33938  0.57664  0.25520  0.51988  0.42178 
           169      170      171      172      173      174      175      176 
       0.51341  0.46498  0.34155  0.32293  0.14613  0.36062  0.17722  0.18265 
           177      178      179      180      181      182      183      184 
       0.47951  0.26279  0.06981  0.31516  0.09099  0.78533  0.56800  0.61141 
           185      186      187      188      189      190      191      192 
       0.47087  0.48235  0.22262  0.43560  0.10358  0.32273  0.11406  0.25682 
           193      194      195      196      197      198      199      200 
       0.12124  0.52980  0.45971  0.49529  0.28478 -0.09197  0.72625 -0.11155 
           201      202      203      204      205      206      207      208 
       0.44251  0.44153  0.19341  0.22464  0.32566 -0.07811  0.35531  0.36797 
           209      210      211      212      213      214      215      216 
       0.11658  0.27902  0.16285  0.33007  0.29911  0.17500  0.31585  0.59016 
           217      218      219      220      221      222      223      224 
       0.59759  0.67499  0.42502  0.65826  0.58292  0.42757  0.48228  0.36623 
           225      226      227      228      229      230      231      232 
       0.33932  0.51809  0.36797  0.16029  0.42319  0.60568  0.30771  0.97747 
           233      234      235      236      237      238      239      240 
       0.35968  0.55509  0.56224  0.45573  0.20400  0.74027  0.31516  0.49141 
           241      242      243      244      245      246      247      248 
       0.13935  0.14927  0.46814  0.45952  0.41735  0.35452  0.26413  0.49043 
           249      250      251      252      253      254      255      256 
       0.15797  0.14856  0.83879  0.54078  0.23203  0.60471  0.21341  0.18721 
           257      258      259      260      261      262      263      264 
       0.32839  0.40487  0.45760  0.55839  0.43567  0.38670  0.31516  0.12822 
           265      266      267      268      269      270      271      272 
       0.19715  0.57624  0.13877  1.23203  0.25128  0.46500  0.28094  0.59486 
           273      274      275      276      277      278      279      280 
       0.31169  0.50693  0.52875  0.60791  0.18185  0.65826 -0.06392  0.39280 
           281      282      283      284      285      286      287      288 
       0.27806  0.50471  0.27605  0.26572  0.68247  0.16555  0.60244  0.70915 
           289      290      291      292      293      294      295      296 
       0.46845  0.82271  0.69407  0.56980  0.55408  0.40731  0.36401  0.52616 
           297      298      299      300      301      302      303      304 
       0.89566 -0.04176  0.44204  0.58975  0.48973  0.45405  1.33982  0.36117 
           305      306      307      308      309      310      311      312 
       0.45368  0.50875  0.50709  0.21756  0.65522  0.33358  0.13432  0.73828 
           313      314      315      316      317      318      319      320 
       0.79842  0.69138  0.71370  0.27311  0.81455  0.29152  0.31469  0.44637 
           321      322      323      324      325      326      327      328 
       0.57523  0.71091  0.21746  0.64112  0.67339  0.39978  0.19341  2.21284 
           329      330      331      332      333      334      335      336 
       0.63486  0.41027  0.51610  0.26430  0.72824  0.67499  0.33649  0.33095 
           337      338      339      340      341      342      343      344 
       0.33125  0.36201  0.41472  0.26430  0.20633  0.27634  0.37769  0.31716 
           345      346      347      348      349      350      351      352 
       0.22073  0.34147  0.41460  0.73566  0.15948  0.20400  0.39216  0.53101 
           353      354      355      356      357      358      359      360 
       0.30612  0.32980  0.50791  0.44403  0.18417  0.27629  0.23982  0.52636 
           361      362      363      364      365      366      367      368 
       0.81667  0.57765  0.69658  0.59319  0.12562  0.39851  0.10864  0.17145 
           369      370      371      372      373      374      375      376 
       0.18427  0.46632  0.20512  0.53108  0.20383  0.40636  0.58571  0.36305 
           377      378      379      380      381      382      383      384 
       0.41735  0.60544  0.55489  0.71481  0.97457  0.76665  0.29590  0.32977 
           385      386      387      388      389      390      391      392 
       0.28747  0.58980  0.31585  0.75384  0.17142  0.09290  0.62171  0.58672 
           393      394      395      396      397      398      399      400 
       0.22842  0.69795  0.60568 -0.05933  0.16768  0.39092  0.48989  0.40033 
           401      402      403      404      405      406      407      408 
       1.05531  0.50889  0.63953  0.34863  0.56699  0.35015 -0.04877  1.00972 
           409      410      411      412      413      414      415      416 
       0.57529  0.31034  0.18832  0.47836  0.30893  0.68622  0.12144  0.21756 
           417      418      419      420      421      422      423      424 
       0.36407  0.07750  0.57877  0.81603  0.74595  0.00579  0.14677  0.21736 
           425      426      427      428      429      430      431      432 
       0.21826  0.55242  0.72638  0.53637  0.52687  0.14778  0.45183  0.41391 
           433      434      435      436      437      438      439      440 
       0.60568  0.75653  0.45469  0.59016  0.41360  0.63482  0.50062  0.23975 
           441      442      443      444      445      446      447      448 
       0.68294  0.64985  0.31166  0.71360  0.60022  0.51266  0.35166  0.44022 
           449      450      451      452      453      454      455      456 
       0.62571  0.23436  0.77424  0.22869  0.14603  0.65232  1.45078  0.30993 
           457      458      459      460      461      462      463      464 
       0.38956  0.54821  0.78082  0.29146  0.12920  0.26613  0.30300  0.41937 
           465      466      467      468      469      470      471      472 
       0.55155  0.40834  0.61485  0.37961  0.48200  0.43762  1.08115  0.57927 
           473      474      475      476      477      478      479      480 
       0.35856  0.27254  0.36401  0.41907  0.45124  0.36996  0.18417  0.74595 
           481      482      483      484      485      486      487      488 
       0.74254  0.74254  1.47520  0.51761  0.47014  0.50875  0.55903  0.74547 
           489      490      491      492      493      494      495      496 
       0.44673  0.31686  0.47704  0.11269  0.43658  0.79084  0.39465  0.50177 
           497      498      499      500      501      502      503      504 
       0.30316  0.43567  0.57259  0.21220  0.61094  0.38670  0.37223  0.14360 
           505      506      507      508      509      510      511      512 
       0.30626  0.50471  0.60716  0.96931  0.65418  0.35371  0.52530  0.84817 
           513      514      515      516      517      518      519      520 
       0.54613  0.79930  0.20228  0.17324  0.24009  0.26009  0.51341  0.49465 
           521      522      523      524      525      526      527      528 
       0.54471  0.61620  0.70145  0.33138  0.54764  0.26056  0.33547  0.23203 
           529      530      531      532      533      534      535      536 
       0.16677  0.19287  0.38670  0.18165  0.33182  0.24549  0.58672  0.43894 
           537      538      539      540      541      542      543      544 
       0.65826  0.46281  0.29116  0.26279  1.00377  0.12842  0.37196  1.28393 
           545      546      547      548      549      550      551      552 
       0.60194  1.26993  1.64827  0.74004  0.60346  0.34528  0.25732  0.16606 
           553      554      555      556      557      558      559      560 
       0.36859  0.53172  0.51992  0.12721  0.61485  0.27071  0.41460  0.58545 
           561      562      563      564      565      566      567      568 
       0.92034  0.43495  0.43813  0.26414  0.50966  0.41685  0.49540  0.19968 
           569      570      571      572      573      574      575      576 
       1.07500  0.65275  0.48633  0.41055  0.47294  0.69745  0.52555  0.40438 
           577      578      579      580      581      582      583      584 
       0.62227  0.45225 -0.01316  0.22039  0.22869  0.62716  0.49860  0.48831 
           585      586      587      588      589      590      591      592 
       0.48453  0.38336  0.49141  0.39465  0.44325  1.08643  0.39709  0.16404 
           593      594      595      596      597      598      599      600 
       0.46731  0.39681  0.68294  0.34950  0.12430  0.57306  0.26532  0.98515 
           601      602      603      604      605      606      607      608 
       0.53678  0.13155  0.20400  0.47607  0.19894  1.11936  0.51934  0.29278 
           609      610      611      612      613      614      615      616 
       0.63357  0.42298  1.03771  0.56278  0.32566  0.44750  0.25166  0.31337 
           617      618      619      620      621      622      623      624 
       0.52296  1.01049  0.50127  0.56797  0.67533  0.49263  0.61738  0.26900 
           625      626      627      628      629      630      631      632 
       0.80452  0.63229 -0.02408  0.53519  0.80095  0.78766  0.65081  0.19915 
           633      634      635      636      637      638      639      640 
       0.25449  0.25310  0.13256  0.61110  0.86939  0.27533  0.21817  0.65778 
           641      642      643      644      645      646      647      648 
       0.30275  0.64423  0.94655  0.40383  0.84780  0.27058  0.31631  0.50875 
           649      650      651      652      653      654      655      656 
       0.42150  0.39153  0.23810  0.78729  0.25834  0.31079  0.15099  0.57031 
           657      658      659      660      661      662      663      664 
       0.34717  0.55408  0.76645  0.38922  0.33661  0.50885  0.56629  0.19844 
           665      666      667      668      669      670      671      672 
       0.17062  0.84780  0.48228  0.18363  1.72830  0.56272  0.40258  0.20745 
           673      674      675      676      677      678      679      680 
       0.22697  0.38026  0.60427  0.27132  0.72770  1.10667  0.49028  0.50127 
           681      682      683      684      685      686      687      688 
       1.05464  1.10175  0.35594  0.49200  0.35753  0.44637  0.37509  0.11011 
           689      690      691      692      693      694      695      696 
      -0.04240  0.59350  0.44232  0.19784  0.70969  0.88840  0.30609  0.17142 
           697      698      699      700      701      702      703      704 
       0.28404  0.48797  0.59016  0.43560  0.13389  0.56881  0.91561  0.63816 
           705      706      707      708      709      710      711      712 
       0.65927  0.17568  0.44376  0.64985  1.10859  0.75840  0.21220  0.35035 
           713      714      715      716      717      718      719      720 
       1.44282  0.71091  0.64985  0.60568  0.27071  0.39169  0.45766  0.38622 
           721      722      723      724      725      726      727      728 
       0.65283  0.75589  0.14778  0.44730  0.76496  0.78169  0.46774  0.36423 
           729      730      731      732      733      734      735      736 
       0.54554  0.68581  0.44090  0.19816  0.41088  0.70888  0.53370  1.02020 
           737      738      739      740      741      742      743      744 
       0.30582  0.22019  0.26677  0.56039  0.81667  1.32171  0.55070  1.11329 
           745      746      747      748      749      750      751      752 
       0.80257  0.24012  0.80638  0.57189  0.28987  1.16266  0.82790  0.10880 
           753      754      755      756      757      758      759      760 
       0.42583  0.89717  0.38546  0.50987  0.21594  0.56315  0.50147  0.45398 
           761      762      763      764      765      766      767      768 
       0.52312  0.54845  0.63330  0.17335  0.58842  0.86419  0.59485  0.97457 
           769      770      771      772      773      774      775      776 
       0.67586  0.17932  1.46498  0.65663  0.17985  0.41401  0.71607  0.64720 
           777      778      779      780      781      782      783      784 
       0.97757  0.22437  0.31583  0.44862  0.01783  0.26279  0.15170  0.63553 
           785      786      787      788      789      790      791      792 
       0.69577  1.06998  0.54078  0.74146  0.49819  0.18417  0.44687  0.14006 
           793      794      795      796      797      798      799      800 
       0.57624  0.32386  1.52382  0.49394  0.41267  0.87750  1.73104  0.41409 
           801      802      803      804      805      806      807      808 
       0.17115  0.50362  1.77966  0.58328  0.49350  0.61732  0.53188  0.74864 
           809      810      811      812      813      814      815      816 
       0.44605  0.81568  0.35176  1.47303  0.20745  0.18956  1.26748  0.78072 
           817      818      819      820      821      822      823      824 
       0.61877  0.36811  0.39736  0.48461  0.66874  1.08768  0.62656  0.36654 
           825      826      827      828      829      830      831      832 
       0.63294  0.27311  0.40130  0.32531  0.31692  0.83703  0.53471  0.83815 
           833      834      835      836      837      838      839      840 
       0.21675  0.40215  1.05285  0.46076  0.45992  0.20228  0.68965  0.67408 
           841      842      843      844      845      846      847      848 
       0.93720  0.38809  0.35445  0.37159  0.20795  0.53670  0.64352  0.59743 
           849      850      851      852      853      854      855      856 
       0.27860  0.72391  0.67270  0.45482  0.51364  0.44922  0.99234  0.67549 
           857      858      859      860      861      862      863      864 
       0.82271  0.63012  0.47789  0.93720  0.84867  0.42261  0.85033  1.26748 
           865      866      867      868      869      870      871      872 
       0.42123  0.67108  0.12893  0.60750  0.32903  0.87627  0.30158  1.64827 
           873      874      875      876      877      878      879      880 
       0.54548  0.75637  0.58328  0.27017  0.20663  0.53816  1.16482  0.83268 
           881      882      883      884      885      886      887      888 
       0.74956  0.89074  0.40133  0.64480  0.81234  0.70459  0.43813  0.72787 
           889      890      891      892      893      894      895      896 
       0.35000  0.51219  0.50780  0.32293  0.44325  0.27766  0.54447  0.49839 
           897      898      899      900      901      902      903      904 
       0.85281  0.31385  0.35000  0.74162  1.40737  0.74298  0.83754  0.83703 
           905      906      907      908      909      910      911      912 
       0.99679  0.83096  0.78041  0.89167  1.47303  0.73553  0.30612  1.20137 
           913      914      915 
       0.43617  1.01950  1.53914 

---

    Code
      predict(M_bioChem, type = "response")
    Output
        [1] 1.9773678 1.3031830 1.3257927 1.4621622 2.1722313 0.9621813 1.2241940
        [8] 1.2624707 1.6810798 1.3066714 2.0140305 1.5288522 1.1932609 1.4740089
       [15] 1.3138303 1.1640397 1.5649942 1.5979360 1.3535783 1.4355326 1.5308538
       [22] 1.0190190 1.5852753 1.5244016 0.9679666 1.4109687 1.3479813 1.5089042
       [29] 1.1356546 1.7878147 1.1276395 2.0634160 1.5404982 1.4131416 1.3624640
       [36] 1.1231986 1.1203610 1.8042752 1.4270849 1.5162109 1.8042752 1.1832818
       [43] 1.6285115 1.1892832 1.6387580 1.3577849 1.7047882 3.1100404 1.6282431
       [50] 1.6355778 1.6387596 0.9009386 1.5381316 2.0634160 1.4421812 1.4754368
       [57] 1.1945838 1.4197412 1.4308455 1.4254918 1.3139073 1.3704831 1.2619222
       [64] 1.4049868 1.3569270 1.4857251 2.1733436 1.9128229 1.3718705 1.1119475
       [71] 1.4849663 0.9065165 1.3466688 1.5179313 1.4427275 1.2890597 1.1340810
       [78] 1.4063020 1.5530462 1.2864153 1.1812424 1.1340526 2.1655770 1.9231082
       [85] 2.6508399 1.1483982 2.7275496 1.3289213 2.7072199 1.6766697 1.4362122
       [92] 1.3267885 1.7716082 2.6508399 1.6321406 1.9574614 1.7661654 1.3571438
       [99] 1.0125187 2.0634160 1.2934632 1.3704831 1.3382303 1.4708802 1.1587863
      [106] 1.4552268 1.5929519 1.3031830 1.0113153 0.9599448 1.7533086 1.1245632
      [113] 1.1602826 1.8824883 1.2521662 1.5127258 1.8206720 1.0953714 1.4754368
      [120] 1.4599462 1.3697557 1.4220878 1.7545947 1.1524378 1.1782593 1.9036763
      [127] 1.3921982 1.7599967 1.4131416 1.4867391 1.1862729 2.4490941 1.4911095
      [134] 1.2305336 1.4043571 2.4393570 1.5639855 1.2598809 0.9689465 1.2034996
      [141] 1.0948174 1.3519947 1.4188725 1.1892832 1.1800478 1.0342619 1.6564991
      [148] 1.1800478 1.7626700 1.1319748 1.4852669 1.7993150 1.4433961 1.2615294
      [155] 1.4976412 1.5522607 1.3036189 1.3465325 1.4865254 2.0337755 1.4261831
      [162] 1.1718391 1.4179267 1.4040729 1.7800443 1.2907178 1.6818217 1.5246705
      [169] 1.6709762 1.5919851 1.4071208 1.3811677 1.1573456 1.4342245 1.1938945
      [176] 1.2003997 1.6152799 1.3005498 1.0723031 1.3704831 1.0952605 2.1931382
      [183] 1.7647363 1.8430281 1.6013873 1.6198706 1.2493446 1.5458866 1.1091383
      [190] 1.3808868 1.1208145 1.2928154 1.1288953 1.6985897 1.5836109 1.6409766
      [197] 1.3294761 0.9121288 2.0673067 0.8944443 1.5566060 1.5550904 1.2133798
      [204] 1.2518754 1.3849447 0.9248597 1.4266161 1.4448045 1.1236445 1.3218307
      [211] 1.1768648 1.3910649 1.3486634 1.1912411 1.3714199 1.8042752 1.8177269
      [218] 1.9640102 1.5296167 1.9314207 1.7912550 1.5335215 1.6197677 1.4422911
      [225] 1.4039921 1.6788134 1.4448045 1.1738565 1.5268318 1.8325002 1.3603111
      [232] 2.6577200 1.4328667 1.7421024 1.7545947 1.5773255 1.2263016 2.0965061
      [239] 1.3704831 1.6346196 1.1495275 1.1609815 1.5970263 1.5833106 1.5179313
      [246] 1.4254918 1.3023005 1.6330262 1.1711268 1.1601595 2.3135747 1.7173537
      [253] 1.2611563 1.8307157 1.2378954 1.2058777 1.3887334 1.4991067 1.5802697
      [260] 1.7478546 1.5459910 1.4721096 1.3704831 1.1368043 1.2179308 1.7793347
      [267] 1.1488642 3.4281702 1.2856730 1.5920170 1.3243742 1.8127697 1.3657251
      [274] 1.6601906 1.6968081 1.8365839 1.1994331 1.9314207 0.9380774 1.4811279
      [281] 1.3205713 1.6564991 1.3179081 1.3043702 1.9787588 1.1800478 1.8265765
      [288] 2.0322570 1.5975111 2.2766544 2.0018406 1.7679161 1.7403406 1.5027705
      [295] 1.4390841 1.6924138 2.4489409 0.9590960 1.5558712 1.8035433 1.6318699
      [302] 1.5746833 3.8183646 1.4350128 1.5740870 1.6632170 1.6604559 1.2430401
      [309] 1.9255574 1.3959544 1.1437609 2.0923384 2.2220374 1.9964641 2.0415212
      [316] 1.3140403 2.2581544 1.3384611 1.3698347 1.5626223 1.7775335 2.0358344
      [323] 1.2429143 1.8986034 1.9608801 1.4914972 1.2133798 9.1416541 1.8867542
      [330] 1.5072242 1.6754760 1.3025238 2.0714405 1.9640102 1.4000201 1.3922854
      [337] 1.3927080 1.4362122 1.5139508 1.3025238 1.2291587 1.3183018 1.4589125
      [344] 1.3732236 1.2469824 1.4070136 1.5137583 2.0868516 1.1729055 1.2263003
      [351] 1.4801734 1.7006534 1.3581460 1.3906843 1.6618070 1.5589703 1.2022217
      [358] 1.3182245 1.2710252 1.6927564 2.2629600 1.7818463 2.0068705 1.8097585
      [365] 1.1338515 1.4896001 1.1147637 1.1870287 1.2023446 1.5941141 1.2276672
      [372] 1.7007614 1.2260901 1.5013373 1.7962675 1.4377116 1.5179313 1.8320514
      [379] 1.7417516 2.0438048 2.6500381 2.1525530 1.3443387 1.3906427 1.3330563
      [386] 1.8036219 1.3714199 2.1251494 1.1869933 1.0973543 1.8621011 1.7980877
      [393] 1.2566084 2.0096379 1.8325002 0.9423937 1.1825578 1.4783389 1.6321406
      [400] 1.4923170 2.8728587 1.6634477 1.8955962 1.4171210 1.7629499 1.4192748
      [407] 0.9523986 2.7448308 1.7776464 1.3638944 1.2072206 1.6134305 1.3619638
      [414] 1.9861906 1.1291238 1.2430401 1.4391685 1.0805796 1.7838413 2.2615016
      [421] 2.1084456 1.0058048 1.1580831 1.2427947 1.2439112 1.7374600 2.0675833
      [428] 1.7097875 1.6936147 1.1592566 1.5711820 1.5127258 1.8325002 2.1308724
      [435] 1.5756805 1.8042752 1.5122593 1.8866834 1.6497382 1.2709297 1.9796956
      [442] 1.9152591 1.3656896 2.0413168 1.8225151 1.6697285 1.4214291 1.5530462
      [449] 1.8695806 1.2640946 2.1689500 1.2569523 1.1572285 1.9199877 4.2664256
      [456] 1.3633358 1.4763343 1.7301573 2.1832595 1.3383827 1.1379167 1.3048996
      [463] 1.3539098 1.5210046 1.7359457 1.5043235 1.8493721 1.4617199 1.6193102
      [470] 1.5490165 2.9480690 1.7847332 1.4312728 1.3132987 1.4390841 1.5205505
      [477] 1.5702615 1.4476824 1.2022217 2.1084456 2.1012572 2.1012572 4.3719000
      [484] 1.6780192 1.6002198 1.6632170 1.7489817 2.1074215 1.5631945 1.3728082
      [491] 1.6113017 1.1192846 1.5474011 2.2052390 1.4838664 1.6516456 1.3541262
      [498] 1.5459910 1.7728545 1.2363981 1.8421579 1.4721096 1.4509631 1.1544275
      [505] 1.3583346 1.6564991 1.8352126 2.6361158 1.9235696 1.4243454 1.6909725
      [512] 2.3353576 1.7265498 2.2239758 1.2241940 1.1891570 1.2713633 1.2970404
      [519] 1.6709762 1.6399271 1.7241058 1.8518851 2.0166814 1.3928959 1.7291739
      [526] 1.2976567 1.3986042 1.2611563 1.1814814 1.2127286 1.4721096 1.1991904
      [533] 1.3935014 1.2782412 1.7980877 1.5510569 1.9314207 1.5885384 1.3379778
      [540] 1.3005498 2.7285513 1.1370343 1.4505772 3.6108046 1.8256527 3.5606171
      [547] 5.1980010 2.0960297 1.8284256 1.4123806 1.2934632 1.1806449 1.4456875
      [554] 1.7018582 1.6818933 1.1356546 1.8493721 1.3108924 1.5137583 1.7957918
      [561] 2.5101509 1.5448904 1.5498019 1.3023157 1.6647239 1.5171695 1.6411508
      [568] 1.2210155 2.9300023 1.9208224 1.6263366 1.5076441 1.6046993 2.0086214
      [575] 1.6913867 1.4983675 1.8631600 1.5718511 0.9869283 1.2465667 1.2569523
      [582] 1.8722774 1.6464112 1.6295616 1.6234178 1.4672009 1.6346196 1.4838664
      [589] 1.5577676 2.9636834 1.4874915 1.1782593 1.5956942 1.4870713 1.9796956
      [596] 1.4183586 1.1323611 1.7736938 1.3038437 2.6782256 1.7104900 1.1405976
      [603] 1.2263016 1.6097326 1.2201133 3.0628883 1.6809162 1.3401456 1.8843231
      [610] 1.5265035 2.8227401 1.7555504 1.3849447 1.5643939 1.2861550 1.3680340
      [617] 1.6870081 2.7469338 1.6508103 1.7646768 1.9646783 1.6366119 1.8540561
      [624] 1.3086560 2.2356215 1.8819170 0.9762033 1.7077656 2.2276652 2.1982393
      [631] 1.9170875 1.2203662 1.2898039 1.2880167 1.1417510 1.8424616 2.3854483
      [638] 1.3169686 1.2437950 1.9305068 1.3535783 1.9045206 2.5767987 1.4975459
      [645] 2.3345028 1.3107270 1.3720541 1.6632170 1.5242399 1.4792381 1.2688359
      [652] 2.1974433 1.2947777 1.3644993 1.1629859 1.7688107 1.4150547 1.7403406
      [659] 2.1521045 1.4758365 1.4001967 1.6633852 1.7617103 1.2195022 1.1860387
      [666] 2.3345028 1.6197677 1.2015743 5.6310761 1.7554387 1.4956799 1.2305336
      [673] 1.2547921 1.4626625 1.8299081 1.3116884 2.0703172 3.0242767 1.6327669
      [680] 1.6508103 2.8709469 3.0094363 1.4275181 1.6355761 1.4297953 1.5626223
      [687] 1.4551271 1.1164004 0.9584890 1.8103097 1.5563092 1.2187621 2.0333538
      [694] 2.4312256 1.3581054 1.1869933 1.3284848 1.6290139 1.8042752 1.5458866
      [701] 1.1432639 1.7661654 2.4983044 1.8929935 1.9333740 1.1920541 1.5585559
      [708] 1.9152591 3.0300847 2.1348476 1.2363981 1.4195606 4.2326222 2.0358344
      [715] 1.9152591 1.8325002 1.3108924 1.4794730 1.5803701 1.4714130 1.9209709
      [722] 2.1294992 1.1592566 1.5640850 2.1489071 2.1851663 1.5963801 1.4394057
      [729] 1.7255383 1.9853769 1.5541078 1.2191625 1.5081395 2.0317188 1.7052332
      [736] 2.7737626 1.3577338 1.2463145 1.3057462 1.7513582 2.2629600 3.7498344
      [743] 1.7344655 3.0443502 2.2312722 1.2714049 2.2397834 1.7716082 1.3362510
      [750] 3.1984359 2.2885165 1.1149384 1.5308538 2.4526606 1.4702850 1.6650691
      [757] 1.2410306 1.7561932 1.6511444 1.5745649 1.6872861 1.7305742 1.8838221
      [764] 1.1892832 1.8011365 2.3730814 1.8127678 2.6500381 1.9657235 1.1963982
      [771] 4.3274541 1.9282870 1.1970394 1.5128699 2.0463669 1.9101889 2.6579785
      [778] 1.2515329 1.3714011 1.5661437 1.0179885 1.3005498 1.1638087 1.8880201
      [785] 2.0052467 2.9153326 1.7173537 2.0990009 1.6457369 1.2022217 1.5634131
      [792] 1.1503465 1.7793347 1.3824605 4.5897305 1.6387596 1.5108510 2.4048839
      [799] 5.6465027 1.5129927 1.1866685 1.6546976 5.9278696 1.7919108 1.6380396
      [806] 1.8539474 1.7021303 2.1141320 1.5621267 2.2607190 1.4215729 4.3624518
      [813] 1.2305336 1.2087234 3.5518964 2.1830386 1.8566452 1.4450035 1.4878871
      [820] 1.6235415 1.9517766 2.9673924 1.8711648 1.4427275 1.8831305 1.3140403
      [827] 1.4937626 1.3844654 1.3728873 2.3095003 1.7069594 2.3120812 1.2420356
      [834] 1.4950359 2.8657974 1.5852753 1.5839515 1.2241940 1.9930231 1.9622206
      [841] 2.5528247 1.4741580 1.4254011 1.4500448 1.2311502 1.7103595 1.9031721
      [848] 1.8174510 1.3212791 2.0624911 1.9595165 1.5758913 1.6713559 1.5670948
      [855] 2.6975454 1.9650041 2.2766544 1.8778426 1.6126670 2.5528247 2.3365393
      [862] 1.5259448 2.3404155 3.5518964 1.5238345 1.9563488 1.1376153 1.8358407
      [869] 1.3896128 2.4019152 1.3519947 5.1980010 1.7254371 2.1305319 1.7919108
      [876] 1.3101902 1.2295319 1.7128502 3.2053563 2.2994804 2.1160602 2.4369209
      [883] 1.4938073 1.9056035 2.2531831 2.0230169 1.5498019 2.0706561 1.4190694
      [890] 1.6689402 1.6616323 1.3811677 1.5577599 1.3200369 1.7236939 1.6460699
      [897] 2.3462409 1.3686816 1.4190694 2.0993363 4.0851838 2.1021890 2.3106689
      [904] 2.3095003 2.7095816 2.2955220 2.1823761 2.4392020 4.3624518 2.0865862
      [911] 1.3581460 3.3246841 1.5467734 2.7717959 4.6605862

---

    Code
      predict(M_bioChem, se.fit = TRUE)
    Output
      $fit
                 1            2            3            4            5            6 
       0.681766543  0.264809696  0.282010514  0.379916296  0.775754884 -0.038552333 
                 7            8            9           10           11           12 
       0.202282707  0.233070702  0.519436301  0.267482974  0.700137959  0.424517251 
                13           14           15           16           17           18 
       0.176689781  0.387985824  0.272946763  0.151896456  0.447882100  0.468712777 
                19           20           21           22           23           24 
       0.302751661  0.361535958  0.425825594  0.018840402  0.460758110  0.421601969 
                25           26           27           28           29           30 
      -0.032557661  0.344276524  0.298608153  0.411383673  0.127209238  0.580994043 
                31           32           33           34           35           36 
       0.120126550  0.724362847  0.432105847  0.345815308  0.309294805  0.116180479 
                37           38           39           40           41           42 
       0.113650947  0.590158975  0.355633804  0.416214386  0.590158975  0.168291733 
                43           44           45           46           47           48 
       0.487666395  0.173350797  0.493938619  0.305854641  0.533440870  1.134635703 
                49           50           51           52           53           54 
       0.487501582  0.491996124  0.493939633 -0.104318136  0.430568450  0.724362847 
                55           56           57           58           59           60 
       0.366156656  0.388954057  0.177797851  0.350474572  0.358265530  0.354516899 
                61           62           63           64           65           66 
       0.273005379  0.315163318  0.232636077  0.340027923  0.305222577  0.395902938 
                67           68           69           70           71           72 
       0.776266816  0.648580097  0.316175132  0.106112942  0.395392108 -0.098146079 
                73           74           75           76           77           78 
       0.297633981  0.417348445  0.366535392  0.253913031  0.125822599  0.340963532 
                79           80           81           82           83           84 
       0.440218312  0.251859507  0.166566728  0.125797624  0.772686819  0.653942706 
                85           86           87           88           89           90 
       0.974876546  0.138368066  1.003403639  0.284367584  0.995922251  0.516809499 
                91           92           93           94           95           96 
       0.362009236  0.282761347  0.571887728  0.974876546  0.489892381  0.671648415 
                97           98           99          100          101          102 
       0.568810738  0.305382374  0.012441005  0.724362847  0.257323295  0.315163318 
               103          104          105          106          107          108 
       0.291348078  0.385861017  0.147373199  0.375161791  0.465588823  0.264809696 
               109          110          111          112          113          114 
       0.011251806 -0.040879503  0.561504622  0.117394654  0.148663578  0.632594468 
               115          116          117          118          119          120 
       0.224875019  0.413913205  0.599205660  0.091093459  0.388954057  0.378399591 
               121          122          123          124          125          126 
       0.314632436  0.352126098  0.562237865  0.141879510  0.164038210  0.643786935 
               127          128          129          130          131          132 
       0.330883967  0.565311959  0.345815308  0.396585218  0.170816343  0.895718184 
               133          134          135          136          137          138 
       0.399520488  0.207447875  0.339579620  0.891734473  0.447237370  0.231017175 
               139          140          141          142          143          144 
      -0.031545849  0.185233662  0.090587553  0.301581063  0.349862560  0.173350797 
               145          146          147          148          149          150 
       0.165554916  0.033688061  0.504706399  0.165554916  0.566829677  0.123963695 
               151          152          153          154          155          156 
       0.395594472  0.587406014  0.366998735  0.232324791  0.403891336  0.439712406 
               157          158          159          160          161          162 
       0.265144154  0.297532800  0.396441472  0.709893924  0.355001739  0.158574421 
               163          164          165          166          167          168 
       0.349195753  0.339377258  0.576638235  0.255198488  0.519877564  0.421778344 
               169          170          171          172          173          174 
       0.513407990  0.464981736  0.341545643  0.322929300  0.146129124  0.360624314 
               175          176          177          178          179          180 
       0.177220662  0.182654553  0.479508262  0.262787084  0.069808762  0.315163318 
               181          182          183          184          185          186 
       0.090992277  0.785333465  0.568001288  0.611409940  0.470870302  0.482346260 
               187          188          189          190          191          192 
       0.222619130  0.435597613  0.103583411  0.322725926  0.114055672  0.256822312 
               193          194          195          196          197          198 
       0.121239543  0.529798345  0.459707645  0.495291527  0.284784973 -0.091974020 
               199          200          201          202          203          204 
       0.726246638 -0.111552597  0.442507839  0.441533669  0.193409668  0.224642756 
               205          206          207          208          209          210 
       0.325660181 -0.078113200  0.355305282  0.367974008  0.116577462  0.279017641 
               211          212          213          214          215          216 
       0.162853933  0.330069593  0.299114059  0.174995687  0.315846611  0.590158975 
               217          218          219          220          221          222 
       0.597586760  0.674988410  0.425017156  0.658255858  0.582916488  0.427566741 
               223          224          225          226          227          228 
       0.482282721  0.366232862  0.339319655  0.518087214  0.367974008  0.160294504 
               229          230          231          232          233          234 
       0.423194881  0.605681261  0.307713456  0.977468605  0.359677144  0.555092650 
               235          236          237          238          239          240 
       0.562237865  0.455730662  0.204002787  0.740272181  0.315163318  0.491410101 
               241          242          243          244          245          246 
       0.139350991  0.149265743  0.468143330  0.459517947  0.417348445  0.354516899 
               247          248          249          250          251          252 
       0.264132339  0.490434828  0.157966321  0.148557475  0.838793808  0.540784538 
               253          254          255          256          257          258 
       0.232028990  0.604707000  0.213412647  0.187207708  0.328392078  0.404869417 
               259          260          261          262          263          264 
       0.457595503  0.558389067  0.435665154  0.386696455  0.315163318  0.128221052 
               265          266          267          268          269          270 
       0.197153374  0.576239536  0.138773804  1.232026656  0.251282318  0.465001788 
               271          272          273          274          275          276 
       0.280940083  0.594855879  0.311685515  0.506932387  0.528748890  0.607907250 
               277          278          279          280          281          282 
       0.181849012  0.658255858 -0.063922845  0.392803869  0.278064443  0.504706399 
               283          284          285          286          287          288 
       0.276045742  0.265720329  0.682469798  0.165554916  0.602443461  0.709147002 
               289          290          291          292          293          294 
       0.468446874  0.822706996  0.694067081  0.569801486  0.554080836  0.407310433 
               295          296          297          298          299          300 
       0.364006873  0.526155817  0.895655657 -0.041764145  0.442035664  0.589753237 
               301          302          303          304          305          306 
       0.489726557  0.454054157  1.339822216  0.361173798  0.453675421  0.508753651 
               307          308          309          310          311          312 
       0.507092187  0.217560066  0.655215498  0.333578312  0.134321828  0.738282286 
               313          314          315          316          317          318 
       0.798424503  0.691377661  0.713695237  0.273106560  0.814547851  0.291520541 
               319          320          321          322          323          324 
       0.314690039  0.446365393  0.575226711  0.710905738  0.217458885  0.641118582 
               325          326          327          328          329          330 
       0.673393383  0.399780455  0.193409668  2.212841344  0.634858009  0.410269667 
               331          332          333          334          335          336 
       0.516097319  0.264303790  0.728244273  0.674988410  0.336486580  0.330946585 
               337          338          339          340          341          342 
       0.331250039  0.362009236  0.414722655  0.264303790  0.206329957  0.276344363 
               343          344          345          346          347          348 
       0.377691323  0.317160955  0.220726586  0.341469438  0.414595485  0.735656495 
               349          350          351          352          353          354 
       0.159484040  0.204001776  0.392159232  0.531012519  0.306120543  0.329795950 
               355          356          357          358          359          360 
       0.507905547  0.444025559  0.184171258  0.276285744  0.239823857  0.526358180 
               361          362          363          364          365          366 
       0.816673671  0.577650049  0.696576559  0.593193402  0.125620237  0.398507663 
               367          368          369          370          371          372 
       0.108642474  0.171453330  0.184273451  0.466318158  0.205115783  0.531076060 
               373          374          375          376          377          378 
       0.203830325  0.406356225  0.585710910  0.363052665  0.417348445  0.605436334 
               379          380          381          382          383          384 
       0.554891299  0.714813153  0.974574014  0.766654594  0.295902248  0.329766049 
               385          386          387          388          389          390 
       0.287474302  0.589796815  0.315846611  0.753842125  0.171423430  0.092902058 
               391          392          393          394          395          396 
       0.621705454  0.586723735  0.228416363  0.697954534  0.605681261 -0.059332134 
               397          398          399          400          401          402 
       0.167679724  0.390919067  0.489892381  0.400329937  1.055307608  0.508892384 
               403          404          405          406          407          408 
       0.639533412  0.348627320  0.566988463  0.350146051 -0.048771642  1.009719442 
               409          410          411          412          413          414 
       0.575290252  0.310344169  0.188320703  0.478362639  0.308927630  0.686218520 
               415          416          417          418          419          420 
       0.121441905  0.217560066  0.364065490  0.077497526  0.578769068  0.816029031 
               421          422          423          424          425          426 
       0.745950996  0.005788017  0.146766111  0.217362627  0.218260595  0.552424295 
               427          428          429          430          431          432 
       0.726380447  0.536369100  0.526865099  0.147778937  0.451828171  0.413913205 
               433          434          435          436          437          438 
       0.605681261  0.756531454  0.454687235  0.590158975  0.413604739  0.634820457 
               439          440          441          442          443          444 
       0.500616584  0.239748664  0.682943077  0.649852889  0.311659526  0.713595067 
               445          446          447          448          449          450 
       0.600217473  0.512661066  0.351662758  0.440218312  0.625714142  0.234356159 
               451          452          453          454          455          456 
       0.774243192  0.228690006  0.146027943  0.652318791  1.450776383  0.309934520 
               457          458          459          460          461          462 
       0.389562158  0.548212323  0.780818961  0.291461924  0.129199133  0.266126065 
               463          464          465          466          467          468 
       0.302996589  0.419371058  0.551552317  0.408343313  0.614846193  0.379613765 
               469          470          471          472          473          474 
       0.482000241  0.437620226  1.081150385  0.579268948  0.358564149  0.272542038 
               475          476          477          478          479          480 
       0.364006873  0.419072437  0.451242147  0.369963903  0.184171258  0.745950996 
               481          482          483          484          485          486 
       0.742535809  0.742535809  1.475197698  0.517614026  0.470140968  0.508753651 
               487          488          489          490          491          492 
       0.559033706  0.745465144  0.446731464  0.316858425  0.477042359  0.112689725 
               493          494          495          496          497          498 
       0.436576800  0.790835907  0.394651122  0.501772142  0.303156389  0.435665154 
               499          500          501          502          503          504 
       0.572590985  0.212202382  0.610937675  0.386696455  0.372227532  0.143604515 
               505          506          507          508          509          510 
       0.306259367  0.504706399  0.607160327  0.969306561  0.654182618  0.353712372 
               511          512          513          514          515          516 
       0.525303803  0.848165011  0.546125068  0.799296480  0.202282707  0.173244693 
               517          518          519          520          521          522 
       0.240089760  0.260085090  0.513407990  0.494651813  0.544708529  0.616204114 
               523          524          525          526          527          528 
       0.701453314  0.331384951  0.547643799  0.260560083  0.335474765  0.232028990 
               529          530          531          532          533          534 
       0.166769091  0.192872848  0.386696455  0.181646650  0.331819576  0.245485085 
               535          536          537          538          539          540 
       0.586723735  0.438936595  0.658255858  0.462814364  0.291159392  0.262787084 
               541          542          543          544          545          546 
       1.003770814  0.128423414  0.371961540  1.283930625  0.601937555  1.269933880 
               547          548          549          550          551          552 
       1.648274131  0.740044933  0.603455273  0.345276685  0.257323295  0.166060822 
               553          554          555          556          557          558 
       0.368585007  0.531720697  0.519920129  0.127209238  0.614846193  0.270708110 
               559          560          561          562          563          564 
       0.414595485  0.585446020  0.920342875  0.434952974  0.438127145  0.264143993 
               565          566          567          568          569          570 
       0.509659269  0.416846451  0.495397722  0.199682905  1.075003213  0.652753417 
               571          572          573          574          575          576 
       0.486329971  0.410548235  0.472936403  0.697448628  0.525548730  0.404376176 
               577          578          579          580          581          582 
       0.622273978  0.452253959 -0.013157857  0.220393142  0.228690006  0.627155565 
               583          584          585          586          587          588 
       0.498597883  0.488311032  0.484533685  0.383356460  0.491410101  0.394651122 
               589          590          591          592          593          594 
       0.443253749  1.086432877  0.397091125  0.164038210  0.467308905  0.396808647 
               595          596          597          598          599          600 
       0.682943077  0.349500310  0.124304881  0.573064264  0.265316616  0.985154471 
               601          602          603          604          605          606 
       0.536779851  0.131552293  0.204002787  0.476068099  0.198943724  1.119358343 
               607          608          609          610          611          612 
       0.519339031  0.292778293  0.633568640  0.422979854  1.037708092  0.562782427 
               613          614          615          616          617          618 
       0.325660181  0.447498441  0.251657144  0.313374684  0.522956580  1.010485316 
               619          620          621          622          623          624 
       0.501266237  0.567967560  0.675328493  0.492628187  0.617375725  0.269000693 
               625          626          627          628          629          630 
       0.804519253  0.632290925 -0.024084423  0.535185837  0.800954035  0.787656723 
               631          632          633          634          635          636 
       0.650807100  0.199151011  0.254490220  0.253103581  0.132563092  0.611102487 
               637          638          639          640          641          642 
       0.869387089  0.275332549  0.218167154  0.657782580  0.302751661  0.644230316 
               643          644          645          646          647          648 
       0.946547814  0.403827705  0.847798940  0.270581953  0.316308941  0.508753651 
               649          650          651          652          653          654 
       0.421495865  0.391527167  0.238099865  0.787294563  0.258339019  0.310787547 
               655          656          657          658          659          660 
       0.150990748  0.570307394  0.347168216  0.554080836  0.766446206  0.389224973 
               661          662          663          664          665          666 
       0.336612736  0.508854832  0.566285117  0.198442743  0.170618903  0.847798940 
               667          668          669          670          671          672 
       0.482282721  0.183632633  1.728300559  0.562718796  0.402580904  0.207447875 
               673          674          675          676          677          678 
       0.226969926  0.380258404  0.604265736  0.271315198  0.727701828  1.106671940 
               679          680          681          682          683          684 
       0.490276042  0.501266237  1.054641905  1.101752801  0.355937347  0.491995111 
               685          686          687          688          689          690 
       0.357531271  0.446365393  0.375093237  0.110109603 -0.042397220  0.593497956 
               691          692          693          694          695          696 
       0.442317130  0.197835653  0.709686549  0.888395492  0.306090645  0.171423430 
               697          698          699          700          701          702 
       0.284039062  0.487974861  0.590158975  0.435597613  0.133887203  0.568810738 
               703          704          705          706          707          708 
       0.915612243  0.638159438  0.659266659  0.175677966  0.443759655  0.649852889 
               709          710          711          712          713          714 
       1.108590564  0.758395283  0.212202382  0.350347400  1.442821716  0.710905738 
               715          716          717          718          719          720 
       0.649852889  0.605681261  0.270708110  0.391685954  0.457659041  0.386223176 
               721          722          723          724          725          726 
       0.652830723  0.755886815  0.147778937  0.447301001  0.764959400  0.781691951 
               727          728          729          730          731          732 
       0.467738606  0.364230302  0.545539045  0.685808780  0.440901604  0.198164175 
               733          734          735          736          737          738 
       0.410876754  0.708882112  0.533701848  1.020204745  0.305817000  0.220190780 
               739          740          741          742          743          744 
       0.266774705  0.560391626  0.816673671  1.321711689  0.550699290  1.113287468 
               745          746          747          748          749          750 
       0.802571923  0.240122478  0.806379170  0.571887728  0.289867910  1.162661905 
               751          752          753          754          755          756 
       0.827903780  0.108799170  0.425825594  0.897173377  0.385456292  0.509866644 
               757          758          759          760          761          762 
       0.215942179  0.563148498  0.501468599  0.453978964  0.523121393  0.548453248 
               763          764          765          766          767          768 
       0.633302737  0.173350797  0.588417828  0.864189294  0.594854866  0.974574014 
               769          770          771          772          773          774 
       0.675860387  0.179315569  1.464979403  0.656632035  0.179851375  0.414008451 
               775          776          777          778          779          780 
       0.716065983  0.647202122  0.977565875  0.224369111  0.315832934  0.448616357 
               781          782          783          784          785          786 
       0.017828588  0.262787084  0.151698005  0.635528725  0.695767110  1.069983906 
               787          788          789          790          791          792 
       0.540784538  0.741461470  0.498188234  0.184171258  0.446871301  0.140063171 
               793          794          795          796          797          798 
       0.576239536  0.323864909  1.523821302  0.493939633  0.412673042  0.877501646 
               799          800          801          802          803          804 
       1.731036364  0.414089579  0.171149786  0.503618291  1.779664891  0.583282559 
               805          806          807          808          809          810 
       0.493500165  0.617317109  0.531880587  0.748644328  0.446048171  0.815682923 
               811          812          813          814          815          816 
       0.351763939  1.473034239  0.207447875  0.189564778  1.267481654  0.780717779 
               817          818          819          820          821          822 
       0.618771198  0.368111728  0.397357027  0.484609891  0.668740057  1.087683590 
               823          824          825          826          827          828 
       0.626561143  0.366535392  0.632935564  0.273106560  0.401298173  0.325314075 
               829          830          831          832          833          834 
       0.316916028  0.837031160  0.534713662  0.838148065  0.216751628  0.402150188 
               835          836          837          838          839          840 
       1.052846630  0.460758110  0.459922672  0.202282707  0.689652656  0.674076766 
               841          842          843          844          845          846 
       0.937200482  0.388087005  0.354453268  0.371594456  0.207948858  0.536703557 
               847          848          849          850          851          852 
       0.643522045  0.597434988  0.278600249  0.723914544  0.672697779  0.454821043 
               853          854          855          856          857          858 
       0.513635238  0.449223446  0.992342254  0.675494318  0.822706996  0.630123553 
               859          860          861          862          863          864 
       0.477889361  0.937200482  0.848670917  0.422613783  0.850328472  1.267481654 
               865          866          867          868          869          870 
       0.421229871  0.671079892  0.128934242  0.607502525  0.329025154  0.876266403 
               871          872          873          874          875          876 
       0.301581063  1.648274131  0.545480429  0.756371657  0.583282559  0.270172304 
               877          878          879          880          881          882 
       0.206633500  0.538158747  1.164823249  0.832683174  0.749555974  0.890735326 
               883          884          885          886          887          888 
       0.401328074  0.644798750  0.812343942  0.704589935  0.438127145  0.727865537 
               889          890          891          892          893          894 
       0.350001294  0.512188801  0.507800455  0.322929300  0.443248827  0.277659718 
               895          896          897          898          899          900 
       0.544469628  0.498390596  0.852814428  0.313847963  0.350001294  0.741621267 
               901          902          903          904          905          906 
       1.407366718  0.742979190  0.837537068  0.837031160  0.996794228  0.830960284 
               907          908          909          910          911          912 
       0.780414236  0.891670935  1.473034239  0.735529325  0.306120543  1.201374666 
               913          914          915 
       0.436171061  1.019495463  1.539141227 
      
      $se.fit
               1          2          3          4          5          6          7 
      0.05646874 0.06933742 0.06193877 0.07330839 0.06807691 0.09436454 0.06104946 
               8          9         10         11         12         13         14 
      0.07597501 0.07643437 0.07948480 0.06400530 0.09793296 0.06650727 0.06182292 
              15         16         17         18         19         20         21 
      0.07053271 0.06225335 0.06665406 0.07932805 0.05961257 0.06681082 0.06349905 
              22         23         24         25         26         27         28 
      0.11691906 0.06078760 0.04815229 0.11833733 0.07416973 0.06230158 0.06301416 
              29         30         31         32         33         34         35 
      0.06294363 0.06013329 0.06661629 0.06495998 0.08106144 0.07638081 0.06773225 
              36         37         38         39         40         41         42 
      0.07135762 0.07521767 0.06976608 0.07281010 0.06448912 0.06976608 0.06228647 
              43         44         45         46         47         48         49 
      0.06829553 0.06368724 0.07386931 0.07464387 0.05990025 0.05859332 0.06968754 
              50         51         52         53         54         55         56 
      0.06536346 0.07593137 0.09692552 0.07171172 0.06495998 0.05449574 0.06898269 
              57         58         59         60         61         62         63 
      0.06164114 0.05170205 0.05916581 0.06940904 0.06070494 0.05828693 0.06296589 
              64         65         66         67         68         69         70 
      0.06406679 0.06267504 0.04948364 0.06837208 0.06841012 0.05704717 0.08956674 
              71         72         73         74         75         76         77 
      0.07503442 0.09352493 0.07022068 0.07492204 0.07856854 0.07630638 0.08304983 
              78         79         80         81         82         83         84 
      0.05598304 0.05224312 0.06012013 0.06924679 0.06661744 0.04277025 0.06011668 
              85         86         87         88         89         90         91 
      0.06287771 0.09941879 0.08090194 0.07463367 0.06251233 0.04756707 0.06545436 
              92         93         94         95         96         97         98 
      0.06247452 0.07393668 0.06287771 0.07053026 0.07136777 0.07508098 0.06064586 
              99        100        101        102        103        104        105 
      0.09430834 0.06495998 0.06241657 0.05828693 0.08894967 0.06072759 0.08558339 
             106        107        108        109        110        111        112 
      0.05046459 0.06367530 0.06933742 0.11908819 0.09304720 0.06065703 0.06972066 
             113        114        115        116        117        118        119 
      0.06441222 0.05709913 0.08007484 0.06802053 0.06882584 0.06505612 0.06898269 
             120        121        122        123        124        125        126 
      0.05243027 0.06414597 0.05921233 0.05244765 0.06958192 0.07148192 0.04309244 
             127        128        129        130        131        132        133 
      0.07121346 0.05782094 0.07638081 0.06933466 0.06444537 0.04530731 0.07719681 
             134        135        136        137        138        139        140 
      0.07409102 0.06849884 0.08398818 0.06177263 0.06181229 0.11824890 0.07898395 
             141        142        143        144        145        146        147 
      0.06529612 0.08164309 0.07206157 0.06368724 0.07067919 0.09159458 0.06446006 
             148        149        150        151        152        153        154 
      0.07067919 0.05854880 0.11598088 0.07477066 0.06153510 0.06491822 0.12128608 
             155        156        157        158        159        160        161 
      0.06783153 0.05292204 0.07804030 0.07036527 0.06055327 0.05400904 0.06160816 
             162        163        164        165        166        167        168 
      0.06502372 0.08146710 0.06880614 0.06153157 0.06101613 0.06232801 0.06859530 
             169        170        171        172        173        174        175 
      0.05920342 0.06304798 0.06555549 0.07478355 0.06490488 0.07485451 0.07994231 
             176        177        178        179        180        181        182 
      0.06377831 0.06084079 0.06863675 0.10204009 0.05828693 0.06510138 0.05315844 
             183        184        185        186        187        188        189 
      0.07383208 0.05271048 0.07197024 0.07542513 0.06185562 0.06616281 0.09509642 
             190        191        192        193        194        195        196 
      0.06939582 0.07456195 0.07275887 0.06560150 0.06332148 0.07169761 0.06175051 
             197        198        199        200        201        202        203 
      0.06241993 0.09370381 0.04458160 0.10497985 0.07790723 0.05064705 0.08294681 
             204        205        206        207        208        209        210 
      0.06090570 0.06571347 0.09528315 0.06145912 0.07688685 0.11482334 0.06409921 
             211        212        213        214        215        216        217 
      0.07945545 0.06034416 0.06271436 0.09229483 0.06522345 0.06976608 0.07176345 
             218        219        220        221        222        223        224 
      0.06632869 0.07813817 0.05450578 0.05843694 0.06756409 0.05934637 0.06491617 
             225        226        227        228        229        230        231 
      0.06347123 0.07853192 0.07688685 0.06669370 0.06660619 0.05961227 0.06737108 
             232        233        234        235        236        237        238 
      0.07119819 0.06967315 0.06201011 0.05244765 0.08378699 0.06133746 0.07790981 
             239        240        241        242        243        244        245 
      0.05828693 0.07236603 0.07233933 0.06289280 0.04805924 0.05963322 0.07492204 
             246        247        248        249        250        251        252 
      0.06940904 0.07728996 0.06676384 0.08415608 0.06323125 0.05312419 0.07094474 
             253        254        255        256        257        258        259 
      0.06249187 0.06024717 0.06993866 0.06857111 0.06319366 0.07227510 0.05946147 
             260        261        262        263        264        265        266 
      0.06432931 0.05946999 0.06420903 0.05828693 0.06298528 0.08752415 0.06980253 
             267        268        269        270        271        272        273 
      0.08077126 0.07844955 0.07801277 0.08092533 0.06302227 0.06037644 0.07474732 
             274        275        276        277        278        279        280 
      0.06212840 0.04834448 0.05761948 0.07119003 0.05450578 0.12142369 0.05973671 
             281        282        283        284        285        286        287 
      0.05993018 0.06446006 0.06470350 0.06799733 0.06859389 0.07067919 0.06365208 
             288        289        290        291        292        293        294 
      0.05554491 0.04780898 0.06238192 0.07015174 0.07003610 0.06321828 0.05999364 
             295        296        297        298        299        300        301 
      0.06286452 0.06832579 0.06007257 0.12608029 0.07401597 0.07830340 0.06772449 
             302        303        304        305        306        307        308 
      0.06058854 0.08862271 0.06120803 0.05009988 0.06069877 0.06483800 0.06661825 
             309        310        311        312        313        314        315 
      0.06266849 0.06049918 0.07946088 0.06779951 0.06341292 0.06546525 0.07851801 
             316        317        318        319        320        321        322 
      0.06065258 0.08133037 0.06644540 0.06866293 0.07162806 0.06794051 0.05372480 
             323        324        325        326        327        328        329 
      0.06674501 0.07709929 0.07479326 0.05918564 0.08294681 0.15631639 0.06076128 
             330        331        332        333        334        335        336 
      0.06123955 0.07162590 0.07011654 0.06284339 0.06632869 0.06176135 0.07326938 
             337        338        339        340        341        342        343 
      0.08981024 0.06545436 0.06971999 0.07011654 0.06240333 0.05976670 0.05185241 
             344        345        346        347        348        349        350 
      0.07862697 0.08481527 0.05539721 0.06286224 0.06011292 0.08113281 0.09129331 
             351        352        353        354        355        356        357 
      0.05219150 0.06198973 0.07408355 0.07384184 0.06217875 0.07981207 0.08103694 
             358        359        360        361        362        363        364 
      0.06645998 0.06172764 0.06801169 0.07185701 0.06186733 0.07553754 0.07268254 
             365        366        367        368        369        370        371 
      0.08322802 0.06662931 0.08435331 0.08572342 0.06519771 0.07264753 0.06175177 
             372        373        374        375        376        377        378 
      0.05146396 0.07801793 0.08278113 0.05452576 0.07062899 0.07492204 0.06307969 
             379        380        381        382        383        384        385 
      0.07692538 0.04628523 0.06796794 0.05491392 0.08384966 0.06018045 0.06808073 
             386        387        388        389        390        391        392 
      0.05689010 0.06522345 0.06321276 0.06393640 0.11522079 0.07405559 0.06143077 
             393        394        395        396        397        398        399 
      0.07738331 0.06826952 0.05961227 0.12899881 0.06779224 0.07922017 0.07053026 
             400        401        402        403        404        405        406 
      0.07873157 0.08533640 0.05938473 0.06884252 0.06753753 0.07502943 0.07854284 
             407        408        409        410        411        412        413 
      0.09242052 0.07405333 0.04429329 0.06415799 0.07009589 0.04907016 0.06579083 
             414        415        416        417        418        419        420 
      0.05413487 0.06543349 0.06661825 0.07064773 0.08980107 0.07436856 0.05435582 
             421        422        423        424        425        426        427 
      0.07586977 0.12324023 0.08632202 0.06130901 0.11311497 0.04645730 0.06621479 
             428        429        430        431        432        433        434 
      0.07316614 0.07187209 0.08962191 0.06221570 0.06802053 0.05961227 0.07062473 
             435        436        437        438        439        440        441 
      0.05122878 0.06976608 0.07075751 0.05575415 0.06658888 0.07835102 0.05406398 
             442        443        444        445        446        447        448 
      0.06451594 0.06285971 0.06795745 0.06710194 0.05322945 0.06407857 0.05224312 
             449        450        451        452        453        454        455 
      0.06549504 0.06456772 0.06471590 0.06079424 0.06499129 0.06387676 0.08037927 
             456        457        458        459        460        461        462 
      0.07682757 0.07166387 0.07235360 0.05558880 0.08065878 0.08922423 0.07397254 
             463        464        465        466        467        468        469 
      0.06415288 0.07555220 0.07081148 0.06765769 0.06927171 0.05360135 0.06537861 
             470        471        472        473        474        475        476 
      0.07086929 0.07660809 0.06270513 0.06932643 0.07110582 0.06286452 0.04938762 
             477        478        479        480        481        482        483 
      0.06754709 0.08159534 0.08103694 0.07586977 0.04356258 0.04356258 0.07957895 
             484        485        486        487        488        489        490 
      0.07519615 0.07040133 0.06069877 0.06650625 0.06816253 0.06142862 0.06626005 
             491        492        493        494        495        496        497 
      0.06636329 0.07682900 0.06283901 0.05422445 0.08094687 0.06840717 0.05970529 
             498        499        500        501        502        503        504 
      0.05946999 0.06167214 0.06410631 0.07041363 0.06420903 0.05025224 0.06290550 
             505        506        507        508        509        510        511 
      0.07378993 0.06446006 0.06110458 0.07812826 0.06104609 0.05371403 0.06621181 
             512        513        514        515        516        517        518 
      0.04455846 0.06828237 0.04405811 0.06104946 0.06270068 0.09602319 0.07543596 
             519        520        521        522        523        524        525 
      0.05920342 0.04607937 0.07046805 0.05683113 0.06328409 0.06120421 0.07454846 
             526        527        528        529        530        531        532 
      0.07656750 0.06142286 0.06249187 0.06897267 0.06686194 0.06420903 0.07149383 
             533        534        535        536        537        538        539 
      0.07336017 0.06293463 0.06143077 0.07118591 0.05450578 0.06974514 0.06597996 
             540        541        542        543        544        545        546 
      0.06863675 0.06760473 0.06301104 0.06104764 0.08246800 0.06439197 0.09602270 
             547        548        549        550        551        552        553 
      0.09328432 0.05404426 0.06225623 0.08229619 0.06241657 0.06995030 0.05208559 
             554        555        556        557        558        559        560 
      0.07537327 0.07027388 0.06294363 0.06927171 0.08316962 0.06286224 0.05701667 
             561        562        563        564        565        566        567 
      0.06003232 0.06755383 0.06987042 0.08603086 0.06615496 0.05137907 0.07968268 
             568        569        570        571        572        573        574 
      0.09126650 0.11369112 0.07181817 0.06024646 0.06032178 0.06264856 0.06921635 
             575        576        577        578        579        580        581 
      0.06929126 0.06103578 0.07156574 0.06695804 0.10449287 0.06355283 0.06079424 
             582        583        584        585        586        587        588 
      0.07193306 0.04534784 0.07097177 0.05972443 0.06602054 0.07236603 0.08094687 
             589        590        591        592        593        594        595 
      0.04895971 0.07506037 0.06858637 0.07148192 0.06569301 0.07327319 0.05406398 
             596        597        598        599        600        601        602 
      0.06298386 0.08448278 0.04337025 0.07258900 0.07001859 0.05839525 0.12141658 
             603        604        605        606        607        608        609 
      0.06133746 0.05963440 0.06172222 0.06437646 0.04544916 0.06771362 0.05503004 
             610        611        612        613        614        615        616 
      0.07666963 0.05589003 0.05739005 0.06571347 0.07081613 0.06011870 0.07072981 
             617        618        619        620        621        622        623 
      0.07483852 0.08772422 0.06917746 0.07861954 0.06388423 0.04759840 0.07272464 
             624        625        626        627        628        629        630 
      0.07675444 0.07375836 0.05733997 0.09194053 0.07155813 0.06789930 0.06769245 
             631        632        633        634        635        636        637 
      0.06798106 0.06379269 0.06069009 0.07674965 0.11852281 0.06544373 0.07776574 
             638        639        640        641        642        643        644 
      0.05987703 0.06588174 0.06804260 0.05961257 0.05870057 0.06228474 0.05976372 
             645        646        647        648        649        650        651 
      0.06273829 0.06079995 0.06635113 0.06069877 0.07277651 0.06500143 0.06925663 
             652        653        654        655        656        657        658 
      0.05280380 0.06735674 0.06202575 0.06626348 0.07084922 0.06031916 0.06321828 
             659        660        661        662        663        664        665 
      0.07119676 0.05581153 0.06232304 0.06063270 0.04669386 0.06328753 0.06248150 
             666        667        668        669        670        671        672 
      0.06273829 0.05934637 0.09038425 0.10788849 0.06149615 0.05079080 0.07409102 
             673        674        675        676        677        678        679 
      0.06054682 0.07050050 0.07498626 0.08238008 0.07107764 0.11789003 0.06337650 
             680        681        682        683        684        685        686 
      0.06917746 0.07511083 0.06251923 0.07215485 0.07557510 0.06077049 0.07162806 
             687        688        689        690        691        692        693 
      0.05914259 0.08149849 0.09246046 0.07449036 0.07564770 0.06290806 0.07217840 
             694        695        696        697        698        699        700 
      0.08019171 0.06109433 0.06393640 0.07658277 0.06484169 0.06976608 0.06616281 
             701        702        703        704        705        706        707 
      0.06583917 0.07508098 0.08348745 0.05519934 0.05586608 0.06550502 0.04855603 
             708        709        710        711        712        713        714 
      0.06451594 0.07355427 0.06312978 0.06410631 0.06544550 0.07909054 0.05372480 
             715        716        717        718        719        720        721 
      0.06451594 0.05961227 0.08316962 0.06514648 0.07554500 0.06652446 0.07168516 
             722        723        724        725        726        727        728 
      0.06284672 0.08962191 0.04701351 0.07814358 0.05315675 0.04841738 0.07267840 
             729        730        731        732        733        734        735 
      0.07045263 0.07275703 0.06404659 0.08273482 0.06012800 0.05446012 0.06484130 
             736        737        738        739        740        741        742 
      0.06215792 0.07415463 0.06373935 0.08081463 0.06007056 0.07185701 0.10344909 
             743        744        745        746        747        748        749 
      0.06540179 0.05862616 0.05906667 0.06938898 0.05315044 0.07393668 0.09636362 
             750        751        752        753        754        755        756 
      0.06028885 0.06575505 0.07072861 0.06349905 0.06236043 0.06059228 0.06005188 
             757        758        759        760        761        762        763 
      0.07392528 0.05095951 0.06886639 0.05042214 0.06617054 0.07603965 0.05658979 
             764        765        766        767        768        769        770 
      0.06368724 0.06236222 0.05342378 0.07715688 0.06796794 0.04394840 0.06195230 
             771        772        773        774        775        776        777 
      0.07787604 0.06285797 0.07843102 0.08429821 0.05490824 0.07545498 0.06681316 
             778        779        780        781        782        783        784 
      0.08056568 0.08909252 0.04703857 0.11695654 0.06863675 0.08070314 0.05548703 
             785        786        787        788        789        790        791 
      0.07413582 0.06341401 0.07094474 0.05492830 0.06865620 0.08103694 0.07247636 
             792        793        794        795        796        797        798 
      0.06399303 0.06980253 0.05259185 0.09391714 0.07593137 0.06137177 0.06440981 
             799        800        801        802        803        804        805 
      0.10222479 0.06242216 0.08611263 0.07148673 0.12618850 0.05929589 0.08121163 
             806        807        808        809        810        811        812 
      0.05754394 0.06431377 0.06598722 0.07848740 0.07196807 0.06398223 0.09755874 
             813        814        815        816        817        818        819 
      0.07409102 0.07962178 0.06884998 0.05568465 0.06924715 0.06361120 0.06141371 
             820        821        822        823        824        825        826 
      0.05956594 0.08087222 0.08907164 0.06227110 0.07856854 0.06021144 0.06065258 
             827        828        829        830        831        832        833 
      0.05911348 0.05934288 0.06555537 0.06786455 0.06532896 0.04917556 0.07531693 
             834        835        836        837        838        839        840 
      0.06263979 0.05723749 0.06078760 0.05973983 0.06104946 0.07085128 0.06685284 
             841        842        843        844        845        846        847 
      0.05250354 0.06189087 0.05996304 0.06983688 0.06358489 0.07237266 0.05801099 
             848        849        850        851        852        853        854 
      0.07204938 0.07570994 0.06481181 0.06664563 0.06070706 0.07377922 0.04716089 
             855        856        857        858        859        860        861 
      0.04960018 0.06720009 0.06238192 0.06283599 0.06005703 0.05250354 0.04484632 
             862        863        864        865        866        867        868 
      0.04798415 0.06715532 0.06884998 0.06068936 0.07404524 0.06998795 0.05793005 
             869        870        871        872        873        874        875 
      0.05505380 0.06824694 0.08164309 0.09328432 0.07759919 0.06280339 0.05929589 
             876        877        878        879        880        881        882 
      0.06274807 0.06259806 0.06474536 0.09208720 0.11398717 0.06523715 0.07365726 
             883        884        885        886        887        888        889 
      0.07410918 0.04258081 0.06774366 0.06253641 0.06987042 0.04641669 0.05923667 
             890        891        892        893        894        895        896 
      0.06969778 0.06499451 0.07478355 0.07636784 0.05985201 0.06130402 0.06845690 
             897        898        899        900        901        902        903 
      0.06392384 0.06008837 0.05923667 0.07223163 0.08853083 0.05621521 0.06841543 
             904        905        906        907        908        909        910 
      0.06786455 0.04948165 0.06373120 0.05598104 0.04656182 0.09755874 0.06335582 
             911        912        913        914        915 
      0.07408355 0.06403634 0.05855485 0.07269059 0.09748876 
      

---

    Code
      predict(M_bioChem, type = "response", se.fit = TRUE)
    Output
      $fit
        [1] 1.9773678 1.3031830 1.3257927 1.4621622 2.1722313 0.9621813 1.2241940
        [8] 1.2624707 1.6810798 1.3066714 2.0140305 1.5288522 1.1932609 1.4740089
       [15] 1.3138303 1.1640397 1.5649942 1.5979360 1.3535783 1.4355326 1.5308538
       [22] 1.0190190 1.5852753 1.5244016 0.9679666 1.4109687 1.3479813 1.5089042
       [29] 1.1356546 1.7878147 1.1276395 2.0634160 1.5404982 1.4131416 1.3624640
       [36] 1.1231986 1.1203610 1.8042752 1.4270849 1.5162109 1.8042752 1.1832818
       [43] 1.6285115 1.1892832 1.6387580 1.3577849 1.7047882 3.1100404 1.6282431
       [50] 1.6355778 1.6387596 0.9009386 1.5381316 2.0634160 1.4421812 1.4754368
       [57] 1.1945838 1.4197412 1.4308455 1.4254918 1.3139073 1.3704831 1.2619222
       [64] 1.4049868 1.3569270 1.4857251 2.1733436 1.9128229 1.3718705 1.1119475
       [71] 1.4849663 0.9065165 1.3466688 1.5179313 1.4427275 1.2890597 1.1340810
       [78] 1.4063020 1.5530462 1.2864153 1.1812424 1.1340526 2.1655770 1.9231082
       [85] 2.6508399 1.1483982 2.7275496 1.3289213 2.7072199 1.6766697 1.4362122
       [92] 1.3267885 1.7716082 2.6508399 1.6321406 1.9574614 1.7661654 1.3571438
       [99] 1.0125187 2.0634160 1.2934632 1.3704831 1.3382303 1.4708802 1.1587863
      [106] 1.4552268 1.5929519 1.3031830 1.0113153 0.9599448 1.7533086 1.1245632
      [113] 1.1602826 1.8824883 1.2521662 1.5127258 1.8206720 1.0953714 1.4754368
      [120] 1.4599462 1.3697557 1.4220878 1.7545947 1.1524378 1.1782593 1.9036763
      [127] 1.3921982 1.7599967 1.4131416 1.4867391 1.1862729 2.4490941 1.4911095
      [134] 1.2305336 1.4043571 2.4393570 1.5639855 1.2598809 0.9689465 1.2034996
      [141] 1.0948174 1.3519947 1.4188725 1.1892832 1.1800478 1.0342619 1.6564991
      [148] 1.1800478 1.7626700 1.1319748 1.4852669 1.7993150 1.4433961 1.2615294
      [155] 1.4976412 1.5522607 1.3036189 1.3465325 1.4865254 2.0337755 1.4261831
      [162] 1.1718391 1.4179267 1.4040729 1.7800443 1.2907178 1.6818217 1.5246705
      [169] 1.6709762 1.5919851 1.4071208 1.3811677 1.1573456 1.4342245 1.1938945
      [176] 1.2003997 1.6152799 1.3005498 1.0723031 1.3704831 1.0952605 2.1931382
      [183] 1.7647363 1.8430281 1.6013873 1.6198706 1.2493446 1.5458866 1.1091383
      [190] 1.3808868 1.1208145 1.2928154 1.1288953 1.6985897 1.5836109 1.6409766
      [197] 1.3294761 0.9121288 2.0673067 0.8944443 1.5566060 1.5550904 1.2133798
      [204] 1.2518754 1.3849447 0.9248597 1.4266161 1.4448045 1.1236445 1.3218307
      [211] 1.1768648 1.3910649 1.3486634 1.1912411 1.3714199 1.8042752 1.8177269
      [218] 1.9640102 1.5296167 1.9314207 1.7912550 1.5335215 1.6197677 1.4422911
      [225] 1.4039921 1.6788134 1.4448045 1.1738565 1.5268318 1.8325002 1.3603111
      [232] 2.6577200 1.4328667 1.7421024 1.7545947 1.5773255 1.2263016 2.0965061
      [239] 1.3704831 1.6346196 1.1495275 1.1609815 1.5970263 1.5833106 1.5179313
      [246] 1.4254918 1.3023005 1.6330262 1.1711268 1.1601595 2.3135747 1.7173537
      [253] 1.2611563 1.8307157 1.2378954 1.2058777 1.3887334 1.4991067 1.5802697
      [260] 1.7478546 1.5459910 1.4721096 1.3704831 1.1368043 1.2179308 1.7793347
      [267] 1.1488642 3.4281702 1.2856730 1.5920170 1.3243742 1.8127697 1.3657251
      [274] 1.6601906 1.6968081 1.8365839 1.1994331 1.9314207 0.9380774 1.4811279
      [281] 1.3205713 1.6564991 1.3179081 1.3043702 1.9787588 1.1800478 1.8265765
      [288] 2.0322570 1.5975111 2.2766544 2.0018406 1.7679161 1.7403406 1.5027705
      [295] 1.4390841 1.6924138 2.4489409 0.9590960 1.5558712 1.8035433 1.6318699
      [302] 1.5746833 3.8183646 1.4350128 1.5740870 1.6632170 1.6604559 1.2430401
      [309] 1.9255574 1.3959544 1.1437609 2.0923384 2.2220374 1.9964641 2.0415212
      [316] 1.3140403 2.2581544 1.3384611 1.3698347 1.5626223 1.7775335 2.0358344
      [323] 1.2429143 1.8986034 1.9608801 1.4914972 1.2133798 9.1416541 1.8867542
      [330] 1.5072242 1.6754760 1.3025238 2.0714405 1.9640102 1.4000201 1.3922854
      [337] 1.3927080 1.4362122 1.5139508 1.3025238 1.2291587 1.3183018 1.4589125
      [344] 1.3732236 1.2469824 1.4070136 1.5137583 2.0868516 1.1729055 1.2263003
      [351] 1.4801734 1.7006534 1.3581460 1.3906843 1.6618070 1.5589703 1.2022217
      [358] 1.3182245 1.2710252 1.6927564 2.2629600 1.7818463 2.0068705 1.8097585
      [365] 1.1338515 1.4896001 1.1147637 1.1870287 1.2023446 1.5941141 1.2276672
      [372] 1.7007614 1.2260901 1.5013373 1.7962675 1.4377116 1.5179313 1.8320514
      [379] 1.7417516 2.0438048 2.6500381 2.1525530 1.3443387 1.3906427 1.3330563
      [386] 1.8036219 1.3714199 2.1251494 1.1869933 1.0973543 1.8621011 1.7980877
      [393] 1.2566084 2.0096379 1.8325002 0.9423937 1.1825578 1.4783389 1.6321406
      [400] 1.4923170 2.8728587 1.6634477 1.8955962 1.4171210 1.7629499 1.4192748
      [407] 0.9523986 2.7448308 1.7776464 1.3638944 1.2072206 1.6134305 1.3619638
      [414] 1.9861906 1.1291238 1.2430401 1.4391685 1.0805796 1.7838413 2.2615016
      [421] 2.1084456 1.0058048 1.1580831 1.2427947 1.2439112 1.7374600 2.0675833
      [428] 1.7097875 1.6936147 1.1592566 1.5711820 1.5127258 1.8325002 2.1308724
      [435] 1.5756805 1.8042752 1.5122593 1.8866834 1.6497382 1.2709297 1.9796956
      [442] 1.9152591 1.3656896 2.0413168 1.8225151 1.6697285 1.4214291 1.5530462
      [449] 1.8695806 1.2640946 2.1689500 1.2569523 1.1572285 1.9199877 4.2664256
      [456] 1.3633358 1.4763343 1.7301573 2.1832595 1.3383827 1.1379167 1.3048996
      [463] 1.3539098 1.5210046 1.7359457 1.5043235 1.8493721 1.4617199 1.6193102
      [470] 1.5490165 2.9480690 1.7847332 1.4312728 1.3132987 1.4390841 1.5205505
      [477] 1.5702615 1.4476824 1.2022217 2.1084456 2.1012572 2.1012572 4.3719000
      [484] 1.6780192 1.6002198 1.6632170 1.7489817 2.1074215 1.5631945 1.3728082
      [491] 1.6113017 1.1192846 1.5474011 2.2052390 1.4838664 1.6516456 1.3541262
      [498] 1.5459910 1.7728545 1.2363981 1.8421579 1.4721096 1.4509631 1.1544275
      [505] 1.3583346 1.6564991 1.8352126 2.6361158 1.9235696 1.4243454 1.6909725
      [512] 2.3353576 1.7265498 2.2239758 1.2241940 1.1891570 1.2713633 1.2970404
      [519] 1.6709762 1.6399271 1.7241058 1.8518851 2.0166814 1.3928959 1.7291739
      [526] 1.2976567 1.3986042 1.2611563 1.1814814 1.2127286 1.4721096 1.1991904
      [533] 1.3935014 1.2782412 1.7980877 1.5510569 1.9314207 1.5885384 1.3379778
      [540] 1.3005498 2.7285513 1.1370343 1.4505772 3.6108046 1.8256527 3.5606171
      [547] 5.1980010 2.0960297 1.8284256 1.4123806 1.2934632 1.1806449 1.4456875
      [554] 1.7018582 1.6818933 1.1356546 1.8493721 1.3108924 1.5137583 1.7957918
      [561] 2.5101509 1.5448904 1.5498019 1.3023157 1.6647239 1.5171695 1.6411508
      [568] 1.2210155 2.9300023 1.9208224 1.6263366 1.5076441 1.6046993 2.0086214
      [575] 1.6913867 1.4983675 1.8631600 1.5718511 0.9869283 1.2465667 1.2569523
      [582] 1.8722774 1.6464112 1.6295616 1.6234178 1.4672009 1.6346196 1.4838664
      [589] 1.5577676 2.9636834 1.4874915 1.1782593 1.5956942 1.4870713 1.9796956
      [596] 1.4183586 1.1323611 1.7736938 1.3038437 2.6782256 1.7104900 1.1405976
      [603] 1.2263016 1.6097326 1.2201133 3.0628883 1.6809162 1.3401456 1.8843231
      [610] 1.5265035 2.8227401 1.7555504 1.3849447 1.5643939 1.2861550 1.3680340
      [617] 1.6870081 2.7469338 1.6508103 1.7646768 1.9646783 1.6366119 1.8540561
      [624] 1.3086560 2.2356215 1.8819170 0.9762033 1.7077656 2.2276652 2.1982393
      [631] 1.9170875 1.2203662 1.2898039 1.2880167 1.1417510 1.8424616 2.3854483
      [638] 1.3169686 1.2437950 1.9305068 1.3535783 1.9045206 2.5767987 1.4975459
      [645] 2.3345028 1.3107270 1.3720541 1.6632170 1.5242399 1.4792381 1.2688359
      [652] 2.1974433 1.2947777 1.3644993 1.1629859 1.7688107 1.4150547 1.7403406
      [659] 2.1521045 1.4758365 1.4001967 1.6633852 1.7617103 1.2195022 1.1860387
      [666] 2.3345028 1.6197677 1.2015743 5.6310761 1.7554387 1.4956799 1.2305336
      [673] 1.2547921 1.4626625 1.8299081 1.3116884 2.0703172 3.0242767 1.6327669
      [680] 1.6508103 2.8709469 3.0094363 1.4275181 1.6355761 1.4297953 1.5626223
      [687] 1.4551271 1.1164004 0.9584890 1.8103097 1.5563092 1.2187621 2.0333538
      [694] 2.4312256 1.3581054 1.1869933 1.3284848 1.6290139 1.8042752 1.5458866
      [701] 1.1432639 1.7661654 2.4983044 1.8929935 1.9333740 1.1920541 1.5585559
      [708] 1.9152591 3.0300847 2.1348476 1.2363981 1.4195606 4.2326222 2.0358344
      [715] 1.9152591 1.8325002 1.3108924 1.4794730 1.5803701 1.4714130 1.9209709
      [722] 2.1294992 1.1592566 1.5640850 2.1489071 2.1851663 1.5963801 1.4394057
      [729] 1.7255383 1.9853769 1.5541078 1.2191625 1.5081395 2.0317188 1.7052332
      [736] 2.7737626 1.3577338 1.2463145 1.3057462 1.7513582 2.2629600 3.7498344
      [743] 1.7344655 3.0443502 2.2312722 1.2714049 2.2397834 1.7716082 1.3362510
      [750] 3.1984359 2.2885165 1.1149384 1.5308538 2.4526606 1.4702850 1.6650691
      [757] 1.2410306 1.7561932 1.6511444 1.5745649 1.6872861 1.7305742 1.8838221
      [764] 1.1892832 1.8011365 2.3730814 1.8127678 2.6500381 1.9657235 1.1963982
      [771] 4.3274541 1.9282870 1.1970394 1.5128699 2.0463669 1.9101889 2.6579785
      [778] 1.2515329 1.3714011 1.5661437 1.0179885 1.3005498 1.1638087 1.8880201
      [785] 2.0052467 2.9153326 1.7173537 2.0990009 1.6457369 1.2022217 1.5634131
      [792] 1.1503465 1.7793347 1.3824605 4.5897305 1.6387596 1.5108510 2.4048839
      [799] 5.6465027 1.5129927 1.1866685 1.6546976 5.9278696 1.7919108 1.6380396
      [806] 1.8539474 1.7021303 2.1141320 1.5621267 2.2607190 1.4215729 4.3624518
      [813] 1.2305336 1.2087234 3.5518964 2.1830386 1.8566452 1.4450035 1.4878871
      [820] 1.6235415 1.9517766 2.9673924 1.8711648 1.4427275 1.8831305 1.3140403
      [827] 1.4937626 1.3844654 1.3728873 2.3095003 1.7069594 2.3120812 1.2420356
      [834] 1.4950359 2.8657974 1.5852753 1.5839515 1.2241940 1.9930231 1.9622206
      [841] 2.5528247 1.4741580 1.4254011 1.4500448 1.2311502 1.7103595 1.9031721
      [848] 1.8174510 1.3212791 2.0624911 1.9595165 1.5758913 1.6713559 1.5670948
      [855] 2.6975454 1.9650041 2.2766544 1.8778426 1.6126670 2.5528247 2.3365393
      [862] 1.5259448 2.3404155 3.5518964 1.5238345 1.9563488 1.1376153 1.8358407
      [869] 1.3896128 2.4019152 1.3519947 5.1980010 1.7254371 2.1305319 1.7919108
      [876] 1.3101902 1.2295319 1.7128502 3.2053563 2.2994804 2.1160602 2.4369209
      [883] 1.4938073 1.9056035 2.2531831 2.0230169 1.5498019 2.0706561 1.4190694
      [890] 1.6689402 1.6616323 1.3811677 1.5577599 1.3200369 1.7236939 1.6460699
      [897] 2.3462409 1.3686816 1.4190694 2.0993363 4.0851838 2.1021890 2.3106689
      [904] 2.3095003 2.7095816 2.2955220 2.1823761 2.4392020 4.3624518 2.0865862
      [911] 1.3581460 3.3246841 1.5467734 2.7717959 4.6605862
      
      $se.fit
               1          2          3          4          5          6          7 
      0.11165947 0.09035934 0.08211797 0.10718875 0.14787880 0.09079580 0.07473638 
               8          9         10         11         12         13         14 
      0.09591622 0.12849226 0.10386052 0.12890864 0.14972502 0.07936053 0.09112754 
              15         16         17         18         19         20         21 
      0.09266801 0.07246537 0.10431321 0.12676114 0.08069028 0.09590912 0.09720775 
              22         23         24         25         26         27         28 
      0.11914274 0.09636508 0.07340343 0.11454659 0.10465117 0.08398136 0.09508234 
              29         30         31         32         33         34         35 
      0.07148222 0.10750719 0.07511916 0.13403946 0.12487500 0.10793690 0.09228275 
              36         37         38         39         40         41         42 
      0.08014878 0.08427094 0.12587722 0.10390619 0.09777910 0.12587722 0.07370244 
              43         44         45         46         47         48         49 
      0.11122005 0.07574217 0.12105391 0.10135033 0.10211724 0.18222760 0.11346826 
              50         51         52         53         54         55         56 
      0.10690703 0.12443327 0.08732394 0.11030207 0.13403946 0.07859273 0.10177960 
              57         58         59         60         61         62         63 
      0.07363550 0.07340353 0.08465713 0.09894202 0.07976066 0.07988125 0.07945805 
              64         65         66         67         68         69         70 
      0.09001300 0.08504545 0.07351908 0.14859603 0.13085644 0.07826133 0.09959351 
              71         72         73         74         75         76         77 
      0.11142359 0.08478189 0.09456400 0.11372652 0.11335299 0.09836348 0.09418523 
              78         79         80         81         82         83         84 
      0.07872906 0.08113599 0.07733945 0.08179724 0.07554768 0.09262227 0.11561088 
              85         86         87         88         89         90         91 
      0.16667875 0.11417235 0.22066407 0.09918228 0.16923462 0.07975426 0.09400636 
              92         93         94         95         96         97         98 
      0.08289048 0.13098684 0.16667875 0.11511530 0.13969966 0.13260543 0.08230515 
              99        100        101        102        103        104        105 
      0.09548896 0.13403946 0.08073354 0.07988125 0.11903514 0.08932302 0.09917286 
             106        107        108        109        110        111        112 
      0.07343743 0.10143169 0.09035934 0.12043571 0.08932017 0.10635049 0.07840528 
             113        114        115        116        117        118        119 
      0.07473637 0.10748844 0.10026701 0.10289641 0.12530928 0.07126061 0.10177960 
             120        121        122        123        124        125        126 
      0.07654537 0.08786431 0.08420514 0.09202437 0.08018884 0.08422424 0.08203406 
             127        128        129        130        131        132        133 
      0.09914325 0.10176467 0.10793690 0.10308255 0.07644979 0.11096186 0.11510890 
             134        135        136        137        138        139        140 
      0.09117149 0.09619684 0.20487715 0.09661149 0.07787613 0.11457686 0.09505716 
             141        142        143        144        145        146        147 
      0.07148733 0.11038103 0.10224619 0.07574217 0.08340481 0.09473279 0.10677802 
             148        149        150        151        152        153        154 
      0.08340481 0.10320222 0.13128743 0.11105439 0.11072102 0.09370271 0.15300596 
             155        156        157        158        159        160        161 
      0.10158729 0.08214881 0.10173481 0.09474912 0.09001397 0.10984227 0.08786452 
             162        163        164        165        166        167        168 
      0.07619734 0.11551438 0.09660884 0.10952891 0.07875460 0.10482461 0.10458523 
             169        170        171        172        173        174        175 
      0.09892750 0.10037144 0.09224450 0.10328862 0.07511738 0.10735817 0.09544268 
             176        177        178        179        180        181        182 
      0.07655946 0.09827491 0.08926551 0.10941790 0.07988125 0.07130297 0.11658380 
             183        184        185        186        187        188        189 
      0.13029415 0.09714689 0.11525223 0.12217894 0.07727899 0.10228020 0.10547508 
             190        191        192        193        194        195        196 
      0.09582777 0.08357011 0.09406379 0.07405722 0.10755721 0.11354112 0.10133114 
             197        198        199        200        201        202        203 
      0.08298580 0.08546995 0.09216384 0.09389864 0.12127087 0.07876074 0.10064598 
             204        205        206        207        208        209        210 
      0.07624635 0.09100952 0.08812355 0.08767857 0.11108647 0.12902062 0.08472830 
             211        212        213        214        215        216        217 
      0.09350832 0.08394265 0.08458057 0.10994539 0.08944873 0.12587722 0.13044635 
             218        219        220        221        222        223        224 
      0.13027022 0.11952145 0.10527360 0.10467547 0.10361099 0.09612732 0.09362801 
             225        226        227        228        229        230        231 
      0.08911310 0.13184044 0.11108647 0.07828883 0.10169645 0.10923950 0.09164563 
             232        233        234        235        236        237        238 
      0.18922485 0.09983234 0.10802797 0.09202437 0.13215935 0.07521822 0.16333839 
             239        240        241        242        243        244        245 
      0.07988125 0.11829092 0.08315605 0.07301737 0.07675188 0.09441790 0.11372652 
             246        247        248        249        250        251        252 
      0.09894202 0.10065475 0.10902709 0.09855744 0.07335834 0.12290679 0.12183721 
             253        254        255        256        257        258        259 
      0.07881201 0.11029544 0.08657675 0.08268837 0.08775914 0.10834810 0.09396516 
             260        261        262        263        264        265        266 
      0.11243827 0.09194007 0.09452273 0.07988125 0.07160194 0.10659836 0.12420207 
             267        268        269        270        271        272        273 
      0.09279521 0.26893841 0.10029891 0.12883451 0.08346508 0.10944858 0.10208430 
             274        275        276        277        278        279        280 
      0.10314498 0.08203130 0.10582301 0.08538768 0.10527360 0.11390482 0.08847770 
             281        282        283        284        285        286        287 
      0.07914208 0.10677802 0.08527326 0.08869369 0.13573076 0.08340481 0.11626539 
             288        289        290        291        292        293        294 
      0.11288154 0.07637538 0.14202207 0.14043261 0.12381794 0.11002133 0.09015667 
             295        296        297        298        299        300        301 
      0.09046733 0.11563552 0.14711418 0.12092309 0.11515931 0.14122357 0.11051755 
             302        303        304        305        306        307        308 
      0.09540777 0.33839383 0.08783431 0.07886157 0.10095523 0.10766064 0.08280916 
             309        310        311        312        313        314        315 
      0.12067177 0.08445410 0.09088425 0.14185951 0.14090587 0.13069903 0.16029619 
             316        317        318        319        320        321        322 
      0.07969993 0.18365653 0.08893458 0.09405686 0.11192761 0.12076653 0.10937479 
             323        324        325        326        327        328        329 
      0.08295833 0.14638097 0.14666061 0.08827522 0.10064598 1.42899041 0.11464160 
             330        331        332        333        334        335        336 
      0.09230172 0.12000748 0.09132846 0.13017634 0.13027022 0.08646713 0.10201189 
             337        338        339        340        341        342        343 
      0.12507944 0.09400636 0.10555264 0.09132846 0.07670360 0.07879054 0.07564813 
             344        345        346        347        348        349        350 
      0.10797241 0.10576316 0.07794463 0.09515824 0.12544674 0.09516112 0.11195302 
             351        352        353        354        355        356        357 
      0.07725247 0.10542305 0.10061628 0.10269070 0.10332908 0.12442464 0.09742437 
             358        359        360        361        362        363        364 
      0.08760918 0.07845740 0.11512722 0.16260953 0.11023807 0.15159406 0.13153784 
             365        366        367        368        369        370        371 
      0.09436822 0.09925102 0.09403401 0.10175616 0.07839012 0.11580845 0.07581062 
             372        373        374        375        376        377        378 
      0.08752792 0.09565701 0.12428240 0.09794285 0.10154412 0.11372652 0.11556524 
             379        380        381        382        383        384        385 
      0.13398491 0.09459797 0.18011762 0.11820513 0.11272234 0.08368951 0.09075545 
             386        387        388        389        390        391        392 
      0.10260824 0.08944873 0.13433656 0.07589207 0.12643802 0.13789900 0.11045791 
             393        394        395        396        397        398        399 
      0.09724052 0.13719702 0.10923950 0.12156767 0.08016824 0.11711426 0.11511530 
             400        401        402        403        404        405        406 
      0.11749246 0.24515942 0.09878339 0.13049762 0.09570885 0.13227312 0.11147387 
             407        408        409        410        411        412        413 
      0.08802118 0.20326385 0.07873781 0.08750473 0.08462120 0.07917128 0.08960473 
             414        415        416        417        418        419        420 
      0.10752217 0.07388250 0.08280916 0.10167399 0.09703720 0.13266170 0.12292578 
             421        422        423        424        425        426        427 
      0.15996729 0.12395562 0.09996808 0.07619451 0.14070498 0.08071770 0.13690460 
             428        429        430        431        432        433        434 
      0.12509856 0.12172362 0.10389479 0.09775219 0.10289641 0.10923950 0.15049229 
             435        436        437        438        439        440        441 
      0.08072018 0.12587722 0.10700370 0.10519043 0.10985422 0.09957863 0.10703023 
             442        443        444        445        446        447        448 
      0.12356473 0.08584686 0.13872268 0.12229430 0.08887873 0.09108315 0.08113599 
             449        450        451        452        453        454        455 
      0.12244825 0.08161970 0.14036556 0.07641546 0.07520977 0.12264259 0.34293218 
             456        457        458        459        460        461        462 
      0.10474179 0.10579983 0.12518310 0.12136477 0.10795231 0.10152974 0.09652673 
             463        464        465        466        467        468        469 
      0.08685721 0.11491525 0.12292488 0.10177906 0.12810917 0.07835016 0.10586826 
             470        471        472        473        474        475        476 
      0.10977770 0.22584593 0.11191194 0.09922503 0.09338318 0.09046733 0.07509637 
             477        478        479        480        481        482        483 
      0.10606659 0.11812414 0.09742437 0.15996729 0.09153619 0.09153619 0.34791122 
             484        485        486        487        488        489        490 
      0.12618058 0.11265760 0.10095523 0.11631822 0.14364719 0.09602489 0.09096234 
             491        492        493        494        495        496        497 
      0.10693128 0.08599351 0.09723715 0.11957787 0.12011434 0.11298440 0.08084850 
             498        499        500        501        502        503        504 
      0.09194007 0.10933574 0.07926092 0.12971302 0.09452273 0.07291415 0.07261984 
             505        506        507        508        509        510        511 
      0.10023141 0.10677802 0.11213990 0.20595513 0.11742640 0.07650734 0.11196234 
             512        513        514        515        516        517        518 
      0.10405994 0.11789291 0.09798417 0.07473638 0.07456095 0.12208035 0.09784349 
             519        520        521        522        523        524        525 
      0.09892750 0.07556682 0.12149438 0.10524473 0.12762385 0.08525109 0.12890725 
             526        527        528        529        530        531        532 
      0.09935832 0.08590628 0.07881201 0.08148992 0.08108538 0.09452273 0.08573471 
             533        534        535        536        537        538        539 
      0.10222750 0.08044564 0.11045791 0.11041340 0.10527360 0.11079284 0.08827972 
             540        541        542        543        544        545        546 
      0.08926551 0.18446298 0.07164572 0.08855431 0.29777584 0.11755738 0.34190006 
             547        548        549        550        551        552        553 
      0.48489197 0.11327837 0.11383088 0.11623354 0.08073354 0.08258646 0.07529949 
             554        555        556        557        558        559        560 
      0.12827462 0.11819316 0.07148222 0.12810917 0.10902642 0.09515824 0.10239007 
             561        562        563        564        565        566        567 
      0.15069017 0.10436327 0.10828532 0.11203934 0.11012974 0.07795076 0.13077129 
             568        569        570        571        572        573        574 
      0.11143782 0.33311523 0.13794995 0.09798103 0.09094378 0.10053211 0.13902945 
             575        576        577        578        579        580        581 
      0.11719832 0.09145403 0.13333843 0.10524806 0.10312697 0.07922284 0.07641546 
             582        583        584        585        586        587        588 
      0.13467864 0.07466119 0.11565287 0.09695771 0.09686540 0.11829092 0.12011434 
             589        590        591        592        593        594        595 
      0.07626785 0.22245517 0.10202165 0.08422424 0.10482595 0.10896246 0.10703023 
             596        597        598        599        600        601        602 
      0.08933370 0.09566501 0.07692555 0.09464471 0.18752558 0.09988448 0.13848746 
             603        604        605        606        607        608        609 
      0.07521822 0.09599544 0.07530810 0.19717790 0.07639622 0.09074611 0.10369437 
             610        611        612        613        614        615        616 
      0.11703646 0.15776303 0.10075113 0.09100952 0.11078432 0.07732197 0.09676078 
             617        618        619        620        621        622        623 
      0.12625318 0.24097264 0.11419886 0.13873808 0.12551196 0.07790011 0.13483555 
             624        625        626        627        628        629        630 
      0.10044516 0.16489578 0.10790907 0.08975265 0.12220451 0.15125690 0.14880420 
             631        632        633        634        635        636        637 
      0.13032565 0.07785045 0.07827832 0.09885482 0.13532354 0.12057757 0.18550616 
             638        639        640        641        642        643        644 
      0.07885617 0.08194338 0.13135670 0.08069028 0.11179644 0.16049524 0.08949891 
             645        646        647        648        649        650        651 
      0.14646271 0.07969213 0.09103733 0.10095523 0.11092886 0.09615259 0.08787530 
             652        653        654        655        656        657        658 
      0.11603336 0.08721201 0.08463410 0.07706349 0.12531885 0.08535492 0.11002133 
             659        660        661        662        663        664        665 
      0.15322286 0.08236869 0.08726452 0.10085554 0.08226106 0.07717928 0.07410548 
             666        667        668        669        670        671        672 
      0.14646271 0.09612732 0.10860339 0.60752829 0.10795271 0.07596679 0.09117149 
             673        674        675        676        677        678        679 
      0.07597368 0.10311843 0.13721796 0.10805700 0.14715327 0.35653207 0.10347906 
             680        681        682        683        684        685        686 
      0.11419886 0.21563919 0.18814765 0.10300236 0.12360883 0.08688936 0.11192761 
             687        688        689        690        691        692        693 
      0.08605999 0.09098495 0.08862234 0.13485062 0.11773121 0.07666996 0.14676422 
             694        695        696        697        698        699        700 
      0.19496413 0.08297254 0.07589207 0.10173905 0.10562801 0.12587722 0.10228020 
             701        702        703        704        705        706        707 
      0.07527154 0.13260543 0.20857706 0.10449200 0.10801002 0.07808553 0.07567729 
             708        709        710        711        712        713        714 
      0.12356473 0.22287566 0.13477246 0.07926092 0.09290386 0.33476037 0.10937479 
             715        716        717        718        719        720        721 
      0.12356473 0.10923950 0.10902642 0.09638247 0.11938906 0.09788496 0.13770511 
             722        723        724        725        726        727        728 
      0.13383204 0.10389479 0.07353313 0.16792330 0.11615634 0.07729255 0.10461371 
             729        730        731        732        733        734        735 
      0.12156871 0.14445012 0.09953530 0.10086720 0.09068141 0.11064765 0.11056953 
             736        737        738        739        740        741        742 
      0.17241130 0.10068225 0.07943928 0.10552340 0.10520507 0.16260953 0.38791697 
             743        744        745        746        747        748        749 
      0.11343715 0.17847855 0.13179382 0.08822149 0.11904546 0.13098684 0.12876598 
             750        751        752        753        754        755        756 
      0.19283003 0.15048152 0.07885804 0.09720775 0.15294896 0.08908793 0.09999053 
             757        758        759        760        761        762        763 
      0.09174354 0.08949474 0.11370835 0.07939294 0.11164863 0.13159226 0.10660510 
             764        765        766        767        768        769        770 
      0.07574217 0.11232288 0.12677898 0.13986752 0.18011762 0.08639040 0.07411962 
             771        772        773        774        775        776        777 
      0.33700501 0.12120820 0.09388502 0.12753223 0.11236241 0.14413326 0.17758795 
             778        779        780        781        782        783        784 
      0.10083060 0.12218158 0.07366917 0.11906041 0.08926551 0.09392302 0.10476062 
             785        786        787        788        789        790        791 
      0.14866062 0.18487293 0.12183721 0.11529455 0.11299005 0.09742437 0.11331048 
             792        793        794        795        796        797        798 
      0.07361416 0.12420207 0.07270616 0.43105437 0.12443327 0.09272360 0.15489811 
             799        800        801        802        803        804        805 
      0.57721254 0.09444427 0.10218715 0.11828892 0.74802896 0.10625295 0.13302786 
             806        807        808        809        810        811        812 
      0.10668343 0.10947041 0.13950570 0.12260727 0.16269958 0.09095541 0.42559530 
             813        814        815        816        817        818        819 
      0.09117149 0.09624070 0.24454800 0.12156174 0.12856738 0.09191841 0.09137666 
             820        821        822        823        824        825        826 
      0.09670777 0.15784451 0.26431051 0.11651949 0.11335299 0.11338601 0.07969993 
             827        828        829        830        831        832        833 
      0.08830151 0.08215816 0.09000013 0.15673320 0.11151389 0.11369789 0.09354631 
             834        835        836        837        838        839        840 
      0.09364873 0.16403105 0.09636508 0.09462499 0.07473638 0.14120825 0.13118002 
             841        842        843        844        845        846        847 
      0.13403234 0.09123692 0.08547139 0.10126661 0.07828255 0.12378327 0.11040491 
             848        849        850        851        852        853        854 
      0.13094622 0.10003396 0.13367378 0.13059321 0.09566772 0.12331134 0.07390558 
             855        856        857        858        859        860        861 
      0.13379874 0.13204845 0.14202207 0.11799609 0.09685200 0.13403234 0.10478519 
             862        863        864        865        866        867        868 
      0.07322117 0.15717136 0.24454800 0.09248054 0.14485833 0.07961936 0.10635035 
             869        870        871        872        873        874        875 
      0.07650347 0.16392336 0.11038103 0.48489197 0.13389252 0.13380462 0.10625295 
             876        877        878        879        880        881        882 
      0.08221191 0.07696632 0.11089910 0.29517229 0.26211125 0.13804573 0.17949692 
             883        884        885        886        887        888        889 
      0.11070484 0.08114215 0.15263886 0.12651222 0.10828532 0.09611300 0.08406095 
             890        891        892        893        894        895        896 
      0.11632142 0.10799697 0.10328862 0.11896275 0.07900686 0.10566937 0.11268485 
             897        898        899        900        901        902        903 
      0.14998072 0.08224185 0.08406095 0.15163849 0.36166472 0.11817499 0.15808541 
             904        905        906        907        908        909        910 
      0.15673320 0.13407456 0.14629636 0.12217168 0.11357369 0.42559530 0.13219738 
             911        912        913        914        915 
      0.10061628 0.21290059 0.09057108 0.20148348 0.45435475 
      

---

    Code
      predict(M_bioChem, newdata = newdataframe, type = "response")
    Output
            [,1]
      1 1.109158

---

    Code
      predict(M_bioChem, newdata = newdataframe, type = "link")
    Output
             [,1]
      1 0.1036013

---

    Code
      predict(M_bioChem, se.fit = TRUE, newdata = newdataframe, type = "response")
    Output
      $fit
             1 
      1.109158 
      
      $se.fit
              [,1]
      1 0.09920124
      

---

    Code
      predict(M_bioChem, se.fit = TRUE, newdata = newdataframe, type = "link")
    Output
      $fit
              1 
      0.1036013 
      
      $se.fit
               1 
      0.08943832 
      

# Testing function that extracting info from tsglm.izip

    Code
      coef(M_arson)
    Output
       (Intercept)       beta_1       beta_2      alpha_1 
      8.315154e-01 2.635916e-02 1.756004e-01 1.944171e-09 

---

    Code
      summary(M_arson)
    Output
      
      Call: tsglm.izip(formula = arson ~ 1, past_mean_lags = 1, past_obs_lags = c(1, 
          2))
      
       Model Coefficients:
                   Estimate   Std.Err Z value Pr(>|z|)  
      (Intercept) 8.315e-01 4.801e-01   1.732   0.0833 .
      beta_1      2.636e-02 8.355e-02   0.315   0.7524  
      beta_2      1.756e-01 8.886e-02   1.976   0.0481 *
      alpha_1     1.944e-09 4.662e-01   0.000   1.0000  
      ---
      Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
      
      (Standard errors obtained by normal approximation.)
      (Baseline zero-inflation odds for iZIP estimated to be 0.33)
      (The baseline Poisson rate for iZIP is set at 1.042)
      
      AIC: 404.5515 
      BIC: 419.4006 

---

    Code
      logLik(M_arson)
    Output
      'log Lik. ' -197.2757 (df=5)

---

    Code
      nobs(M_arson)
    Output
      [1] 144

---

    Code
      AIC(M_arson)
    Output
      [1] 404.5515

---

    Code
      AIC(M_arson, k = log(nobs(M_arson)))
    Output
      [1] 419.4006

---

    Code
      coef(M_arson)
    Output
       (Intercept)       beta_1       beta_2      alpha_1 
      8.315154e-01 2.635916e-02 1.756004e-01 1.944171e-09 

---

    Code
      fitted(M_arson)
    Output
        [1] 1.0419465 1.0408408 1.0598342 1.2090754 1.0861933 1.3583167 0.8315154
        [8] 0.8578746 1.0071158 0.9369521 1.5602763 1.0861933 1.3583167 0.8842337
       [15] 1.2090754 1.0598342 1.2090754 1.0334750 1.0334750 1.0598342 1.2354346
       [22] 1.2354346 1.2881529 1.6393538 1.5339171 0.8578746 1.0071158 0.8315154
       [29] 0.8315154 0.9369521 1.5602763 1.0071158 0.8315154 0.8315154 0.8578746
       [36] 1.0071158 0.8842337 1.1827163 0.8842337 1.1827163 0.8315154 0.8578746
       [43] 1.0334750 1.0071158 0.8578746 1.0334750 1.0861933 1.4373942 1.3583167
       [50] 0.8842337 1.1827163 0.8578746 1.0598342 1.2354346 1.2617937 1.3583167
       [57] 0.8842337 1.2090754 1.0334750 1.0071158 0.8842337 1.1827163 0.8578746
       [64] 1.0334750 1.0598342 1.2090754 1.0071158 0.8315154 0.8578746 1.0861933
       [71] 1.3583167 0.8315154 0.8842337 1.2617937 1.3583167 0.8578746 1.0334750
       [78] 1.0071158 0.8578746 1.0861933 1.4110350 1.2090754 1.1652708 1.9114771
       [85] 1.0861933 1.4373942 1.4373942 1.3583167 0.8578746 1.0334750 1.0334750
       [92] 1.0334750 1.0071158 0.8315154 0.8315154 0.8578746 1.0334750 1.0598342
       [99] 1.1827163 0.9105929 1.3583167 0.8842337 1.1827163 0.8315154 0.8315154
      [106] 0.8842337 1.1827163 0.8315154 0.8315154 0.8315154 0.8315154 0.8842337
      [113] 1.1827163 0.8315154 0.8578746 1.0071158 0.8315154 0.8315154 0.8842337
      [120] 1.2090754 1.0071158 0.8315154 0.8842337 1.1827163 0.8578746 1.0071158
      [127] 0.8315154 0.9105929 1.4110350 1.1827163 0.8315154 0.8315154 0.8315154
      [134] 0.8315154 0.8578746 1.0071158 0.8578746 1.0071158 0.8315154 0.8578746
      [141] 1.0071158 0.8842337 1.1827163 0.8578746

---

    Code
      model.frame(M_arson)
    Output
          arson
      1       1
      2       2
      3       1
      4       3
      5       0
      6       0
      7       1
      8       0
      9       4
      10      1
      11      3
      12      0
      13      2
      14      1
      15      2
      16      1
      17      1
      18      1
      19      2
      20      2
      21      2
      22      4
      23      4
      24      0
      25      1
      26      0
      27      0
      28      0
      29      4
      30      1
      31      0
      32      0
      33      0
      34      1
      35      0
      36      2
      37      0
      38      2
      39      0
      40      0
      41      1
      42      1
      43      0
      44      1
      45      1
      46      3
      47      3
      48      0
      49      2
      50      0
      51      1
      52      2
      53      2
      54      3
      55      0
      56      2
      57      1
      58      1
      59      0
      60      2
      61      0
      62      1
      63      1
      64      2
      65      1
      66      0
      67      0
      68      1
      69      3
      70      0
      71      0
      72      2
      73      3
      74      0
      75      1
      76      1
      77      0
      78      1
      79      3
      80      2
      81      1
      82      6
      83      1
      84      3
      85      3
      86      3
      87      0
      88      1
      89      1
      90      1
      91      1
      92      0
      93      0
      94      0
      95      1
      96      1
      97      2
      98      0
      99      3
      100     0
      101     2
      102     0
      103     0
      104     0
      105     2
      106     0
      107     0
      108     0
      109     0
      110     0
      111     2
      112     0
      113     0
      114     1
      115     0
      116     0
      117     0
      118     2
      119     1
      120     0
      121     0
      122     2
      123     0
      124     1
      125     0
      126     0
      127     3
      128     2
      129     0
      130     0
      131     0
      132     0
      133     0
      134     1
      135     0
      136     1
      137     0
      138     0
      139     1
      140     0
      141     2
      142     0
      143     1
      144     1

---

    Code
      residuals(M_arson)
    Output
                 1            2            3            4            5            6 
      -0.041946494  0.959159181 -0.059834158  1.790924578 -1.086193320 -1.358316685 
                 7            8            9           10           11           12 
       0.168484588 -0.857874572  2.992884164  0.063047944  1.439723730 -1.086193321 
                13           14           15           16           17           18 
       0.641683315  0.115766265  0.790924579 -0.059834159 -0.209075422 -0.033474997 
                19           20           21           22           23           24 
       0.966525003  0.940165842  0.764565417  2.764565417  2.711847094 -1.639353755 
                25           26           27           28           29           30 
      -0.533917110 -0.857874574 -1.007115836 -0.831515411  3.168484589  0.063047944 
                31           32           33           34           35           36 
      -1.560276270 -1.007115837 -0.831515411  0.168484589 -0.857874572  0.992884164 
                37           38           39           40           41           42 
      -0.884233734  0.817283740 -0.884233734 -1.182716260  0.168484588  0.142125428 
                43           44           45           46           47           48 
      -1.033474997 -0.007115836  0.142125427  1.966525003  1.913806680 -1.437394169 
                49           50           51           52           53           54 
       0.641683314 -0.884233735 -0.182716260  1.142125427  0.940165842  1.764565417 
                55           56           57           58           59           60 
      -1.261793744  0.641683315  0.115766265 -0.209075421 -1.033474997  0.992884164 
                61           62           63           64           65           66 
      -0.884233734 -0.182716260  0.142125427  0.966525003 -0.059834158 -1.209075422 
                67           68           69           70           71           72 
      -1.007115836  0.168484589  2.142125428 -1.086193319 -1.358316685  1.168484588 
                73           74           75           76           77           78 
       2.115766266 -1.261793744 -0.358316685  0.142125427 -1.033474997 -0.007115836 
                79           80           81           82           83           84 
       2.142125427  0.913806681 -0.411035007  4.790924578 -0.165270803  1.088522880 
                85           86           87           88           89           90 
       1.913806679  1.562605831 -1.437394169 -0.358316686  0.142125427 -0.033474997 
                91           92           93           94           95           96 
      -0.033474997 -1.033474997 -1.007115836 -0.831515411  0.168484589  0.142125428 
                97           98           99          100          101          102 
       0.966525003 -1.059834158  1.817283740 -0.910592895  0.641683315 -0.884233735 
               103          104          105          106          107          108 
      -1.182716260 -0.831515412  1.168484589 -0.884233734 -1.182716260 -0.831515412 
               109          110          111          112          113          114 
      -0.831515411 -0.831515411  1.168484589 -0.884233734 -1.182716260  0.168484588 
               115          116          117          118          119          120 
      -0.857874572 -1.007115836 -0.831515411  1.168484589  0.115766266 -1.209075421 
               121          122          123          124          125          126 
      -1.007115836  1.168484589 -0.884233734 -0.182716260 -0.857874573 -1.007115836 
               127          128          129          130          131          132 
       2.168484589  1.089407105 -1.411035007 -1.182716261 -0.831515412 -0.831515411 
               133          134          135          136          137          138 
      -0.831515411  0.168484589 -0.857874572 -0.007115836 -0.857874573 -1.007115836 
               139          140          141          142          143          144 
       0.168484589 -0.857874572  0.992884164 -0.884233734 -0.182716260  0.142125427 

---

    Code
      residuals(M_arson, type = "pearson")
    Output
                 1            2            3            4            5            6 
      -0.036550880  0.836222476 -0.051699480  1.450880387 -0.927200740 -1.040977484 
                 7            8            9           10           11           12 
       0.164547828 -0.824529234  2.652438155  0.057940317  1.034677000 -0.927200740 
                13           14           15           16           17           18 
       0.491768886  0.109560269  0.640751137 -0.051699480 -0.169378115 -0.029287642 
                19           20           21           22           23           24 
       0.845623306  0.812346766  0.612993814  2.216502947  2.131178750 -1.152026059 
                25           26           27           28           29           30 
      -0.386706862 -0.824529235 -0.892554580 -0.812086474  3.094450738  0.057940317 
                31           32           33           34           35           36 
      -1.121313720 -0.892554581 -0.812086474  0.164547829 -0.824529234  0.879941788 
                37           38           39           40           41           42 
      -0.836831742  0.669206027 -0.836831742 -0.968428480  0.164547828  0.136601053 
                43           44           45           46           47           48 
      -0.904198589 -0.006306397  0.136601053  1.720534254  1.633671408 -1.072784473 
                49           50           51           52           53           54 
       0.491768885 -0.836831742 -0.149611226  1.097731339  0.812346767  1.414748381 
                55           56           57           58           59           60 
      -1.001455274  0.491768886  0.109560269 -0.169378114 -0.904198589  0.879941787 
                61           62           63           64           65           66 
      -0.836831742 -0.149611226  0.136601052  0.845623306 -0.051699480 -0.979507366 
                67           68           69           70           71           72 
      -0.892554581  0.164547829  2.058861627 -0.927200740 -1.040977484  1.141182130 
                73           74           75           76           77           78 
       2.002344293 -1.001455274 -0.274604299  0.136601052 -0.904198589 -0.006306397 
                79           80           81           82           83           84 
       2.058861626  0.780047359 -0.309429601  3.881268138 -0.136306874  0.714709596 
                85           86           87           88           89           90 
       1.633671405  1.166234921 -1.072784474 -0.274604300  0.136601052 -0.029287641 
                91           92           93           94           95           96 
      -0.029287641 -0.904198589 -0.892554580 -0.812086474  0.164547829  0.136601053 
                97           98           99          100          101          102 
       0.845623306 -0.915745726  1.488023281 -0.849002137  0.491768886 -0.836831742 
               103          104          105          106          107          108 
      -0.968428480 -0.812086474  1.141182132 -0.836831742 -0.968428480 -0.812086474 
               109          110          111          112          113          114 
      -0.812086474 -0.812086474  1.141182132 -0.836831742 -0.968428480  0.164547828 
               115          116          117          118          119          120 
      -0.824529234 -0.892554580 -0.812086474  1.141182132  0.109560270 -0.979507365 
               121          122          123          124          125          126 
      -0.892554581  1.141182131 -0.836831742 -0.149611226 -0.824529234 -0.892554580 
               127          128          129          130          131          132 
       2.117816434  1.015721697 -1.062235555 -0.968428480 -0.812086474 -0.812086474 
               133          134          135          136          137          138 
      -0.812086474  0.164547829 -0.824529234 -0.006306396 -0.824529234 -0.892554580 
               139          140          141          142          143          144 
       0.164547829 -0.824529234  0.879941788 -0.836831742 -0.149611226  0.136601052 

# Testing broom for iZIP

    Code
      glance(M_bioChem)
    Output
      # A tibble: 1 x 8
        null.deviance df.null logLik   AIC   BIC deviance df.residual  nobs
                <dbl>   <dbl>  <dbl> <dbl> <dbl>    <dbl>       <int> <int>
      1         1543.     914 -1613. 3240. 3274.    1406.         909   915

---

    Code
      tidy(M_bioChem)
    Output
      # A tibble: 6 x 5
        term        estimate std.error statistic  p.value
        <chr>          <dbl>     <dbl>     <dbl>    <dbl>
      1 (Intercept)   0.325    0.118       2.74  6.10e- 3
      2 femWomen     -0.229    0.0630     -3.63  2.84e- 4
      3 marMarried    0.159    0.0706      2.25  2.44e- 2
      4 kid5         -0.190    0.0463     -4.09  4.24e- 5
      5 phd           0.0101   0.0303      0.334 7.38e- 1
      6 ment          0.0247   0.00217    11.4   7.26e-30

---

    Code
      tidy(M_bioChem, conf.int = TRUE)
    Output
      # A tibble: 6 x 7
        term        estimate std.error statistic  p.value conf.low conf.high
        <chr>          <dbl>     <dbl>     <dbl>    <dbl>    <dbl>     <dbl>
      1 (Intercept)   0.325    0.118       2.74  6.10e- 3   0.0926    0.557 
      2 femWomen     -0.229    0.0630     -3.63  2.84e- 4  -0.352    -0.105 
      3 marMarried    0.159    0.0706      2.25  2.44e- 2   0.0205    0.297 
      4 kid5         -0.190    0.0463     -4.09  4.24e- 5  -0.280    -0.0988
      5 phd           0.0101   0.0303      0.334 7.38e- 1  -0.0492    0.0694
      6 ment          0.0247   0.00217    11.4   7.26e-30   0.0204    0.0289

---

    Code
      tidy(M_bioChem, conf.int = TRUE, exponentiate = TRUE)
    Output
      # A tibble: 6 x 7
        term        estimate std.error statistic  p.value conf.low conf.high
        <chr>          <dbl>     <dbl>     <dbl>    <dbl>    <dbl>     <dbl>
      1 (Intercept)    1.38    0.118       2.74  6.10e- 3    1.10      1.74 
      2 femWomen       0.796   0.0630     -3.63  2.84e- 4    0.703     0.900
      3 marMarried     1.17    0.0706      2.25  2.44e- 2    1.02      1.35 
      4 kid5           0.827   0.0463     -4.09  4.24e- 5    0.756     0.906
      5 phd            1.01    0.0303      0.334 7.38e- 1    0.952     1.07 
      6 ment           1.02    0.00217    11.4   7.26e-30    1.02      1.03 

---

    Code
      tidy(M_bioChem, exponentiate = TRUE)
    Output
      # A tibble: 6 x 5
        term        estimate std.error statistic  p.value
        <chr>          <dbl>     <dbl>     <dbl>    <dbl>
      1 (Intercept)    1.38    0.118       2.74  6.10e- 3
      2 femWomen       0.796   0.0630     -3.63  2.84e- 4
      3 marMarried     1.17    0.0706      2.25  2.44e- 2
      4 kid5           0.827   0.0463     -4.09  4.24e- 5
      5 phd            1.01    0.0303      0.334 7.38e- 1
      6 ment           1.02    0.00217    11.4   7.26e-30

---

    Code
      augment(M_bioChem)
    Output
      # A tibble: 915 x 11
           art fem   mar    kid5   phd  ment .fitted .resid .std.resid    .hat .cooksd
         <int> <fct> <fct> <dbl> <dbl> <int>   <dbl>  <dbl>      <dbl>   <dbl>   <dbl>
       1     0 Men   Marr~     0  2.52     7  0.682   -1.83      -1.83 0.00481 1.22e-3
       2     0 Women Sing~     0  2.05     6  0.265   -1.49      -1.49 0.00457 7.27e-4
       3     0 Women Sing~     0  3.75     6  0.282   -1.50      -1.50 0.00368 5.95e-4
       4     0 Men   Marr~     1  1.18     3  0.380   -1.57      -1.58 0.00572 1.03e-3
       5     0 Women Sing~     0  3.75    26  0.776   -1.91      -1.92 0.00788 2.25e-3
       6     0 Women Marr~     2  3.59     2 -0.0386  -1.29      -1.29 0.00613 7.17e-4
       7     0 Women Sing~     0  3.19     3  0.202   -1.44      -1.44 0.00330 4.90e-4
       8     0 Men   Marr~     2  2.96     4  0.233   -1.46      -1.47 0.00526 8.10e-4
       9     0 Men   Sing~     0  4.62     6  0.519   -1.68      -1.69 0.00721 1.52e-3
      10     0 Women Marr~     0  1.25     0  0.267   -1.49      -1.49 0.00598 9.57e-4
      # ... with 905 more rows

---

    Code
      augment(M_bioChem, se_fit = TRUE)
    Output
      # A tibble: 915 x 12
           art fem   mar    kid5   phd  ment .fitted .se.fit .resid .std.resid    .hat
         <int> <fct> <fct> <dbl> <dbl> <int>   <dbl>   <dbl>  <dbl>      <dbl>   <dbl>
       1     0 Men   Marr~     0  2.52     7  0.682   0.0565  -1.83      -1.83 0.00481
       2     0 Women Sing~     0  2.05     6  0.265   0.0693  -1.49      -1.49 0.00457
       3     0 Women Sing~     0  3.75     6  0.282   0.0619  -1.50      -1.50 0.00368
       4     0 Men   Marr~     1  1.18     3  0.380   0.0733  -1.57      -1.58 0.00572
       5     0 Women Sing~     0  3.75    26  0.776   0.0681  -1.91      -1.92 0.00788
       6     0 Women Marr~     2  3.59     2 -0.0386  0.0944  -1.29      -1.29 0.00613
       7     0 Women Sing~     0  3.19     3  0.202   0.0610  -1.44      -1.44 0.00330
       8     0 Men   Marr~     2  2.96     4  0.233   0.0760  -1.46      -1.47 0.00526
       9     0 Men   Sing~     0  4.62     6  0.519   0.0764  -1.68      -1.69 0.00721
      10     0 Women Marr~     0  1.25     0  0.267   0.0795  -1.49      -1.49 0.00598
      # ... with 905 more rows, and 1 more variable: .cooksd <dbl>

---

    Code
      augment(M_bioChem, type.predict = "response")
    Output
      # A tibble: 915 x 11
           art fem   mar    kid5   phd  ment .fitted .resid .std.resid    .hat .cooksd
         <int> <fct> <fct> <dbl> <dbl> <int>   <dbl>  <dbl>      <dbl>   <dbl>   <dbl>
       1     0 Men   Marr~     0  2.52     7   1.98   -1.83      -1.83 0.00481 1.22e-3
       2     0 Women Sing~     0  2.05     6   1.30   -1.49      -1.49 0.00457 7.27e-4
       3     0 Women Sing~     0  3.75     6   1.33   -1.50      -1.50 0.00368 5.95e-4
       4     0 Men   Marr~     1  1.18     3   1.46   -1.57      -1.58 0.00572 1.03e-3
       5     0 Women Sing~     0  3.75    26   2.17   -1.91      -1.92 0.00788 2.25e-3
       6     0 Women Marr~     2  3.59     2   0.962  -1.29      -1.29 0.00613 7.17e-4
       7     0 Women Sing~     0  3.19     3   1.22   -1.44      -1.44 0.00330 4.90e-4
       8     0 Men   Marr~     2  2.96     4   1.26   -1.46      -1.47 0.00526 8.10e-4
       9     0 Men   Sing~     0  4.62     6   1.68   -1.68      -1.69 0.00721 1.52e-3
      10     0 Women Marr~     0  1.25     0   1.31   -1.49      -1.49 0.00598 9.57e-4
      # ... with 905 more rows

---

    Code
      augment(M_bioChem, type.predict = "response", se_fit = TRUE)
    Output
      # A tibble: 915 x 12
           art fem   mar    kid5   phd  ment .fitted .se.fit .resid .std.resid    .hat
         <int> <fct> <fct> <dbl> <dbl> <int>   <dbl>   <dbl>  <dbl>      <dbl>   <dbl>
       1     0 Men   Marr~     0  2.52     7   1.98   0.112   -1.83      -1.83 0.00481
       2     0 Women Sing~     0  2.05     6   1.30   0.0904  -1.49      -1.49 0.00457
       3     0 Women Sing~     0  3.75     6   1.33   0.0821  -1.50      -1.50 0.00368
       4     0 Men   Marr~     1  1.18     3   1.46   0.107   -1.57      -1.58 0.00572
       5     0 Women Sing~     0  3.75    26   2.17   0.148   -1.91      -1.92 0.00788
       6     0 Women Marr~     2  3.59     2   0.962  0.0908  -1.29      -1.29 0.00613
       7     0 Women Sing~     0  3.19     3   1.22   0.0747  -1.44      -1.44 0.00330
       8     0 Men   Marr~     2  2.96     4   1.26   0.0959  -1.46      -1.47 0.00526
       9     0 Men   Sing~     0  4.62     6   1.68   0.128   -1.68      -1.69 0.00721
      10     0 Women Marr~     0  1.25     0   1.31   0.104   -1.49      -1.49 0.00598
      # ... with 905 more rows, and 1 more variable: .cooksd <dbl>

---

    Code
      augment(M_bioChem, newdata = newdataframe, se_fit = TRUE)
    Output
      # A tibble: 1 x 7
        fem   mar      kid5   phd  ment .fitted .se.fit
        <chr> <chr>   <dbl> <dbl> <dbl>   <dbl>   <dbl>
      1 Women Married     2     3     8   0.104  0.0894

---

    Code
      augment(M_bioChem, newdata = newdataframe, type.predict = "response")
    Output
      # A tibble: 1 x 6
        fem   mar      kid5   phd  ment .fitted[,1]
        <chr> <chr>   <dbl> <dbl> <dbl>       <dbl>
      1 Women Married     2     3     8        1.11

---

    Code
      augment(M_bioChem, newdata = newdataframe, type.predict = "response", se_fit = TRUE)
    Output
      # A tibble: 1 x 7
        fem   mar      kid5   phd  ment .fitted .se.fit[,1]
        <chr> <chr>   <dbl> <dbl> <dbl>   <dbl>       <dbl>
      1 Women Married     2     3     8    1.11      0.0992

---

    Code
      augment(M_bioChem, type.residuals = "pearson")
    Output
      # A tibble: 915 x 11
           art fem   mar    kid5   phd  ment .fitted .resid .std.resid    .hat .cooksd
         <int> <fct> <fct> <dbl> <dbl> <int>   <dbl>  <dbl>      <dbl>   <dbl>   <dbl>
       1     0 Men   Marr~     0  2.52     7  0.682  -1.23      -1.23  0.00481 1.22e-3
       2     0 Women Sing~     0  2.05     6  0.265  -0.973     -0.975 0.00457 7.27e-4
       3     0 Women Sing~     0  3.75     6  0.282  -0.982     -0.983 0.00368 5.95e-4
       4     0 Men   Marr~     1  1.18     3  0.380  -1.03      -1.04  0.00572 1.03e-3
       5     0 Women Sing~     0  3.75    26  0.776  -1.30      -1.30  0.00788 2.25e-3
       6     0 Women Marr~     2  3.59     2 -0.0386 -0.833     -0.835 0.00613 7.17e-4
       7     0 Women Sing~     0  3.19     3  0.202  -0.941     -0.943 0.00330 4.90e-4
       8     0 Men   Marr~     2  2.96     4  0.233  -0.957     -0.959 0.00526 8.10e-4
       9     0 Men   Sing~     0  4.62     6  0.519  -1.12      -1.12  0.00721 1.52e-3
      10     0 Women Marr~     0  1.25     0  0.267  -0.974     -0.977 0.00598 9.57e-4
      # ... with 905 more rows

