terraform {
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
    }
  }
}

# Configure the New Relic provider
provider "newrelic" {
  account_id = 3930396
  api_key = "NRAK-Z4QE9XQQUZB16JYI5AU38B4UDK3"   # Usually prefixed with 'NRAK'
  region = "US"                    # Valid regions are US and EU
}