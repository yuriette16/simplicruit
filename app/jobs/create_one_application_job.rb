class CreateOneApplicationJob < ApplicationJob
  def perform(postion_id)
    sleep(3)
    puts "application creating..."
    positions = JobApplication.create(
      candidate_name: 'Linlu Liu',
      email: 'linlu606@yahoo.com',
      address: '1-chōme-2 Takadanobaba, Shinjuku City, Tōkyō-to 169-0075',
      phone: '020-1231-2492',
      gender: 'female',
      position_id: postion_id
    )
    puts "finish created"

    puts "sending email"
    application = JobApplication.last
    NotificationMailer.video_record(application).deliver
    puts "all done"
  end
end
