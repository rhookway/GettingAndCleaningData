library(dplyr)

file.name = function(dataset.name, dataset.table) {
  file.path(dataset.name, paste(dataset.table, '_', dataset.name, '.txt', sep =''))
}

load.dataset = function(dataset.name, f, al) {
  X.path <- file.name(dataset.name, 'X')
  X <- read.table(X.path, col.names = f)
  fkeep <- regexpr('(mean\\(\\)|std\\(\\))(-X|-Y|-Z)?$', f) != -1
  X <- X[,fkeep]
  subjects.path <- file.name(dataset.name, 'subject')
  subjects <- read.table(subjects.path, header=FALSE)
  subjects <- subjects[[1]]
  y.path <- file.name(dataset.name, 'y')
  y <- read.table(y.path, header=FALSE)
  y <- y[[1]]
  y <- sapply(y, function(x) al[x])
  cbind(subject = subjects, activity = y, X)
}

get.rawdata = function() {
  features <- read.table('features.txt')
  f <- features[[2]]
  activity_labels <- read.table('activity_labels.txt')
  al <- activity_labels[[2]]
  X_test <- load.dataset('test', f, al)
  X_train <- load.dataset('train', f, al)
  rbind(X_test, X_train)
}

run.analysis = function() {
  X <- get.rawdata()
  R <- summarise_each(group_by(X, subject, activity), 'mean')
  n <- names(R)
  n <- c(n[1:2], sapply(n[3:length(n)], function (x) paste('M', x, sep='')))
  names(R) <- n
  R
}