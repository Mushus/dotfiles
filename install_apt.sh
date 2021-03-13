if ! type htop > /dev/null 2>&1; then
	curl -fsSL https://starship.rs/install.sh | bash -s -- -y
fi

