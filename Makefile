unit:
	conftest test -p test/unit/droplet.rego droplet.tf
	conftest test -p test/unit/version.rego version.tf
	conftest test -p test/unit/variables.rego variables.tf
