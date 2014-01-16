function fish_greeting
	if type fortune_comics >/dev/null 2>&1
    fortune_comics
  else if type fortune >/dev/null 2>&1
    fortune -so
  end
end
