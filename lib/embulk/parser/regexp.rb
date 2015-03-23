require "date"

module Embulk
  module Parser

    class RegexpParserPlugin < ParserPlugin
      Plugin.register_parser("regexp", self)

      def self.transaction(config, &control)
        # configuration code:
        task = {
          "format" => config.param("format", :string),
          "field_types" => config.param("field_types", :array),
        }
        p task

=begin
        columns = [
          Column.new(0, "example", :string),
          Column.new(1, "column", :long),
          Column.new(2, "name", :double),
        ]
=end

        columns = task["field_types"].each_with_index.map do |c,i|
          Column.new(i, c["name"], c["type"].to_sym)
        end

        yield(task, columns)
      end

      def init
        # initialization code:
        @regexp = Regexp.new task["format"]
        @field_types = task["field_types"]
      end

      def run(file_input)
        decoder_task = @task.load_config(Java::LineDecoder::DecoderTask)
        decoder = Java::LineDecoder.new(file_input.instance_eval { @java_file_input }, decoder_task)
        record = []
        while decoder.nextFile
          while line = decoder.poll
            m = @regexp.match line
            task["field_types"].each do |v|
              if v["type"] == "timestamp"
                record << DateTime.strptime(m[v["name"]], '%d/%b/%Y:%T %z').to_time
              else
                record << m[v["name"]]
              end

            end
          end
          page_builder.add record
        end
=begin
        while file = file_input.next_file
          file.each do |buffer|
            # parsering code
            record = ["col1", 2, 3.0]
            page_builder.add(record)
          end
        end
=end
        page_builder.finish
      end
    end

  end
end
