# Modulepacks names:
NAME_MARIO2				= tfm.lua/nnaaaz_mario2.tfm.lua.txt
NAME_MARIO2_EXT			= tfm.lua/nnaaaz_mario2_ext.tfm.lua.txt
ALL_NAMES				= $(NAME_MARIO2) $(NAME_MARIO2_EXT)


# Rules:
all: $(ALL_NAMES)

tfm.lua/%tfm.lua.txt:
	@printf "\e[92m Generating %s\n" $@ || true
	@printf "\e[94m" || true
	mkdir tfm.lua || true
	./pshy_merge/combine.py pshy_merge.lua -- pshy_essentials.lua -- $(patsubst tfm.lua/%.tfm.lua.txt, %.lua, $@) >> $@
	@printf "\e[0m" || true

.PHONY: clean
clean:

.PHONY: fclean
fclean: clean
	@printf "\e[91m" || true
	rm -rf tfm.lua/*.tfm.lua.txt
	@printf "\e[0m" || true

.PHONY: re
re: fclean all
