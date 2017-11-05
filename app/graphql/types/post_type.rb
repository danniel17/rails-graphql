Types::PostType = GraphQL::ObjectType.define do
    name "Post"
    field :id, types.Int
    field :title, types.String
    field :content, types.String
    field :userId, types.Int, property: :user_id
    field :author, types.String do

        resolve -> (obj,args,ctx) {
           author = User.find(obj.user_id)
           author[:email]
        }
    end
    field :comments, types[Types::CommentType] do

        resolve -> (obj, args, ctx) {
            comments = Comment.where(post_id: obj.id)
            comments
        }
    end
end