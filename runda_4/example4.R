# load all packages
library(e1071)
library(text2vec)
library(data.table)

# Load data
data=read.csv(???)
str(data)
setDT(data)
setkey(data, idklienta)
set.seed(2016L)
all_ids = data$id

traint_ratio=???
train_ids = sample(all_ids, length(all_ids)*traint_ratio)
test_ids = setdiff(all_ids, train_ids)
train = data[J(train_ids)]
test = data[J(test_ids)]



# define preprocessing function and tokenization fucntion
prep_fun = tolower
tok_fun = word_tokenizer

it_train = itoken(???, 
                  preprocessor = prep_fun, 
                  tokenizer = tok_fun, 
                  ids = ???, 
                  progressbar = FALSE)
vocab = create_vocabulary(it_train)



vectorizer = vocab_vectorizer(vocab)
dtm_train = create_dtm(it_train, vectorizer)
print(dim(dtm_train))


model <- naiveBayes(???)
print(model)



#Evaluate model

it_test = itoken(test$korespondencja, 
                 preprocessor = prep_fun, 
                 tokenizer = tok_fun, 
                 ids = test$idklienta, 
                 progressbar = FALSE)

dtm_test = create_dtm(it_test, vectorizer)



preds <- predict(???)
print(glmnet:::auc(test$windykacja, preds))


'''
See more:
  https://cran.r-project.org/web/packages/text2vec/vignettes/text-vectorization.html
  Stop words
  N-grams
  TF-IDF
'''
