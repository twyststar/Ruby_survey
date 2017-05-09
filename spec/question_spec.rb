require('spec_helper')

describe(Question) do
  describe("#survey") do
    it("tells which survey it belongs to") do
      test_survey = Survey.create({:name => "Kitten preference"})
      test_question1 = Question.create({:q_text => "Do you prefer a black or white kitten?", :survey_id => test_survey.id()})
      expect(test_question1.survey()).to(eq(test_survey))
    end
  end

  it("validates presence of description") do
    @question = Question.new({:q_text => ""})
    expect(@question.save()).to(eq(false))
  end
end
