class Note < ApplicationRecord
  belongs_to :event

  belongs_to :manager, optional: true
  belongs_to :report, optional: true

  validates :content, presence: true
  validate :manager_or_report

  after_create_commit do
    broadcast_append_to(
      :notes,
      target: "notes-list",
      html: ApplicationController.render(partial: 'events/event_note', locals: { note: self })
    )
  end

  def creator
    manager || report
  end

  private

  def manager_or_report
    return if manager || report

    errors.add(:base, 'Note must belong to a manager or a report')
  end
end

