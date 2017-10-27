Types::UserType = GraphQL::ObjectType.define do 
    name "User"
    
    description "A User"
    field :id, types.String
    field :email, types.String
    field :firstName, types.String
    field :lastName, types.String
end