# Testing inference

    Code
      update(M_bioChem.full, . ~ . - phd)
    Output
      
      Call: glm.izip(formula = art ~ fem + mar + kid5 + ment, data = bioChemists)
      
      Linear Model Coefficients:
      (Intercept)     femWomen   marMarried         kid5         ment  
         0.356620    -0.229230     0.156560    -0.189560     0.024839  
      
      Baseline Zero-inflation odds (nu): 0.286
      Degrees of Freedom: 914 Total (i.e. Null);  910 Residual
      Null Deviance: 1542.754 
      Residual Deviance: 
      AIC: 3238.432 
      

---

    Code
      update(M_bioChem.full2, . ~ . - phd)
    Output
      
      Call: glm.izip(formula = art ~ fem + mar + kid5 + ment, data = bioChemists)
      
      Linear Model Coefficients:
      (Intercept)     femWomen   marMarried         kid5         ment  
         0.356620    -0.229230     0.156560    -0.189560     0.024839  
      
      Baseline Zero-inflation odds (nu): 0.286
      Degrees of Freedom: 914 Total (i.e. Null);  910 Residual
      Null Deviance: 1542.754 
      Residual Deviance: 
      AIC: 3238.432 
      

---

    Code
      iziplrtest(M_bioChem.full, M.bioChem.null)
    Output
      
      Likelihood ratio test for testing both iZIP models are equivalent
      LRT-statistic:  0.111 
      Chi-sq degrees of freedom:  1 
      P-value:  0.739 

---

    Code
      confint(M_bioChem.full)
    Output
                        2.5 %      97.5 %
      (Intercept)  0.09261810  0.55651638
      femWomen    -0.35207646 -0.10516958
      marMarried   0.02051290  0.29726928
      kid5        -0.28028826 -0.09879790
      phd         -0.04917707  0.06941332
      ment         0.02042481  0.02894963

---

    Code
      confint(M_bioChem.full, param = "ment", level = 0.9)
    Output
                          5 %        95 %
      (Intercept)  0.12990939  0.51922509
      femWomen    -0.33222841 -0.12501762
      marMarried   0.04276045  0.27502173
      kid5        -0.26569884 -0.11338733
      phd         -0.03964397  0.05988022
      ment         0.02111009  0.02826435

