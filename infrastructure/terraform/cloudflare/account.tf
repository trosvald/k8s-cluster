resource "cloudflare_account" "monosense" {
  name              = "monosense Account"
  type              = "standard"
  enforce_twofactor = false
}
