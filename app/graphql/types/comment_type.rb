Types::CommentType = GraphQL::ObjectType.define do
  name "CommentType"
  
  

  field :content, types.String
  field :author, types.String do

   resolve -> (obj, args, ctx) {
      author = User.find(obj.user_id)
      author[:email]
   }
  end
  field :userId, types.Int, property: :user_id
  field :postId, types.Int, property: :post_id
end
