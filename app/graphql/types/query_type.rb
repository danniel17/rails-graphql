Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :testField, types.String do
    description "An example field added by the generator"
    resolve ->(obj, args, ctx) {
      "Hello World!"
    }
  end
  field :usuario, types[Types::UserType] do
    argument :id, types.String
    
    resolve -> (obj,args,ctx) {
      if args[:id]
        User.where(id: args[:id])
      else
        User.all.map {|x| x} 
      end
    }
  end

  field :post, types[Types::PostType] do 
    argument :id, types.String
    resolve -> (obj,args,ctx) {
      if args[:id]
        Post.where(id: args[:id])
      else
        Post.all.map {|x| x}
      end
    }
  end

end
