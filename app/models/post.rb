class Post < ApplicationRecord
    validates :title, presence: {message:"タイトルを入力してください"}
    validate :title_length
    validates :start_date, presence: {message:"開始日を入力してください"}
    validates :end_date, presence: {message:"終了日を入力してください"}
    validate :start_end_check
    validate :memo_length

    def start_end_check
        return unless start_date.present? && end_date.present?
        if end_date < start_date
          errors.add(:end_date,"終了日は開始日より前の日付では設定できません")
        end
    end

    def title_length
        return unless title.present?
        if title.length > 20
            errors.add(:title,"タイトルは20文字以内で入力してください")
        end
    end

    def memo_length
        return unless memo.present?
        if memo.length > 500
            errors.add(:memo,"スケジュールメモは500文字以内で入力してください")
        end
    end

    def self.posts_count
        count
    end


end
