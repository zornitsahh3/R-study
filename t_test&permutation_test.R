drug <- c(3,4,3,5,4,3,4,45,4,5)
placebo <- c(7,8,7,9,8,7,8,60,8,8)
length(drug)
mean(drug)
mean(placebo)
original_diff<-mean(drug)-mean(placebo)
original_diff
t.test(drug,placebo,var.equal=TRUE)

#we remove the outliers from each of the samples drug-placebo
drug<-drug[-8]
placebo<-placebo[-8]
mean(drug)
mean(placebo)
t.test(drug,placebo,var.equal=TRUE)

#implement the permutataion test idea
all_drugs<-c(drug,placebo)
number_of_tests<-100
permutation_diffs<-numeric(number_of_tests)
for (i in 1:number_of_tests){
  permutation<-sample(all_drugs)
  drug_permutation<-permutation[1:10]
  placebo_permutation<-permutation[11:20]
  permutation_diffs[i]<-mean(drug_permutation)-mean(placebo_permutation)
}
permutation_diffs

p_value <- sum(abs(permutation_diffs) >= abs(original_diff)) / number_of_tests
p_value
