#### Sergio Samayoa  
#### portfolio:  **ZenCodeMaster.com**  
#### resume:  **bitbucket.org/wowiamhere/coding-resume**  

Employment submission for **Jungle Coders**  

Root is the Devise's Sign In page 
This displays list of contacts with options to:  
- view
- edit
- delete
- archive

### Dateabase
- Postgres  
- config/database.yml

### Devise
- Devise for authentication   
- Devise Login page is root  
- Upon successful login redirects to `ContactsController#index`  

### Tests
- Factory_rails factories
  + spec/factories

- Contacts Model
  + tested email uniqueness
  + tested name presence

- Capybara test
  + spec/features/sign_up_spec.rb

### views (responsiveness/bootstrap)
- /shared folder for partials for rendering
- Devise views refractored for responsiveness
  + including app/views/users/sessions/new.html.erb (Devise controller generated)
- /contacts 
  + index.html.erb  
  + new.html.erb
  + edit.html.erb
  + show.html.erb

### Models
- Contacts
- User (Devise generated)
- associations present (tested for Contacts)

### Helpers
- app/helpers/conatcts_helper#get_age(some_date)
  + convert birthdate to age

### Controllers
- ContactsController
  + #reactivate_contact (archiving)
  + #deactivate_contact (archiving)

### Search Capabilities
- ContactsController#search_contacts
  + takes user input (not sanitized) from app/views/contacts/index.html.erb
  + searches for user.name
  + renders results reusing #indes and @contacts

### CSV capabilities
- for each contact
- for all contacts by user