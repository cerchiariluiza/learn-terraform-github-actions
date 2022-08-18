data "aws_iam_policy_document" "lambda_assume_role_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = [
      "sts:AssumeRole",
    ]
  }
}

resource "aws_iam_role" "example" {
  name               = "role_hotel_por_randomico"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy.json # (not shown)

  inline_policy {
    name = "kms_policy"

    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action   = ["kms:ListKeys","kms:Decrypt","kms:ListAliases" ]
          Effect   = "Allow"
          Resource = "*"
        },
      ]
    })
  }

 inline_policy {
    name   = "parameters_store_policy_por_randomico"
    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action   = ["ssm:GetParametersByPath","ssm:GetParameters","ssm:GetParameter","logs:CreateLogGroup"]
          Effect   = "Allow"
          Resource = ["arn:aws:ssm:*:*:parameter/bee2pay/backend/bee2pay-payments-backend-dev-braspa/*"]
        },
      ]
    })
    
  }

   inline_policy {
    name   = "cloud_watch_policy_por_randomico"
    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action   = ["logs:CreateLogStream","logs:PutLogEvents"]
          Effect   = "Allow"
          Resource = ["arn:aws:logs:sa-east-1:754464749225:log-group:/aws/lambda/*"]
        },
      ]
    })
    
  }
   inline_policy {
    name   = "dynamodb_policy_por_randomico"
    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action   = ["dynamodb:Query","dynamodb:Scan","dynamodb:GetItem","dynamodb:PutItem","dynamodb:UpdateItem","dynamodb:DeleteItem"]
          Effect   = "Allow"
          Resource= ["arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-CommonsNestedStack-1DQELK39FA7QZ-Bee2PayTenantTable-1E9HXYVZ9I64K","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-CommonsNestedStack-1DQELK39FA7QZ-Bee2PayTenantTable-1E9HXYVZ9I64K/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsTransactionTable-1GU79I8HI5O96","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsTransactionTable-1GU79I8HI5O96/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsCredentialTable-J1PY45DZ80I0","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsCredentialTable-J1PY45DZ80I0/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsGatewayTransactionTable-RZR7LDT895C5","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsGatewayTransactionTable-RZR7LDT895C5/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsPaymentLinkTable-1N4VMLOO47KQ8","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsPaymentLinkTable-1N4VMLOO47KQ8/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsPaymentTable-1O6W8R8EH3JBK","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsPaymentTable-1O6W8R8EH3JBK/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsGatewayTransactionSplitTable-1D7NKZW7YO6OS","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsGatewayTransactionSplitTable-1D7NKZW7YO6OS/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-ChargebackNestedStack-ZN8U258TERYH-ChargebackCaseTable-HQGMO251GSO1","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-ChargebackNestedStack-ZN8U258TERYH-ChargebackCaseTable-HQGMO251GSO1/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-ChargebackNestedStack-ZN8U258TERYH-ChargebackCaseTable-HQGMO251GSO1","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-MarketplaceNestedStack-RAS04KSPT4QV-MarketplaceSellerTable-IECK87W97FNW","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-MarketplaceNestedStack-RAS04KSPT4QV-MarketplaceSellerTable-IECK87W97FNW/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-HotelReservationsNestedStack-1A3L5DNBFT5AO-Bee2PayPaymentConditionTable-26RNP5BAWZNF","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-HotelReservationsNestedStack-1A3L5DNBFT5AO-Bee2PayPaymentConditionTable-26RNP5BAWZNF/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-HotelReservationsNestedStack-1A3L5DNBFT5AO-Bee2PayHotelReservationTable-1PVHL57M83K7A","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-HotelReservationsNestedStack-1A3L5DNBFT5AO-Bee2PayHotelReservationTable-1PVHL57M83K7A/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsPaymentScheduleTable-19T0H502WZH7B","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsPaymentScheduleTable-19T0H502WZH7B/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-ZeroAuthCacheTable-1PP582MXHEZH0","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-ZeroAuthCacheTable-1PP582MXHEZH0/*"]
        },
      ]
    })
    
  }
    inline_policy {
    name   = "s3_por_randomico"
    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action   = ["dynamodb:Query","dynamodb:Scan","dynamodb:GetItem","dynamodb:PutItem","dynamodb:UpdateItem","dynamodb:DeleteItem"]
          Effect   = "Allow"
          Resource= ["arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-CommonsNestedStack-1DQELK39FA7QZ-Bee2PayTenantTable-1E9HXYVZ9I64K","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-CommonsNestedStack-1DQELK39FA7QZ-Bee2PayTenantTable-1E9HXYVZ9I64K/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsTransactionTable-1GU79I8HI5O96","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsTransactionTable-1GU79I8HI5O96/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsCredentialTable-J1PY45DZ80I0","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsCredentialTable-J1PY45DZ80I0/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsGatewayTransactionTable-RZR7LDT895C5","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsGatewayTransactionTable-RZR7LDT895C5/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsPaymentLinkTable-1N4VMLOO47KQ8","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsPaymentLinkTable-1N4VMLOO47KQ8/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsPaymentTable-1O6W8R8EH3JBK","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsPaymentTable-1O6W8R8EH3JBK/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsGatewayTransactionSplitTable-1D7NKZW7YO6OS","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsGatewayTransactionSplitTable-1D7NKZW7YO6OS/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-ChargebackNestedStack-ZN8U258TERYH-ChargebackCaseTable-HQGMO251GSO1","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-ChargebackNestedStack-ZN8U258TERYH-ChargebackCaseTable-HQGMO251GSO1/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-ChargebackNestedStack-ZN8U258TERYH-ChargebackCaseTable-HQGMO251GSO1","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-MarketplaceNestedStack-RAS04KSPT4QV-MarketplaceSellerTable-IECK87W97FNW","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-MarketplaceNestedStack-RAS04KSPT4QV-MarketplaceSellerTable-IECK87W97FNW/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-HotelReservationsNestedStack-1A3L5DNBFT5AO-Bee2PayPaymentConditionTable-26RNP5BAWZNF","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-HotelReservationsNestedStack-1A3L5DNBFT5AO-Bee2PayPaymentConditionTable-26RNP5BAWZNF/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-HotelReservationsNestedStack-1A3L5DNBFT5AO-Bee2PayHotelReservationTable-1PVHL57M83K7A","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-HotelReservationsNestedStack-1A3L5DNBFT5AO-Bee2PayHotelReservationTable-1PVHL57M83K7A/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsPaymentScheduleTable-19T0H502WZH7B","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsPaymentScheduleTable-19T0H502WZH7B/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-ZeroAuthCacheTable-1PP582MXHEZH0","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-ZeroAuthCacheTable-1PP582MXHEZH0/*"]
        },
      ]
    })
    
  }

   inline_policy {
    name   = "s3_por_randomico"
    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action   = ["dynamodb:Query","dynamodb:Scan","dynamodb:GetItem","dynamodb:PutItem","dynamodb:UpdateItem","dynamodb:DeleteItem"]
          Effect   = "Allow"
          Resource= ["arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-CommonsNestedStack-1DQELK39FA7QZ-Bee2PayTenantTable-1E9HXYVZ9I64K","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-CommonsNestedStack-1DQELK39FA7QZ-Bee2PayTenantTable-1E9HXYVZ9I64K/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsTransactionTable-1GU79I8HI5O96","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsTransactionTable-1GU79I8HI5O96/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsCredentialTable-J1PY45DZ80I0","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsCredentialTable-J1PY45DZ80I0/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsGatewayTransactionTable-RZR7LDT895C5","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsGatewayTransactionTable-RZR7LDT895C5/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsPaymentLinkTable-1N4VMLOO47KQ8","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsPaymentLinkTable-1N4VMLOO47KQ8/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsPaymentTable-1O6W8R8EH3JBK","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsPaymentTable-1O6W8R8EH3JBK/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsGatewayTransactionSplitTable-1D7NKZW7YO6OS","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsGatewayTransactionSplitTable-1D7NKZW7YO6OS/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-ChargebackNestedStack-ZN8U258TERYH-ChargebackCaseTable-HQGMO251GSO1","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-ChargebackNestedStack-ZN8U258TERYH-ChargebackCaseTable-HQGMO251GSO1/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-ChargebackNestedStack-ZN8U258TERYH-ChargebackCaseTable-HQGMO251GSO1","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-MarketplaceNestedStack-RAS04KSPT4QV-MarketplaceSellerTable-IECK87W97FNW","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-MarketplaceNestedStack-RAS04KSPT4QV-MarketplaceSellerTable-IECK87W97FNW/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-HotelReservationsNestedStack-1A3L5DNBFT5AO-Bee2PayPaymentConditionTable-26RNP5BAWZNF","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-HotelReservationsNestedStack-1A3L5DNBFT5AO-Bee2PayPaymentConditionTable-26RNP5BAWZNF/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-HotelReservationsNestedStack-1A3L5DNBFT5AO-Bee2PayHotelReservationTable-1PVHL57M83K7A","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-HotelReservationsNestedStack-1A3L5DNBFT5AO-Bee2PayHotelReservationTable-1PVHL57M83K7A/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsPaymentScheduleTable-19T0H502WZH7B","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-PaymentsPaymentScheduleTable-19T0H502WZH7B/*","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-ZeroAuthCacheTable-1PP582MXHEZH0","arn:aws:dynamodb:sa-east-1:754464749225:table/bee2pay-dynamodb-tables-dev-PaymentsNestedStack-1QH5KSY9AUK8I-ZeroAuthCacheTable-1PP582MXHEZH0/*"]
        },
      ]
    })
    
  }
}

