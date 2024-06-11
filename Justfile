contract := "sample-crate-in-submodule-3.testnet"

# cleanup in symlinked dir
create-dev-acc:
    near account create-account sponsor-by-faucet-service {{contract}} autogenerate-new-keypair save-to-keychain network-config testnet create

deploy: create-dev-acc
    cd self-updates/update && cargo near deploy {{contract}} without-init-call network-config testnet sign-with-keychain send

test-meta:
    near contract call-function as-read-only {{contract}} contract_source_metadata json-args {} network-config testnet now

