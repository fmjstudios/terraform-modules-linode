# Terraform Module <img src="../resources/assets/vendor/terraform/Terraform_VerticalLogo_ColorWhite_RGB.png" width="200" align="right" />

## Vultr Object Storage

This module manages object storage buckets hosted by _Linode Inc_.

---

## 🚧 Usage

```hcl

module "linode_bucket" {
  source = "./modules/linode-object-storage"

  label      = "changeme"
  cluster    = "eu-central"
  acl        = "public-read"
  versioning = false

  key_config = {
    permissions = "public-read"
    access_key  = "WAdDXwU9rT1JsjSeOygRIoSpqOZAZRq3G1cRKw=="
    secret_key  = "s7LmHwqjlC2RITP2DKmBedohKWYs4q7G6R0ywWfIoaBINdh5kPYbgsm11b8sm/GL"
  }

  cors = {
    enabled = false
    rules   = null
  }
}

```

---

### 📜 License

**[Proprietary](./LICENSE)**

### ✉ Contact

- **Admin**: Maximilian Gindorfer
- **E-Mail**: [maximilian.gindorfer@delta4x4.com](mailto:maximilian.gindorfer@delta4x4.com)
- **Mobile**: +49 8134 93020

### © Copyright

_Assets provided by:_ **[Design Barn Inc.](https://iconscout.com)**
