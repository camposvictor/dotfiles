session_root "~/dev/seplan/piaui-365-next"

if initialize_session "piaui-365"; then

	new_window "editor"
	run_cmd "nvim ."

	new_window "git"
	run_cmd "lazygit"

	new_window "dev"
	run_cmd "pnpm dev"
	split_h 50

	select_window 1

fi

finalize_and_go_to_session
