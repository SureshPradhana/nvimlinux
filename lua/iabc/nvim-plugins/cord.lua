return {
	'vyfor/cord.nvim',
	build = ':Cord update',
	opts = {
		text = {
			workspace = 'In workspace', -- This overrides the default for workspace
			-- other fields not specified will use the default value
		}

	}
}
