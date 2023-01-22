class CrudNotificationMailer < ApplicationMailer
  def create_notification(object)
    @object = object
    @object_count = object.class.count

    mail to: 'admin@example.com', subject: "A new entry for #{object.class} has been created"
  end

  def update_notification; end

  def delete_notification; end
end
