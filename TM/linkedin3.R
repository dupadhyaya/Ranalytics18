#Linked In posts - Note Working

# Get a person's name, location, summary, # of connections, and skills & endorsements from LinkedIn

# URL of the LinkedIn page 
user_url <- "https://www.linkedin.com/in/dhiraj-upadhyaya-4b7161a"

# since the information isn't available without being logged in, the web
# scraper needs to log in. Provide your LinkedIn user/pw here (this isn't stored
# anywhere as you can see, it's just used to log in during the scrape session)
username <- "xxxx"
password <- "xxx"

# takes a couple seconds and might throw a warning, but ignore the warning
(linkedin_info <- scrape_linkedin(user_url))

############################

library(rvest)

scrape_linkedin <- function(user_url) {
  linkedin_url <- "http://linkedin.com/"
  pgsession <- html_session(linkedin_url) 
  pgform <- html_form(pgsession)[[1]]
  filled_form <- set_values(pgform,
                            session_key = username, 
                            session_password = password)
  
  submit_form(pgsession, filled_form)
  
  pgsession <- jump_to(pgsession, user_url)
  page_html <- read_html(pgsession)
  
  name <-
    page_html %>% html_nodes("#name") %>% html_text()
  
  location <-
    page_html %>% html_nodes("#location .locality") %>% html_text()
  
  num_connections <-
    page_html %>% html_nodes(".member-connections strong") %>% html_text()
  
  summary <- 
    page_html %>% html_nodes("#summary-item-view") %>% html_text()
  
  skills_nodes <-
    page_html %>% html_nodes("#profile-skills .skill-pill")
  
  skills <-
    lapply(skills_nodes, function(node) {
      num <- node %>% html_nodes(".num-endorsements") %>% html_text()
      name <- node %>% html_nodes(".endorse-item-name-text") %>% html_text()
      data.frame(name = name, num = num)
    })
  
  skills <- do.call(rbind, skills)
  
  
  list(
    name = name,
    location = location,
    num_connections = num_connections,
    summary = summary,
    skills = skills
  ) 
}

(linkedin_info <- scrape_linkedin(user_url))
linkedin_info
