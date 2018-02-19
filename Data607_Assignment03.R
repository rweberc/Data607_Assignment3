library(stringr)

# Raw string
raw.data <-"555-1239Moe Szyslak(636) 555-0113Burns, C. Montgomery555-6542Rev. Timothy Lovejoy555 8904Ned Flanders636-555-3226Simpson, Homer5553642Dr. Julius Hibbert"

# Extract names
names <- unlist(str_extract_all(raw.data, "([[:alpha:]., ]){2,}"))

# 1. 

# Keep titles only

# If value contains ",", then switch the order of first and last
ifelse(str_detect(names, ","), 
                str_c(str_extract(names, "[:word:]+$"), " ", str_extract(names,"^[:word:]+\\b")),
                names)

# Remove titles
# Remove middle initials and/or Titles
firstLast <- unlist(str_replace_all(names, "[:alpha:]+\\. ", ""))

# If value contains ",", then switch the order of first and last
ifelse(str_detect(firstLast, ","), 
       str_c(str_extract(firstLast, "[:word:]+$"), " ", str_extract(firstLast,"^[:word:]+\\b")),
       firstLast)

# 2. Logical vector of names with a title

str_detect(names, "^[:alpha:]+\\. ")

# 3. Assuming "second name" means middle name
str_detect(names, "[^.] [:alpha:]+\\.? ")

str_detect(",", "(\\.)")


# 4
a. [0-9]+\\$ 
  - Numbers followed by a dollar sign (prices in dollars?)
  str_detect("1234$", "[0-9]+\\$")

b. \\b[a-z]{1,4}\\b 
 - presence of a single lowercase letter in a string
  str_detect(" a ", "\\b[a-z]\\b")
  str_detect("z", "\\b[a-z]\\b")


c. .*?\\.txt$ 
  - text file document name
  str_detect("temp.txt", ".*?\\.txt$")
  str_detect("doc.temp.txt", ".*?\\.txt$")
  
d. \\d{2}/\\d{2}/\\d{4}
  - mdy or dmy dates
  str_detect("12/31/1980", "\\d{2}/\\d{2}/\\d{4}")
  str_detect("31/12/1980", "\\d{2}/\\d{2}/\\d{4}")
  
e. <(.+?)>.+?</\\1> # Not clear to me what the first "?" adds, or the case where ".+?" is more restrictive than ".+"
  - whole xml tag sequence with sometime in between
  str_extract_all("<html><abc></abc></html>", "<(.+?)>.+?</\\1>")
  str_extract_all("<html><abc>asdf</abc></html>", "<(.+?)>.+?</\\1>")
  str_extract_all("<html> </html>", "<(.+?)>.+?</\\1>")
  str_extract_all("<html> </html>", "<(.+?)>.*</\\1>")
  str_extract_all("<html><script>asdf</script><body><text>def</text></body></html>", "<(.+)>.+</\\1>")
  

9.  # no solution...

code <- "clcopCow1zmstc0d87wnkig7OvdicpNuggvhryn92Gjuwczi8hqrfpRxs5Aj5dwpn0TanwoUwisdij7Lj8kpf03AT5Idr3coc0bt7yczjatOaootj55t3Nj3ne6c4Sfek.r1w1YwwojigOd6vrfUrbz2.2bkAnbhzgv4R9i05zEcrop.wAgnb.SqoU65fPa1otfb7wEm24k6t3sR9zqe5fy89n6Nd5t9kc4fE905gmc4Rgxo5nhDk!gr"

# Inspect
nums <- unlist(str_extract_all(code, "[:digit:]+|[:punct:]+"))
nums

letters <- unlist(str_extract_all(code, "[:alpha:]+"))
letters

# Do numbers point to letters in the string?
# 905 much larger than string length
str_length(str_c(letters, collapse=""))

capLetters <- str_extract_all(code, "[A-Z]")
capLetters

oh

LKJLgKASJDeFOIJOOIeJGNOIAJtSDOFhINUAOaPSFInUOkDsJ






