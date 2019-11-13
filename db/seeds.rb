Message.destroy_all
UserChat.destroy_all
User.destroy_all
Chat.destroy_all



matt = User.create!(username: 'matjocampbell', age: 22, active: true, cool_points: 1000)
nicci = User.create!(username: 'niccihustle', age: 24, active: false)
crispy = User.create!(username: 'crisPy', age: 32, active: true)


chat_1 = Chat.create!(chat_type: 'thread', host_id: matt.id, name: 'First LitChat')
chat_2 = Chat.create!(chat_type: 'DM')


user_chat_1 = UserChat.create!(user_id: matt.id, chat_id: chat_1.id)
user_chat_2 = UserChat.create!(user_id: nicci.id, chat_id: chat_1.id)
user_chat_3 = UserChat.create!(user_id: crispy.id, chat_id: chat_1.id)

user_chat_4 = UserChat.create!(user_id: matt.id, chat_id: chat_2.id)
user_chat_5 = UserChat.create!(user_id: nicci.id, chat_id: chat_2.id)


msg_1 = Message.create!(chat_id: chat_1.id, user_id: matt.id, content: 'Hello World!')
msg_2 = Message.create!(chat_id: chat_1.id, user_id: nicci.id, content: 'Goodbye Mars!')
msg_3 = Message.create!(chat_id: chat_1.id, user_id: crispy.id, content: 'Where Am I At?')

msg_4 = Message.create!(chat_id: chat_2.id, user_id: matt.id, content: "Who is this 'crispy' fellow?")
msg_5 = Message.create!(chat_id: chat_2.id, user_id: nicci.id, content: "I do not know my fair sir.")

