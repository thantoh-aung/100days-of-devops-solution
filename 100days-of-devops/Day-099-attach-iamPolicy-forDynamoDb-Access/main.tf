# -------------------------
# DynamoDB Table
# -------------------------
resource "aws_dynamodb_table" "nautilus_table" {
  name         = var.KKE_TABLE_NAME
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Name = var.KKE_TABLE_NAME
  }
}

# -------------------------
# IAM Role
# -------------------------
resource "aws_iam_role" "nautilus_role" {
  name = var.KKE_ROLE_NAME

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"   # You may use any AWS service here
      }
      Action = "sts:AssumeRole"
    }]
  })
}

# -------------------------
# IAM Policy (Read-Only Access to the Table)
# -------------------------
resource "aws_iam_policy" "nautilus_readonly_policy" {
  name = var.KKE_POLICY_NAME

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = [
        "dynamodb:GetItem",
        "dynamodb:Scan",
        "dynamodb:Query"
      ]
      Resource = aws_dynamodb_table.nautilus_table.arn
    }]
  })
}

# -------------------------
# Attach Policy to Role
# -------------------------
resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.nautilus_role.name
  policy_arn = aws_iam_policy.nautilus_readonly_policy.arn
}