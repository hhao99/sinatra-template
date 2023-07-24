Sequel.migratrion do
    change do
        create table :users do
            primary_key :id
            String :username
            String firstname
            String lastname
            String email
            String password
        end
    end
end