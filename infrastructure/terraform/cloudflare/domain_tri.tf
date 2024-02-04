module "cf_domain_mono" {
  source     = "./modules/cf_domain"
  domain     = "tripranata.com"
  account_id = cloudflare_account.monosense.id
  dns_entries = [
    {
      name  = "ipv4"
      value = local.home_ipv4
    },
    {
      id      = "vpn"
      name    = module.onepassword_item_cloudflare.fields["vpn-subdomain"]
      value   = "ipv4.tripranata.com"
      type    = "CNAME"
      proxied = false
    },
    # Generic settings
    {
      name  = "_dmarc"
      value = "v=DMARC1; p=quarantine;"
      type  = "TXT"
    },
    # MX
    {
      id       = "migadu_mx_1"
      name     = "@"
      priority = 10
      value    = "aspmx1.migadu.com"
      type     = "MX"
    },
    {
      id       = "migadu_mx_2"
      name     = "@"
      priority = 20
      value    = "aspmx2.migadu.com"
      type     = "MX"
    },
    {
      id      = "migadu_dkim_1"
      name    = "key1._domainkey"
      value   = "key1.bjw-s.dev._domainkey.migadu.com."
      type    = "CNAME"
      proxied = false
    },
    {
      id      = "migadu_dkim_2"
      name    = "key2._domainkey"
      value   = "key2.bjw-s.dev._domainkey.migadu.com."
      type    = "CNAME"
      proxied = false
    },
    {
      id      = "migadu_dkim_3"
      name    = "key3._domainkey"
      value   = "key3.bjw-s.dev._domainkey.migadu.com."
      type    = "CNAME"
      proxied = false
    },
    {
      id    = "migadu_spf"
      name  = "@"
      value = "v=spf1 include:spf.migadu.com -all"
      type  = "TXT"
    },
    {
      id    = "migadu_verification"
      name  = "@"
      value = "hosted-email-verify=sjpcto0x"
      type  = "TXT"
    },
    # Mailgun settings
    {
      id       = "mailgun_mx_1"
      name     = "mg"
      priority = 10
      value    = "mxa.eu.mailgun.org"
      type     = "MX"
    },
    {
      id       = "mailgun_mx_2"
      name     = "mg"
      priority = 50
      value    = "mxb.eu.mailgun.org"
      type     = "MX"
    },
    {
      id    = "mailgun_dkim_1"
      name  = "mta._domainkey.mg"
      value = "k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA01bXkhzb3ANETaXVWO2ODDiakyOoBLS+JfOBqKr70QG40jcUi4QXg2FTWx6pn2fo1enXCm9YIFglSjaJaWp+QBJ9vWIE6ALzKzuE+MKLNSZhaoi8fdGkSM8SC/qXJxcckIpmgVpzA/V89OGZ1rcEKWZqfaSH49KwSyHEWXgZy//G7LQot5NNwPNdJxh9V+nQfd/NxP2qR2t378iX2nE2Rcwgv+mx1ccv73Cy5TeE1+rsag3kTCJTMikB4oJa+tWqr+rav23Z4aYiAZSQyrh/ccQzZGizLtEvZB/OU+IFe36BYdGuBO5N4Ca/rJ/onm72qZcfCmlH1jT0zRBGygxNOQIDAQAB"
      type  = "TXT"
    },
    {
      id    = "mailgun_spf"
      name  = "mg"
      value = "v=spf1 include:mailgun.org ~all"
      type  = "TXT"
    }
  ]

  waf_custom_rules = [
    {
      enabled     = true
      description = "Firewall rule to block bots and threats determined by CF"
      expression  = "(cf.client.bot) or (cf.threat_score gt 14)"
      action      = "block"
    },
    {
      enabled     = true
      description = "Firewall rule to block certain countries"
      expression  = "(ip.geoip.country in {\"CN\" \"IN\" \"KP\" \"RU\"})"
      action      = "block"
    },
  ]
}
