# code I didn't use

sens_almond$prcc

# add columns containing parameter values to dataframe
resd_merge <- resd %>% 
  mutate(Pcoeff1 = sens_pars$Pcoeff1) %>% 
  mutate(Pcoeff2 = sens_pars$Pcoeff2)

# plot results
# precip coeff 1 + sd
a = ggplot(resd_merge, aes(Pcoeff1, sdyield)) + 
  geom_point() + 
  labs(y="SD", "Pcoeff1") +
  stat_smooth(method="lm", col="blue")

# precip coeff 2 + sd
b = ggplot(resd_merge, aes(Pcoeff2, sdyield)) +
  geom_point() +
  labs(y="SD", "Pcoeff2") +
  stat_smooth(method="lm", col="red")

# precip coeff 1 + mean
c = ggplot(resd_merge, aes(Pcoeff1, meanyield)) +
  geom_point() +
  labs(y="Mean", "Pcoeff1") +
  stat_smooth(method="lm", col="blue")

# precip coeff 2 + mean
d = ggplot(resd_merge, aes(Pcoeff2, meanyield)) +
  geom_point() +
  labs(y="Mean", "Pcoeff2") +
  stat_smooth(method="lm", col="red")

# put graphs together
(a + b) / (c + d)

# add uncertainty bounds on our estimates
tmp = resd %>% gather(value="value", key="yield")
ggplot(tmp, aes(yield, value, col=yield))+geom_boxplot()+labs(y="Yield (as anomoly)")