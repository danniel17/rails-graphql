u1 = User.create firstName: 'Daniel', lastName:'Bonfim', email:'dannielbomfim4@gmail.com', password:'123456'
u2 = User.create firstName: 'Fake', lastName:'User', email:'fake@gmail.com', password:'123456'

p1 = Post.create user: u1, title: 'First Post!', content: 'This is the first post here.'
p2 = Post.create user: u1, title: 'Second Post!', content: 'Yes, we still here.'
p3 = Post.create user: u1, title: 'Third one!', content: 'hi people.'

c1 = Comment.create user: u2, post: p1, content: 'Aweeessooome.'
c2 = Comment.create user: u1, post: p1, content: 'Nice.'
c3 = Comment.create user: u2, post: p2, content: 'I looove it.'
c4 = Comment.create user: u1, post: p2, content: 'Hate it.'
c5 = Comment.create user: u1, post: p3, content: 'HIIII.'