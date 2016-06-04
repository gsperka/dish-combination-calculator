class OutputDouble
  def messages
    @messages ||= []
  end
  def puts(message)
    messages << message
  end
end

def output_double
  @output ||= OutputDouble.new
end

def validate_incrementally(find_in, find, index)
  index ||= 0
  failure_message = "expected: #{find}\n" +
                    "     got: #{find_in[index..-1]}\n" +
                    ">= index: #{index}\n" +
                    "      in: #{find_in}\n"
  find_in[index..-1].should include(find), failure_message
  i = find_in[index..-1].index(find)
  index += i + 1 unless i.nil?
  index
end

Given /^the input:$/ do |input|
  @input = input
end

When /^I start a program$/ do
  @messenger = StringIO.new
  controller = Orders::OrderController.new(@input, output_double)
  controller.call
  @menu = controller.menu
end

Then /^the summary should include "(.*?)"$/ do |output_line|
  expect(output_double.messages.join(' ')).to eql output_line
end
