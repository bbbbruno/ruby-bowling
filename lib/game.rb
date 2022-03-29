# frozen_string_literal: true

# ボウリングゲームを表すクラス。記録の保持とスコアの計算を行う。
class Game
  START_FRAME = 1
  START_INDEX = 0
  LAST_FRAME = 10

  def initialize(records)
    @throws = records.split(',').map { |record| record == 'X' ? 10 : record.to_i }
  end

  def score
    all_frames_score(START_FRAME, START_INDEX)
  end

  private

  # 現在何フレーム目かとフレームの開始インデックスを与えると、そのフレームから最後のフレームまでの合計スコアを求める。
  def all_frames_score(frame, index)
    return 0 if frame > LAST_FRAME

    current_frame_score = frame_score(frame, index)
    next_frame = frame + 1
    next_index = strike?(frame, index) ? index + 1 : index + 2

    current_frame_score + all_frames_score(next_frame, next_index)
  end

  def frame_score(frame, index)
    score = @throws[index] + @throws[index + 1]
    score += @throws[index + 2].to_i if last_frame?(frame) || spare?(frame, index) || strike?(frame, index)
    score
  end

  def last_frame?(frame)
    frame == LAST_FRAME
  end

  def spare?(frame, index)
    !last_frame?(frame) && @throws[index] + @throws[index + 1] == 10
  end

  def strike?(frame, index)
    !last_frame?(frame) && @throws[index] == 10
  end
end
