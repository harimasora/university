class ActiveStatus < EnumerateIt::Base
  associate_values(
      :inactive => 0,
      :active => 1
  )

  sort_by :translation
end