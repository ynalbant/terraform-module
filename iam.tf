
##for adding users 
resource "aws_iam_user" "yunus" {
   name = "yunus"
   path = "/"
}

resource "aws_iam_user" "rana" {
   name = "rana"
   path = "/"
}
resource "aws_iam_user" "kagan" {
   name = "kagan"
   path = "/"
}

##for adding groups
 resource "aws_iam_group" "dev" {
    name = "dev"
    path = "/"
}

resource "aws_iam_group" "qa" {
    name = "qa"
    path = "/"
}
resource "aws_iam_group" "admin" {
    name = "admin"
    path = "/"
}

### for assign users to the groups 

resource "aws_iam_group_membership" "admin_team" {
  name = "admin-group-membership"
  users = [
   "${ aws_iam_user.yunus.name}" ,

  ]
  group = "${aws_iam_group.admin.name}"

}
resource "aws_iam_group_membership" "dev_team" {
  name = "dev-group-membership"
  users = [
   "${aws_iam_user.yunus.name}",
   "${aws_iam_user.rana.name}",
  ]
  group = "${aws_iam_group.dev.name}"

}
resource "aws_iam_group_membership" "qa_team" {
  name = "qa-group-membership"
  users = [
   "${aws_iam_user.yunus.name}",
   "${aws_iam_user.kagan.name}",
  ]
  group = "${aws_iam_group.qa.name}"

}


##policy


resource "aws_iam_policy" "policy" {
  name = "poweruserpolicy"
  path = "/"
  description = "power user policy"
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
}
EOF
}