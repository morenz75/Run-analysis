fixedlenghtvector <- vector(mode="numeric", length=0)
for (k in 1:561) {
        fixedlenghtvector <- append(fixedlenghtvector, c(-1, 15))
}

traindata <- read.fwf(file.path("data", "train", "X_train.txt"), widths = fixedlenghtvector, header= FALSE)
testdata <- read.fwf(file.path("data", "test", "X_test.txt"), widths = fixedlenghtvector, header= FALSE)

#fixedlenghtvector <-vector(mode="numeric", length=0)

