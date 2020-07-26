resource "aws_iam_role_policy" "mount_ebs_volumes" {
  name   = "mount-ebs-volumes"
  role   = aws_iam_role.instance_role.id
  policy = data.aws_iam_policy_document.mount_ebs_volumes.json
}

data "aws_iam_policy_document" "mount_ebs_volumes" {
  statement {
    effect = "Allow"

    actions = [
      "ec2:DescribeInstances",
      "ec2:DescribeTags",
      "ec2:DescribeVolume",
      "ec2:AttachVolume",
      "ec2:DetachVolume",
    ]
    resources = ["*"]
  }
}

resource "aws_ebs_volume" "mysql" {
  availability_zone = aws_instance.client[0].availability_zone
  size              = 40
}

output "ebs_volume" {
    value = <<EOM
# volume registration
type = "csi"
id = "mysql"
name = "mysql"
external_id = "${aws_ebs_volume.mysql.id}"
access_mode = "single-node-writer"
attachment_mode = "file-system"
plugin_id = "aws-ebs0"
EOM
}
